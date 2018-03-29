//
//  RHURLSessionManager.h
//  Readhub
//
//  Created by lidongjie on 2018/3/16.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RHURLSessionManager : NSObject

+ (instancetype)shareInstance;

- (void)requestDataWithUrl:(NSString *)url completion:(void (^)(id))completion;

@end
