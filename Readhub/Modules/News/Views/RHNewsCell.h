//
//  RHNewsCell.h
//  Readhub
//
//  Created by Geraint on 2018/4/13.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RHNewsLayout.h"

@interface RHNewsCell : UITableViewCell

@property (nonatomic, strong, readonly) UILabel *titleLabel;
//@property (nonatomic, strong, readonly) UILabel *dateLabel;
//@property (nonatomic, strong ,readonly) UILabel *siteNameLabel;
//@property (nonatomic, strong, readonly) UILabel *authorNameLabel;

@property (nonatomic, strong, readonly) UILabel *summaryLabel; // siteNameLabel / authorNameLabel / dateLabel 三合一

@property (nonatomic, strong, readonly) RHNewsLayout *layout;


- (void)setLayout:(RHNewsLayout *)layout;

@end
