//
//  RHTechnewsCell.m
//  Readhub
//
//  Created by Geraint on 2018/4/16.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "RHTechnewsCell.h"

// ？？？
@interface RHTechnewsCell ()

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *summaryLabel; // 三合一

@property (nonatomic, strong) UIView *separator;
@property (nonatomic, strong) RHTechnewsLayout *layout;

@end

@implementation RHTechnewsCell

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
- (void)setLayout:(RHTechnewsLayout *)layout {
    _layout = layout;
    
    self.titleLabel.text = layout.technews.title;
    
    // 三合一  （位置放在同一个label上）
    self.summaryLabel.text = layout.summaryString;
    
    self.titleLabel.frame = layout.titleFrame;
    self.summaryLabel.frame = layout.summaryFrame;
    self.separator.frame = layout.separatorFrame;
}

@end
