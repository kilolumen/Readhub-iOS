//
//  RHTechnewsLayout.h
//  Readhub
//
//  Created by Geraint on 2018/4/16.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RHTechnewsModel.h"

static CGFloat const kNewsCellTopMargin = 11;
static CGFloat const kNewsCellBottomMargin = 9;
static CGFloat const kNewsCellPadding = 15;
static CGFloat const kNewsCellPaddingText = 7;

#define kScreenBounds [UIScreen mainScreen].bounds
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface RHTechnewsLayout : NSObject

// 控制器（RHNewsViewController）里的【 json解析中 】会调用
- (instancetype)initWithNews:(RHTechnewsModel *)technews;
@property (nonatomic, strong) RHTechnewsModel *technews;

@property (nonatomic, assign) CGRect titleFrame;

// 换成局部变量
//@property (nonatomic, copy) NSString *dateString; // 在 .m 文件里用

@property (nonatomic, copy) NSString *summaryString; // 【内容】三合一 （date 、siteName、anthorName）
@property (nonatomic, assign) CGRect summaryFrame;   //【布局】三合一 （date、siteName、anthorName）

@property (nonatomic, assign) CGRect separatorFrame;
@property (nonatomic, assign) CGFloat height;


@end
