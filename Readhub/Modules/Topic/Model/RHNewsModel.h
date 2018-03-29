//
//  RHNewsModel.h
//  Readhub
//
//  Created by lidongjie on 2018/3/23.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "RHBaseModel.h"

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
@property (copy, nonatomic) NSString *publishDate;
@property (copy, nonatomic) NSString *language;
@property (assign, nonatomic) NSInteger groupId;
@property (assign, nonatomic) NSInteger duplicateId;

@end
