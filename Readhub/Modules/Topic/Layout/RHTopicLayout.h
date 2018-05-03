//
//  RHTopicLayout.h
//  Readhub
//
//  Created by lidongjie on 2018/3/29.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RHTopicModel.h"

static CGFloat const kTopicCellTopMargin = 11;
static CGFloat const kTopicCellBottomMargin = 9;
static CGFloat const kTopicCellPadding = 15;          // cell两边的边距
static CGFloat const kTopicCellPaddingText = 7;

#define kScreenBounds [UIScreen mainScreen].bounds
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface RHTopicLayout : NSObject

- (instancetype)initWithTopic:(RHTopicModel *)topic;

@property (nonatomic, strong) RHTopicModel *topic;

@property (nonatomic, assign) CGRect titleFrame;
@property (nonatomic, assign) CGRect dateFrame;
@property (nonatomic, copy) NSString *dateString;
@property (nonatomic, assign) CGRect separatorFrame;
@property (nonatomic, assign) CGFloat height;

@end
