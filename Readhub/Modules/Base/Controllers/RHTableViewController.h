//
//  RHTableViewController.h
//  Readhub
//
//  Created by lidongjie on 2018/3/29.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "RHBaseViewController.h"

@interface RHTableViewController : RHBaseViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong, readonly) UITableView *tableView;
@property (nonatomic, strong, readonly) UIRefreshControl *refreshControl;  // 刷新控件

- (void)refresh:(id)sender;

@end
