//
//  RHNewsViewController.m
//  Readhub
//
//  Created by Geraint on 2018/4/13.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "RHNewsViewController.h"
#import "RHURLSessionManager.h" //get请求
#import "RHNewssModel.h"
#import "RHNewsCell.h"

@interface RHNewsViewController ()

@property (nonatomic, strong) NSArray *newss;

@end

@implementation RHNewsViewController

//未选中状态
- (UIImage *)image {
    return [UIImage imageNamed:@"icon_news"];
}
//选中状态
- (UIImage *)selectedImage {
    return [UIImage imageNamed:@"icon_news_selected"];
}

- (NSString *)title {
    return @"科技动态";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[RHNewsCell class] forCellReuseIdentifier:@"NewsCell"];
    
    // 不会调用refresh方法，需要手动调用一次（刷新）
    [self.refreshControl beginRefreshing];
    
    [self refresh:nil]; // 调用json解析
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// json解析
- (void)refresh:(id)sender {
    // 调用 【 发送get请求方法 】
    [[RHURLSessionManager shareInstance] requestDataWithUrl:@"https://api.readhub.me/news" completion:^(id result) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            if ([result isKindOfClass:[NSDictionary class]]) {
                NSArray *data = result[@"data"];
                if ([data isKindOfClass:[NSArray class]]) {
                    NSMutableArray *newss = [NSMutableArray arrayWithCapacity:data.count];
                    [data enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                        RHNewssModel *news = [RHNewssModel modelWithJSON:obj];
                        RHNewsLayout *layout = [[RHNewsLayout alloc] initWithNews:news];
                        [newss addObject:layout];
                    }];
                    // 上面定义的
                    self.newss = newss;
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            if (self.refreshControl.isRefreshing) {
                                [self.refreshControl endRefreshing];
                            }
                        });
                        [self.tableView reloadData];
                    });
                }
            }
        });
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newss.count; // 最上面定义的数组newss
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RHNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsCell" forIndexPath:indexPath];
    [cell setLayout:self.newss[indexPath.row]];
    return cell;
}

// ???
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    RHNewsLayout *layout = self.newss[indexPath.row];
    return layout.height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
