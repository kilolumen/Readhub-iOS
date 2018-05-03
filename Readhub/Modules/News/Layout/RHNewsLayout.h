//
//  RHNewsLayout.h
//  Readhub
//
//  Created by Geraint on 2018/4/13.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RHNewssModel.h"

static CGFloat const kNewsCellTopMargin = 11;
static CGFloat const kNewsCellBottomMargin = 9;
static CGFloat const kNewsCellPadding = 15;
static CGFloat const kNewsCellPaddingText = 7;

#define kScreenBounds [UIScreen mainScreen].bounds
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface RHNewsLayout : NSObject

// 控制器（RHNewsViewController）里的【 json解析中 】会调用
- (instancetype)initWithNews:(RHNewssModel *)news;
@property (nonatomic, strong) RHNewssModel *news;

@property (nonatomic, assign) CGRect titleFrame;
//@property (nonatomic, assign) CGRect siteNameFrame;
//@property (nonatomic, assign) CGRect anthorNameFrame;
//@property (nonatomic, assign) CGRect dateFrame;
//@property (nonatomic, copy) NSString *dateString;  // 换成局部变量

@property (nonatomic, copy) NSString *summaryString; // date / siteName / authorName 三合一
@property (nonatomic, assign) CGRect summaryFrame;   // date / siteName / authorName 三合一

//@property (nonatomic, copy) NSString *siteNameString;
//@property (nonatomic, copy) NSString *anthorNameString;

@property (nonatomic, assign) CGRect separatorFrame;
@property (nonatomic, assign) CGFloat height;

@end
