//
//  NSDate+Additions.m
//  Readhub
//
//  Created by Geraint on 2018/5/3.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "NSDate+Additions.h"

@implementation NSDate (Additions)

// 把原来的C方法，改成了NSDate的实例方法，直接用NSDate的实例去调用，返回NSString
- (NSString *)convertToString {
    
    static NSDateFormatter *formatterFullDate;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatterFullDate = [[NSDateFormatter alloc] init];
        [formatterFullDate setDateFormat:@"yy-M-dd"];
        [formatterFullDate setLocale:[NSLocale currentLocale]];
    });
    
    NSDate *now = [NSDate new];
    NSTimeInterval delta = now.timeIntervalSince1970 - self.timeIntervalSince1970;
    if (delta < -60 * 10) { //本地时间有问题
        return [formatterFullDate stringFromDate:self];
    } else if (delta < 60) { // 1分钟内
        return @"刚刚";
    } else if (delta < 60 * 60) { // 1小时内
        return [NSString stringWithFormat:@"%d分钟前", (int)(delta / 60.0)];
    } else if (delta < 60 * 60 * 24) { // 1天内
        return [NSString stringWithFormat:@"%d小时前", (int)(delta / 60.0 / 60.0)];
    }else { // 几天
        return [NSString stringWithFormat:@"%d天前", (int)(delta / 60.0 / 60.0 / 24.0)];
    }
    
}

@end
