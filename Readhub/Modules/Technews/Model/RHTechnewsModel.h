//
//  RHTechnewsModel.h
//  Readhub
//
//  Created by Geraint on 2018/4/12.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "RHBaseModel.h"

@interface RHTechnewsModel : RHBaseModel


@property (copy, nonatomic) NSDate *publishDate;
@property (copy, nonatomic) NSString *technewsId;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *summary;
@property (copy, nonatomic) NSString *summaryAuto;
@property (copy, nonatomic) NSString *url;
@property (copy, nonatomic) NSString *mobileUrl;
@property (copy, nonatomic) NSString *siteName;
@property (copy, nonatomic) NSString *language;
@property (copy, nonatomic) NSString *authorName;

@end
