//
//  RHNewsModel.h
//  Readhub
//
//  Created by lidongjie on 2018/3/23.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "RHBaseModel.h"

// 因为这里有newsModel了，所以其他三个页面不用写他们的newsModel了（直接调用就可以）
// ***  RHNewsModel就是RHTopicModel里的数组newsArray
// newsArray里面有几条新闻，可以转换成几条RHNewsModel
@interface RHNewsModel : RHBaseModel

@property (copy, nonatomic) NSString *newsId;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *summary;
@property (copy, nonatomic) NSString *summaryAuto;
@property (copy, nonatomic) NSString *url;
@property (copy, nonatomic) NSString *mobileUrl;
@property (copy, nonatomic) NSString *siteName;
@property (copy, nonatomic) NSString *siteSlug;
@property (copy, nonatomic) NSString *authorName;
@property (copy, nonatomic) NSDate *publishDate;
@property (copy, nonatomic) NSString *language;
@property (assign, nonatomic) NSInteger groupId;
@property (assign, nonatomic) NSInteger duplicateId;

@end
