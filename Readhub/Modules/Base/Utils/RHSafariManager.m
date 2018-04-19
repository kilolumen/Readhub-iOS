//
//  RHSafariManager.m
//  Readhub
//
//  Created by lidongjie on 2018/3/14.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "RHSafariManager.h"
//#import <SafariServices/SafariServices.h>

@implementation RHSafariManager

/*
 今天的主人公，SFSafariViewController：
 
 iOS 9引入，更加年轻，意味着是Apple的新菜，总是有什么优势的
 也是用来显示网页内容的
 这是一个特殊的View Controller，而不是一个单独的 View，和前面两个的区别
 在当前App中使用Safari的UI框架展现Web内容，包括相同的地址栏，工具栏等，类似一个内置于App的小型Safari
 共享Safari的一些便利特性，包括：相似的用户体验，和Safari共享Cookie，iCloud Web表单数据，密码、证书自动填充，Safari阅读器（Safari Reader）
 可定制性比较差，甚至连地址栏都是不可编辑的，只能在init的时候，传入一个URL来指定网页的地址
 只能用来展示单个页面，并且有一个完成按钮用来退出 (Done)
 
 如果你的App需要显示网页，但是又不想自己去定制浏览器界面的话，可以考虑用SFSafariViewController来试试。从好的方面看，SFSafariViewController也去掉了从App中跳转到Safari的撕裂感，不同App之间切换总是让人感觉麻烦和不舒服。
 */

- (void)showWithUrl:(NSString *)url readerMode:(BOOL)readerMode tintColor:(UIColor *)tintColor barTintColor:(UIColor *)barTintColor fromBottom:(BOOL)fromBottom {
    NSURL *URL = [NSURL URLWithString:url];

    self.safariViewController = [[SFSafariViewController alloc] initWithURL:URL entersReaderIfAvailable:readerMode];
    self.safariViewController.delegate = self;
    
    if (tintColor) {
        if ([self.safariViewController respondsToSelector:@selector(setPreferredControlTintColor:)]) {
            if (@available(iOS 10.0, *)) {
                [self.safariViewController setPreferredControlTintColor:tintColor];
            }
        } else {
            [self.safariViewController.view setTintColor:tintColor];
        }
    }
    
    if (barTintColor) {
        if ([self.safariViewController respondsToSelector:@selector(setPreferredBarTintColor:)]) {
            if (@available(iOS 10.0, *)) {
                [self.safariViewController setPreferredBarTintColor:barTintColor];
            }
        }
    }
    
    if (fromBottom) {
        self.safariViewController.modalPresentationStyle = UIModalPresentationOverFullScreen;
    }
    
    UIViewController *ctrl = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    
    while (ctrl.presentedViewController && !ctrl.isBeingDismissed) {
        ctrl = ctrl.presentedViewController;
    }
    
    [ctrl presentViewController:self.safariViewController animated:YES completion:nil];
    
}

- (BOOL)isAvailable {
    if ([SFSafariViewController class]) {
        return YES;
    } else {
        return NO;
    }
}
- (void)dismiss {
    [self safariViewControllerDidFinish:self.safariViewController];
}

// // Done 按钮
- (void)safariViewControllerDidFinish:(nonnull SFSafariViewController *)controller {
    [controller dismissViewControllerAnimated:true completion:nil];
}

@end
