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
#import "RHTopicCell.h"

@interface RHTopicViewController ()

@property (nonatomic, strong) NSArray *topics;

@end

@implementation RHTopicViewController


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
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[RHTopicCell class] forCellReuseIdentifier:@"TopicCell"];
    
    [self.refreshControl beginRefreshing];  // 不会调用refresh方法，需要手动调用一次
    [self refresh:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)refresh:(id)sender {
    [[RHURLSessionManager shareInstance] requestDataWithUrl:@"https://api.readhub.me/topic" completion:^(id result) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            if ([result isKindOfClass:[NSDictionary class]]) {
                NSArray *data = result[@"data"];
                if ([data isKindOfClass:[NSArray class]]) {
                    NSMutableArray *topics = [NSMutableArray arrayWithCapacity:data.count];
                    [data enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                        RHTopicModel *topic = [RHTopicModel modelWithJSON:obj];
                        RHTopicLayout *layout = [[RHTopicLayout alloc] initWithTopic:topic];
                        [topics addObject:layout];
                    }];
                    self.topics = topics;
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
    return self.topics.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RHTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TopicCell" forIndexPath:indexPath];
    [cell setLayout:self.topics[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    RHTopicLayout *layout = self.topics[indexPath.row];
    return layout.height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
