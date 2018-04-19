//
//  RHNewssModel.m
//  Readhub
//
//  Created by Geraint on 2018/4/12.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "RHNewssModel.h"
#import "RHNewsModel.h"

static NSDate *RHNSDateFromString(NSString *string) {
    static NSDateFormatter *formatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [[NSDateFormatter alloc] init];
        formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
        formatter.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
        formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss.SSSZ";
    });
    return [formatter dateFromString:string];
}

@implementation RHNewssModel

// [详情]一个个赋值给属性：先找key（name），找到后再赋值value（_name）
// 功能:使用一个字符串标示符给一个对象的属性赋值.它支持普通对象和集合对象
- (void)setValue:(id)value forKey:(NSString *)key {
    if ([value isKindOfClass:[NSNull class]]) {
        value = nil;
    } else if ([key isEqualToString:@"publishDate"]) {
        value = RHNSDateFromString(value);
        
    }
    
    [super setValue:value forKey:key];
}

// 这里如果检测到id时，会把id对应的值，赋值给newsId
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"newsId"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }
}


@end
