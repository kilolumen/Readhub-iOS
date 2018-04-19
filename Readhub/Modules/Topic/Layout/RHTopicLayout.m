//
//  RHTopicLayout.m
//  Readhub
//
//  Created by lidongjie on 2018/3/29.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "RHTopicLayout.h"
#import "NSDate+Additions.h"

/*
// 时间 写出“几天前”的样式:
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
    if (delta < -60 * 10) { // 本地时间有问题
        return [formatterFullDate stringFromDate:date];
    } else if (delta < 60) { // 1分钟内
        return @"刚刚";
    } else if (delta < 60 * 60) { // 1小时内
        return [NSString stringWithFormat:@"%d分钟前", (int)(delta / 60.0)];
    } else if (delta < 60 * 60 * 24) {  // 1天内
        return [NSString stringWithFormat:@"%d小时前", (int)(delta / 60.0 / 60.0)];
    } else {
        return [NSString stringWithFormat:@"%d天前", (int)(delta / 60.0 / 60.0 / 24.0)];
    }
}
*/

@implementation RHTopicLayout

- (instancetype)initWithTopic:(RHTopicModel *)topic {
    self = [super init];
    if (self) {
        _topic = topic;
        
        [self compute];
    }
    return self;
}

- (void)compute {
    CGFloat titleWidth = kScreenWidth - kTopicCellPadding * 2;
    CGFloat titleHeight = [self.topic.title boundingRectWithSize:CGSizeMake(titleWidth, 1000) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15.0f]} context:nil].size.height;
    _titleFrame = CGRectMake(kTopicCellPadding, kTopicCellTopMargin, titleWidth, titleHeight);
    
    //_dateString = RHStringWithDate(self.topic.publishDate); // 这行用上面的NSDate全局变量
    _dateString = [self.topic.publishDate convertToString];
    
    CGSize dateSize = [_dateString boundingRectWithSize:CGSizeMake(200, 20) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:13.0f]} context:nil].size;
    _dateFrame = CGRectMake(kTopicCellPadding, CGRectGetMaxY(_titleFrame) + kTopicCellPaddingText, dateSize.width, dateSize.height);
    
    _height = CGRectGetMaxY(_dateFrame) + kTopicCellBottomMargin;
    
    _separatorFrame = CGRectMake(kTopicCellPadding, _height - 1, titleWidth, 1);
}

@end
