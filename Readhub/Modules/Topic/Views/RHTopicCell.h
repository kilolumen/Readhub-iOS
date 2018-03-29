//
//  RHTopicCell.h
//  Readhub
//
//  Created by lidongjie on 2018/3/29.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RHTopicLayout.h"

@interface RHTopicCell : UITableViewCell

@property (nonatomic, strong, readonly) UILabel *titleLabel;
@property (nonatomic, strong, readonly) UILabel *dateLabel;
@property (nonatomic, strong, readonly) RHTopicLayout *layout;

- (void)setLayout:(RHTopicLayout *)layout;

@end
