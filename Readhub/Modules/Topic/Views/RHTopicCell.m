//
//  RHTopicCell.m
//  Readhub
//
//  Created by lidongjie on 2018/3/29.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "RHTopicCell.h"

@interface RHTopicCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UIView *separator;
@property (nonatomic, strong) RHTopicLayout *layout;

@end

@implementation RHTopicCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:self.titleLabel];
        
        self.dateLabel = [[UILabel alloc] init];
        self.dateLabel.font = [UIFont systemFontOfSize:13.0f];
        self.dateLabel.textColor = [UIColor colorWithWhite:0 alpha:0.5];
        self.dateLabel.numberOfLines = 1;
        self.dateLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:self.dateLabel];
        
        self.separator = [[UIView alloc] init];
        self.separator.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
        [self.contentView addSubview:self.separator];
    }
    return self;
}

- (void)prepareForReuse {
    [super prepareForReuse];
}

- (void)setLayout:(RHTopicLayout *)layout {
    _layout = layout;
    
    self.titleLabel.text = layout.topic.title;
    self.dateLabel.text = layout.dateString;
    
    self.titleLabel.frame = layout.titleFrame;
    self.dateLabel.frame = layout.dateFrame;
    self.separator.frame = layout.separatorFrame;
}

@end

