//
//  RHBaseModel.h
//  Readhub
//
//  Created by lidongjie on 2018/3/19.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RHBaseModel : NSObject

+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary;
+ (instancetype)modelWithJSON:(id)json;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (instancetype)initWithJSON:(id)json;

@end
