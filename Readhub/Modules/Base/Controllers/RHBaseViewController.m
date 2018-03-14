//
//  RHBaseViewController.m
//  Readhub
//
//  Created by lidongjie on 2018/3/14.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "RHBaseViewController.h"

@interface RHBaseViewController ()

@end

@implementation RHBaseViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        [self.tabBarItem setImage:self.image];
        [self.tabBarItem setSelectedImage:self.selectedImage];
        self.tabBarItem.imageInsets = UIEdgeInsetsMake(-5, 0, 0, 0);
    }
    return self;
}

- (UIImage *)image {
    return nil;
}

- (UIImage *)selectedImage {
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
