//
//  RHTopicCell.h
//  Readhub
//
//  Created by lidongjie on 2018/3/29.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RHTopicLayout.h"

@interface RHTopicCell : UITableViewCell

// 属性在.h文件中和在.m中声明是有区别的。区别就是，在.h文件中声明的属性，外部类可以通过“类实例.属性”来调用，但在.m中声明的则不可以，获取和设置的方法，只能是通过setValue:forKey和valueForKey来实现。
@property (nonatomic, strong, readonly) UILabel *titleLabel;
@property (nonatomic, strong, readonly) UILabel *dateLabel;
@property (nonatomic, strong, readonly) RHTopicLayout *layout;

- (void)setLayout:(RHTopicLayout *)layout;

@end
