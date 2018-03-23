//
//  RHNewsModel.m
//  Readhub
//
//  Created by lidongjie on 2018/3/23.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "RHNewsModel.h"

@implementation RHNewsModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"newsId"];
    } else {
        [super setValue:value forKey:key];
    }
}

@end
