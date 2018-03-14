//
//  RHSafariManager.h
//  Readhub
//
//  Created by lidongjie on 2018/3/14.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import <Foundation/Foundation.h>

@import SafariServices;

@interface RHSafariManager : NSObject <SFSafariViewControllerDelegate>

@property (nonatomic, strong) SFSafariViewController *safariViewController;

@end
