//
//  RHBaseModel.m
//  Readhub
//
//  Created by lidongjie on 2018/3/19.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "RHBaseModel.h"

@implementation RHBaseModel

+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary {
    return [[self alloc] initWithDictionary:dictionary];
}

+ (instancetype)modelWithJSON:(id)json {
    return [[self alloc] initWithJSON:json];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        if ([dictionary isKindOfClass:[NSDictionary class]]) {
            [self setValuesForKeysWithDictionary:dictionary];
        }
    }
    return self;
}

- (instancetype)initWithJSON:(id)json {
    NSDictionary *dict = [self dictionaryWithJSON:json];
    return [self initWithDictionary:dict];
}

- (NSDictionary *)dictionaryWithJSON:(id)json {
    if (!json || json == (id)kCFNull) return nil;
    NSDictionary *dic = nil;
    NSData *jsonData = nil;
    if ([json isKindOfClass:[NSDictionary class]]) {
        dic = json;
    } else if ([json isKindOfClass:[NSString class]]) {
        jsonData = [(NSString *)json dataUsingEncoding : NSUTF8StringEncoding];
    } else if ([json isKindOfClass:[NSData class]]) {
        jsonData = json;
    }
    if (jsonData) {
        dic = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:NULL];
        if (![dic isKindOfClass:[NSDictionary class]]) dic = nil;
    }
    return dic;
}

- (id)valueForUndefinedKey:(NSString *)key {
    NSLog(@"%@, key: %@ 不存在", self, key);
    return nil;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"%@, value: %@, key: %@", self, value, key);
}

- (void)setNilValueForKey:(NSString *)key {
    NSLog(@"%@, key: %@ 不能设为nil", self, key);
}

@end
