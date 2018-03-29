//
//  AppDelegate.m
//  Readhub
//
//  Created by lidongjie on 2018/2/8.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "AppDelegate.h"
#import "RHTabBarController.h"
#import "RHNavigationController.h"
#import "RHTopicViewController.h"
#import "RHNewsViewController.h"
#import "RHTechnewsViewController.h"
#import "RHBlockchainViewController.h"
#import "UIImage+Additions.h"

@interface AppDelegate ()

@property (strong, nonatomic) RHTabBarController *rootViewController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self setupAppAppearence];  //调用
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    // 建立底视图 
    self.window.rootViewController = self.rootViewController;
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
}


- (void)applicationWillTerminate:(UIApplication *)application {
}

- (RHTabBarController *)rootViewController {
    if (!_rootViewController) {
        _rootViewController = [[RHTabBarController alloc] init];
        
        RHTopicViewController *topicViewController = [[RHTopicViewController alloc] init];
        RHNavigationController *topicNavigationController = [[RHNavigationController alloc] initWithRootViewController:topicViewController];
        
        RHNewsViewController *newsViewController = [[RHNewsViewController alloc] init];
        RHNavigationController *newsNavigationController = [[RHNavigationController alloc] initWithRootViewController:newsViewController];

        RHTechnewsViewController *technewsViewController = [[RHTechnewsViewController alloc] init];
        RHNavigationController *technewsNavigationController = [[RHNavigationController alloc] initWithRootViewController:technewsViewController];

        RHBlockchainViewController *blockchainViewController = [[RHBlockchainViewController alloc] init];
        RHNavigationController *blockchainNavigationController = [[RHNavigationController alloc] initWithRootViewController:blockchainViewController];

        _rootViewController.viewControllers = @[topicNavigationController, newsNavigationController, technewsNavigationController, blockchainNavigationController];
    }

    return _rootViewController;
}

- (void)setupAppAppearence {
    //去掉黑条
//    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]]
//                                      forBarPosition:UIBarPositionAny
//                                          barMetrics:UIBarMetricsDefault];
//    [[UINavigationBar appearance] setShadowImage:[UIImage imageWithColor:[UIColor whiteColor]]];
    
    // 设置导航条title的字体 //HEXCOLOR(0x40320D)
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                           NSFontAttributeName : [UIFont boldSystemFontOfSize:16],
                                                           NSForegroundColorAttributeName : [UIColor colorWithRed:64 / 255.0 green:50 / 255.0 blue:13 / 255.0 alpha:1.0]
                                                           }];
    // 设置导航条背景颜色
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    // 设置导航条返回按钮颜色
    [[UINavigationBar appearance]
     setTintColor:[UIColor colorWithRed:64 / 255.0 green:50 / 255.0 blue:13 / 255.0 alpha:1.0]];
    // 设置导航条为不透明，提高性能，减少naviBar的层次，UIViewController的extendedLayoutIncludesOpaqueBars属性与此有关
    [[UINavigationBar appearance] setTranslucent:NO];
    // 设置返回按钮图片
    UIImage *backIndicator =
    [[UIImage imageNamed:@"backIndicator"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [UINavigationBar appearance].backIndicatorImage = backIndicator;
    [UINavigationBar appearance].backIndicatorTransitionMaskImage = backIndicator;
    
    // 将返回按钮的文字position设置不在屏幕上显示
    [[UIBarButtonItem appearance]
     setBackButtonTitlePositionAdjustment:UIOffsetMake(-[UIScreen mainScreen].bounds.size.width * 2, 0)
     forBarMetrics:UIBarMetricsDefault];
    
    // 设置TabBarItem文字，偏移量
//    [[UITabBarItem appearance] setTitleTextAttributes:@{} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitlePositionAdjustment:UIOffsetMake(0, -2)];
}

@end
