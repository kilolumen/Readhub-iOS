//
//  RHNewsCell.m
//  Readhub
//
//  Created by Geraint on 2018/4/13.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "RHNewsCell.h"

// ？？？
@interface RHNewsCell ()

@property (nonatomic, strong) UILabel *titleLabel;
//@property (nonatomic, strong) UILabel *dateLabel;
//@property (nonatomic, strong) UILabel *siteNameLabel;
//@property (nonatomic, strong) UILabel *anthorNameLabel;

@property (nonatomic, strong) UILabel *summaryLabel; // 三合一

@property (nonatomic, strong) UIView *separator;
@property (nonatomic, strong) RHNewsLayout *layout;

@end

@implementation RHNewsCell

// ???
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    // ???
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 小标题
        self.titleLabel = [[UILabel alloc] init];
        // 字体
        self.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        self.titleLabel.textColor = [UIColor blackColor];
        // 设置text行数（为0时，没有最大行数限制）
        self.titleLabel.numberOfLines = 0;
        // 靠左（字体居中）
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
        // 添加到视图
        [self.contentView addSubview:self.titleLabel];
        
        
        /*
        self.siteNameLabel = [[UILabel alloc] init];
        self.siteNameLabel.font = [UIFont systemFontOfSize:13.0f];
        self.siteNameLabel.textColor = [UIColor colorWithWhite:0 alpha:0.5];
        self.siteNameLabel.numberOfLines = 1;
        self.siteNameLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:self.siteNameLabel];

        self.anthorNameLabel = [[UILabel alloc] init];
        self.anthorNameLabel.font = [UIFont systemFontOfSize:13.0f];
        self.anthorNameLabel.textColor = [UIColor colorWithWhite:0 alpha:0.5];
        self.anthorNameLabel.numberOfLines = 1;
        self.anthorNameLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:self.anthorNameLabel];
        
        // 时间
        self.dateLabel = [[UILabel alloc] init];
        self.dateLabel.font = [UIFont systemFontOfSize:13.0f];
        self.dateLabel.textColor = [UIColor colorWithWhite:0 alpha:0.5];
        self.dateLabel.numberOfLines = 1;
        self.dateLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:self.dateLabel];
        */
        
         // 三合一
         self.summaryLabel = [[UILabel alloc] init];
         self.summaryLabel.font = [UIFont systemFontOfSize:13.0f];
         self.summaryLabel.textColor = [UIColor colorWithWhite:0 alpha:0.5];
         self.summaryLabel.numberOfLines = 1;
         self.summaryLabel.textAlignment = NSTextAlignmentLeft;
         [self.contentView addSubview:self.summaryLabel];
        
        
         
        // 分割线
        self.separator = [[UIView alloc] init];
        self.separator.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
        [self.contentView addSubview:self.separator];
    }
    
    return self;
}

- (void)prepareForReuse {
    [super prepareForReuse];
}

//  将Model里面的变量 赋值 到cell上
- (void)setLayout:(RHNewsLayout *)layout {
    _layout = layout;
    
    self.titleLabel.text = layout.news.title;
    //self.siteNameLabel.text = layout.news.siteName;
    //self.anthorNameLabel.text = layout.news.authorName;
    //self.dateLabel.text = layout.dateString;
    
    
    //layout.summaryString = [NSString stringWithFormat:@"%@ / %@ · %@",layout.news.siteName,layout.news.authorName,layout.dateString];
    // 三合一
    self.summaryLabel.text = layout.summaryString;  // 三合一
    
    self.titleLabel.frame = layout.titleFrame;
    //self.siteNameLabel.frame = layout.siteNameFrame;
    //self.anthorNameLabel.frame = layout.anthorNameFrame;
    self.summaryLabel.frame = layout.summaryFrame;  // 三合一
    self.separator.frame = layout.separatorFrame;
}

@end
