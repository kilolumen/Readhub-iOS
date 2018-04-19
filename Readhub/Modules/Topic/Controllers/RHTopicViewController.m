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

// 通过扩展声明，提供属性
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
    
    [self.refreshControl beginRefreshing];  // 不会调用refresh方法，需要手动调用一次(刷新)
    [self refresh:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// 继承父类的方法；json解析（GCD）
- (void)refresh:(id)sender {
    [[RHURLSessionManager shareInstance] requestDataWithUrl:@"https://api.readhub.me/topic" completion:^(id result) {
        
        // 因为这里解析数据并计算frame和时间转换会比较耗时，如果在主队列中进行这些，会产生UI卡顿，所以一般耗时的操作会放到全局队列或自己创建一个子队列进行
        //dispatch_get_global_queue 会获取一个全局队列，我们姑且理解为系统为我们开启的一些全局线程。我们用priority指定队列的优先级，而flag作为保留字段备用（一般为0）。
        //dispatch_get_main_queue 会返回主队列，也就是UI队列。它一般用于在其它队列中异步完成了一些工作后，需要在UI队列中更新界面（比如上面代码中的[self updateUIWithResult:result]）的情况。
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

// 这个方法返回   对应的section有多少个元素，也就是多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.topics.count;
}

/*
  返回指定的row 的cell。这个地方是比较关键的地方，一般在这个地方来定制各种个性化的 cell元素。
  这里只是使用最简单最基本的cell 类型。其中有一个主标题 cell.textLabel 还有一个副标题cell.detailTextLabel,
  有一个 image在最前头 叫cell.imageView.
  还可以设置右边的图标，通过cell.accessoryType 可以设置是饱满的向右的蓝色箭头，还是单薄的向右箭头，还是勾勾标记。
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RHTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TopicCell" forIndexPath:indexPath];
    [cell setLayout:self.topics[indexPath.row]];
    return cell;
}

// 这个方法返回指定的 row 的高度。
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    RHTopicLayout *layout = self.topics[indexPath.row];
    return layout.height;
}

// 当用户选中某个行的cell的时候，回调用这个。但是首先，必须设置tableview的一个属性为可以select 才行。
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
