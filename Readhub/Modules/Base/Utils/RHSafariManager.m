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

- (void)safariViewControllerDidFinish:(nonnull SFSafariViewController *)controller {
    [controller dismissViewControllerAnimated:true completion:nil];
}

@end
