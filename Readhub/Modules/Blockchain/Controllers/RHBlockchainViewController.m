//
//  RHBlockchainViewController.m
//  Readhub
//
//  Created by lidongjie on 2018/3/14.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "RHBlockchainViewController.h"

@interface RHBlockchainViewController ()

@end

@implementation RHBlockchainViewController

-(instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}
//未选中状态
- (UIImage *)image {
    return [UIImage imageNamed:@"icon_blockchain"];
}
//选中状态
- (UIImage *)selectedImage {
    return [UIImage imageNamed:@"icon_blockchain_selected"];
}

- (NSString *)title {
    return @"区块链快讯";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
