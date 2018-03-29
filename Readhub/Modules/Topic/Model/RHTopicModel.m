//
//  RHTopicModel.m
//  Readhub
//
//  Created by lidongjie on 2018/3/16.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "RHTopicModel.h"
#import "RHNewsModel.h"

@implementation RHTopicModel

- (void)setValue:(id)value forKey:(NSString *)key {
    if ([value isKindOfClass:[NSNull class]]) {
        value = nil;
    } else if ([key isEqualToString:@"newsArray"]) {
        if ([value isKindOfClass:[NSArray class]]) {
            NSMutableArray *newsArray = [NSMutableArray array];
            [(NSArray *)value enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [newsArray addObject:[RHNewsModel modelWithJSON:obj]];
            }];
            value = newsArray;
        }
    } else if ([key isEqualToString:@"eventData"]) {
        if ([value isKindOfClass:[NSDictionary class]] && [value[@"result"] isKindOfClass:[NSArray class]]) {
            NSMutableArray *eventsArray = [NSMutableArray array];
            [(NSArray *)value[@"result"] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [eventsArray addObject:[RHEventModel modelWithJSON:obj]];
            }];
            value = eventsArray;
        }
    }
    [super setValue:value forKey:key];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"topicId"];
    } else if ([key isEqualToString:@"extra"] && [value isKindOfClass:[NSDictionary class]]) {
        [self setValue:value[@"instantView"] forKey:@"instantView"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }
}

@end


@implementation RHEventModel

@end
