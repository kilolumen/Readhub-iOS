//
//  RHTopicViewController.m
//  Readhub
//
//  Created by lidongjie on 2018/3/14.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "RHTopicViewController.h"
#import "RHURLSessionManager.h"
#import "RHTopicModel.h"

@interface RHTopicViewController ()

@end

@implementation RHTopicViewController

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}
//
- (UIImage *)image {
    return [UIImage imageNamed:@"icon_topic"];
}
//选中状态
- (UIImage *)selectedImage {
    return [UIImage imageNamed:@"icon_topic_selected"];
}

- (NSString *)title {
    return @"热门话题";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self requestData];  //在viewDidLoad里面设置的NSURLSession调用
    
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [[RHURLSessionManager shareInstance] requestDataWithUrl:@"https://api.readhub.me/topic" completion:^(id result) {
        
        if ([result isKindOfClass:[NSDictionary class]]) {
            NSArray *data = result[@"data"];
            if ([data isKindOfClass:[NSArray class]]) {
                NSMutableArray *models = [NSMutableArray arrayWithCapacity:data.count];
                [data enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    [models addObject:[RHTopicModel modelWithJSON:obj]];
                }];
                NSLog(@"%@", models);
            }
        }
    }];
   
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

//发送get请求：
- (void)requestData {
    //1.创建NSURLSession对象（可以获取单例对象）
    NSURLSession *session = [NSURLSession sharedSession];
    
    //2.根据NSURLSession对象创建一个Task
    
    NSURL *url = [NSURL URLWithString:@"https://api.readhub.me/topic"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //方法参数说明
    /*
     注意：该block是在子线程中调用的，如果拿到数据之后要做一些UI刷新操作，那么需要回到主线程刷新
     第一个参数：需要发送的请求对象
     block:当请求结束拿到服务器响应的数据时调用block
     block-NSData:该请求的响应体
     block-NSURLResponse:存放本次请求的响应信息，响应头，真实类型为NSHTTPURLResponse
     block-NSErroe:请求错误信息
     */
    NSURLSessionDataTask * dataTask =  [session dataTaskWithRequest:request completionHandler:^(NSData * __nullable data, NSURLResponse * __nullable response, NSError * __nullable error) {
        
        //拿到响应头信息
        NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
        
        //4.解析拿到的响应数据
        NSLog(@"%@\n%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding],res.allHeaderFields);
    }];
    
    //3.执行Task
    //注意：刚创建出来的task默认是挂起状态的，需要调用该方法来启动任务（执行任务）
    [dataTask resume];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
