//
//  RHTechnewsCell.h
//  Readhub
//
//  Created by Geraint on 2018/4/16.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RHTechnewsLayout.h"

@interface RHTechnewsCell : UITableViewCell

@property (nonatomic, strong, readonly) UILabel *titleLabel;

@property (nonatomic, strong, readonly) UILabel *summaryLabel; // siteNameLabel / authorNameLabel / dateLabel 三合一

@property (nonatomic, strong, readonly) RHTechnewsLayout *layout;

- (void)setLayout:(RHTechnewsLayout *)layout;

@end
