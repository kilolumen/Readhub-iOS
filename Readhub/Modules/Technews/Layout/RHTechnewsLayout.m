//
//  RHTechnewsLayout.m
//  Readhub
//
//  Created by Geraint on 2018/4/16.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "RHTechnewsLayout.h"
#import "NSDate+Additions.h"

@implementation RHTechnewsLayout

- (instancetype)initWithNews:(RHTechnewsModel *)technews {
    self = [super init];
    if (self) {
        _technews = technews;
        
        [self compute];
    }
    return self;
}

// Cell布局
- (void)compute {
    
    CGFloat titleWidth = kScreenWidth - kNewsCellPadding * 2;
    CGFloat titleHeight = [self.technews.title boundingRectWithSize:CGSizeMake(titleWidth, 1000) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0f]} context:nil].size.height;
    _titleFrame = CGRectMake(kNewsCellPadding, kNewsCellTopMargin, titleWidth, titleHeight);
    
    // 先确定时间:（调用 NSDate+Additions.m 文件中的方法）
    // 写成 局部变量，（局部变量在这用完就释放掉了，属性变量会一直持有）
    NSString  *dateString = [self.technews.publishDate convertToString];
    
    // 三合一（siteName和anthorName和date）
    // summaryString 是在 RHNewsLayout.h 里定义的
    if (_technews.siteName == nil && _technews.authorName != nil) {
        _summaryString = [NSString stringWithFormat:@"%@ · %@",_technews.authorName,dateString];
    } else if (_technews.siteName != nil && _technews.authorName == nil) {
        _summaryString = [NSString stringWithFormat:@"%@ · %@",_technews.siteName,dateString];
    } else if (_technews.siteName == nil && _technews.authorName == nil) {
        _summaryString = [NSString stringWithFormat:@"%@",dateString];
    } else {
        _summaryString = [NSString stringWithFormat:@"%@ / %@ · %@",_technews.siteName,_technews.authorName,dateString];
    }
    // 将date、siteName、anthorName （三合一） 布局：
    CGSize dateSize = [_summaryString boundingRectWithSize:CGSizeMake(kScreenWidth - kNewsCellPadding * 2, 20) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:13.0f]} context:nil].size;
    _summaryFrame = CGRectMake(kNewsCellPadding, CGRectGetMaxY(_titleFrame) + kNewsCellPaddingText, dateSize.width + 200, dateSize.height);
    
    _height = CGRectGetMaxY(_summaryFrame) + kNewsCellBottomMargin;
    
    // 单个cell四个边到上下（两个cell之间）左右（两边）边界之间的距离
    _separatorFrame = CGRectMake(kNewsCellPadding, _height - 1, titleWidth, 1);
}

@end
