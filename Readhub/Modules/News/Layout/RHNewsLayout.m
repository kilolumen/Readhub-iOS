//
//  RHNewsLayout.m
//  Readhub
//
//  Created by Geraint on 2018/4/13.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "RHNewsLayout.h"
#import "NSDate+Additions.h"

/*
static NSString *RHStringWithDate(NSDate *date) {
    if (!date) return @"";
    
    static NSDateFormatter *formatterFullDate;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatterFullDate = [[NSDateFormatter alloc] init];
        [formatterFullDate setDateFormat:@"yy-M-dd"];
        [formatterFullDate setLocale:[NSLocale currentLocale]];
    });
    
    NSDate *now = [NSDate new];
    NSTimeInterval delta = now.timeIntervalSince1970 - date.timeIntervalSince1970;
    if (delta < -60 * 10) { //本地时间有问题
        return [formatterFullDate stringFromDate:date];
    } else if (delta < 60) { // 1分钟内
        return @"刚刚";
    } else if (delta < 60 * 60) { // 1小时内
        return [NSString stringWithFormat:@"%d分钟前", (int)(delta / 60.0)];
    } else if (delta < 60 * 60 * 24) { // 1天内
        return [NSString stringWithFormat:@"%d小时前", (int)(delta / 60.0 / 60.0)];
    }else { //
        return [NSString stringWithFormat:@"%d天前", (int)(delta / 60.0 / 60.0 / 24.0)];
    }
}
 */

@implementation RHNewsLayout

- (instancetype)initWithNews:(RHNewssModel *)news {
    self = [super init];
    if (self) {
        _news = news;
        
        [self compute];
    }
    return self;
}

// Cell布局
- (void)compute {
    
    CGFloat titleWidth = kScreenWidth - kNewsCellPadding * 2;
    CGFloat titleHeight = [self.news.title boundingRectWithSize:CGSizeMake(titleWidth, 1000) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0f]} context:nil].size.height;
    _titleFrame = CGRectMake(kNewsCellPadding, kNewsCellTopMargin, titleWidth, titleHeight);
    
    // siteName 的布局
    /*
    CGSize siteNameSize = [_siteNameString boundingRectWithSize:CGSizeMake(200, 20) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:13.0f]} context:nil].size;
    _siteNameFrame = CGRectMake(kNewsCellPadding, CGRectGetMaxY(_titleFrame) + kNewsCellPaddingText, siteNameSize.width, siteNameSize.height);
    
    CGSize anthorNameSize = [_anthorNameString boundingRectWithSize:CGSizeMake(200, 20) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:13.0f]} context:nil].size;
    _anthorNameFrame = CGRectMake(CGRectGetMidX(_siteNameFrame) + kNewsCellPadding, CGRectGetMaxY(_titleFrame) + kNewsCellPaddingText, anthorNameSize.width, anthorNameSize.height);
    
     // 时间
    _dateString = RHStringWithDate(self.news.publishDate);
    CGSize dateSize = [_dateString boundingRectWithSize:CGSizeMake(200, 20) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:13.0f]} context:nil].size;
     */
    
    // 先确定时间
    // 写成 局部变量，（局部变量在这用完就释放掉了，属性变量会一直持有）
    NSString  *dateString = [self.news.publishDate convertToString];
    
    // 三合一（siteName和anthorName和date）
    // summaryString 是在 RHNewsLayout.h 里定义的
    if (_news.siteName == nil && _news.authorName != nil) {
        _summaryString = [NSString stringWithFormat:@"%@ · %@",_news.authorName,dateString];
    } else if (_news.siteName != nil && _news.authorName == nil) {
        _summaryString = [NSString stringWithFormat:@"%@ · %@",_news.siteName,dateString];
    } else if (_news.siteName == nil && _news.authorName == nil) {
        _summaryString = [NSString stringWithFormat:@"%@",dateString];
    } else {
        _summaryString = [NSString stringWithFormat:@"%@ / %@ · %@",_news.siteName,_news.authorName,dateString];
    }
    // 将date、siteName、anthorName （三合一） 布局： (宽 , 高)
    CGSize dateSize = [_summaryString boundingRectWithSize:CGSizeMake(kScreenWidth - kNewsCellPadding * 2, 20) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:13.0f]} context:nil].size;
    _summaryFrame = CGRectMake(kNewsCellPadding, CGRectGetMaxY(_titleFrame) + kNewsCellPaddingText, dateSize.width, dateSize.height);
    
    //_dateFrame = CGRectMake(CGRectGetMidX(_anthorNameFrame) + kNewsCellPadding, CGRectGetMaxY(_titleFrame) + kNewsCellPaddingText, dateSize.width, dateSize.height);
    
    _height = CGRectGetMaxY(_summaryFrame) + kNewsCellBottomMargin;
    
    // 单个cell四个边到上下（两个cell之间）左右（两边）边界之间的距离
    _separatorFrame = CGRectMake(kNewsCellPadding, _height - 1, titleWidth, 1);
}

@end
