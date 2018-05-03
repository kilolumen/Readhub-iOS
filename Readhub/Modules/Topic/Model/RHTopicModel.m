//
//  RHTopicModel.m
//  Readhub
//
//  Created by lidongjie on 2018/3/16.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "RHTopicModel.h"
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

//
@implementation RHTopicModel

// 一个个赋值给属性：先找key（name），找到后再赋值value（_name）
- (void)setValue:(id)value forKey:(NSString *)key {
    if ([value isKindOfClass:[NSNull class]]) {
        value = nil;
    } else if ([key isEqualToString:@"newsArray"]) {
        
        // 判断上面三个是否是 字典(数组) !
        if ([value isKindOfClass:[NSArray class]]) {
            NSMutableArray *newsArray = [NSMutableArray array];
            [(NSArray *)value enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [newsArray addObject:[RHNewsModel modelWithJSON:obj]];
            }];
            value = newsArray;
        }
    } else if ([key isEqualToString:@"eventData"]) {
        
        // 判断上面三个是否是 字典(数组) !
        if ([value isKindOfClass:[NSDictionary class]] && [value[@"result"] isKindOfClass:[NSArray class]]) {
            NSMutableArray *eventsArray = [NSMutableArray array];
            [(NSArray *)value[@"result"] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [eventsArray addObject:[RHEventModel modelWithJSON:obj]];
            }];
            value = eventsArray;
        }
        
    } else if ([key isEqualToString:@"createdAt"] ||
               [key isEqualToString:@"updatedAt"] ||
               [key isEqualToString:@"publishDate"]) {
        value = RHNSDateFromString(value);
    }
    
    [super setValue:value forKey:key];
}

// 这里如果检测到id时，会把id对应的值，赋值给topicId
// 在json状态下，“extra”含有一些数据，里面的数据instantView，和id、title不同级
// 这里的value就是extra所对应的字典 @{@"instantView": true}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"topicId"];
    } else if ([key isEqualToString:@"extra"] && [value isKindOfClass:[NSDictionary class]]) {
        [self setValue:value[@"instantView"] forKey:@"instantView"]; // 第二个“instantView”是.h文件里定义的。
    } else {
        [super setValue:value forUndefinedKey:key];
    }
}

@end

// RHEventModel
@implementation RHEventModel

 - (void)setValue:(id)value forUndefinedKey:(NSString *)key {
     if ([key isEqualToString:@"id"]) {
         [self setValue:value forKey:@"eventId"];
     }else {
         [super setValue:value forUndefinedKey:key];
     }
     
 }


@end
