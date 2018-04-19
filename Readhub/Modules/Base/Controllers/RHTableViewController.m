//
//  RHTableViewController.m
//  Readhub
//
//  Created by lidongjie on 2018/3/29.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "RHTableViewController.h"

@interface RHTableViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIRefreshControl *refreshControl; // 刷新控件

@end

@implementation RHTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // style 是用来传入表视图的样式，分为：简单样式 UITableViewStylePlain ，和 分组样式：UITableViewStyleGrouped
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
    // 刷新控件 （原生的控件）
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:self.refreshControl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0; // 子类实现
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [UITableViewCell new]; //子类实现
}

- (void)refresh:(id)sender {
    // 子类实现
}

@end
