//
//  RHURLSessionManager.m
//  Readhub
//
//  Created by lidongjie on 2018/3/16.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "RHURLSessionManager.h"


@implementation RHURLSessionManager

+ (instancetype)shareInstance {
    static RHURLSessionManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[RHURLSessionManager alloc] init];
    });
    return instance;
}

// 发送get请求 URL加载
- (void)requestDataWithUrl:(NSString *)url completion:(void (^)(id))completion {

    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURL *URL = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask * dataTask =  [session dataTaskWithRequest:request completionHandler:^(NSData * __nullable data, NSURLResponse * __nullable response, NSError * __nullable error) {
        NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        if (completion) {
            completion(result);
        }
    }];
    [dataTask resume];
}

@end
