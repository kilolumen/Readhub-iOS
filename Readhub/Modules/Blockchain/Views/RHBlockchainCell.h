//
//  RHBlockchainCell.h
//  Readhub
//
//  Created by Geraint on 2018/4/16.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RHBlockchainLayout.h"

@interface RHBlockchainCell : UITableViewCell

@property (nonatomic, strong, readonly) UILabel *titleLabel;

@property (nonatomic, strong, readonly) UILabel *summaryLabel;  // 三合一

@property (nonatomic, strong, readonly) RHBlockchainLayout *layout;

- (void)setLayout:(RHBlockchainLayout *)layout;
@end
