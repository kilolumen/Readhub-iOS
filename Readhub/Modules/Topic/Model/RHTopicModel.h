//
//  RHTopicModel.h
//  Readhub
//
//  Created by lidongjie on 2018/3/16.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "RHBaseModel.h"

@interface RHTopicModel : RHBaseModel


@property (copy, nonatomic) NSString *topicId;//这两个地方JSON里面是id，因为objective-c里面id是关键字，不能作为属性，这里我都写了topicId，eventId
@property (copy, nonatomic) NSDate *createdAt;
@property (copy, nonatomic) NSDate *updatedAt;
@property (copy, nonatomic) NSDate *publishDate;
@property (copy, nonatomic) NSString *order;
@property (copy, nonatomic) NSString *summary;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *timeline;
@property (copy, nonatomic) NSDictionary *nelData;   // 关键词(保留)
@property (copy, nonatomic) NSArray *eventData;  // 相关话题标签 @[RHEventModel]
@property (copy, nonatomic) NSArray *newsArray;   // 新闻列表  @[RHNewsModel]
@property (assign, nonatomic) BOOL instantView;  // 是否支持即时查看

@end

// 上边RHTopicModel中的eventData就是下边的RHEventModel
@interface RHEventModel: RHBaseModel

@property (copy, nonatomic) NSString *eventId; //
@property (copy, nonatomic) NSString *entityId;
@property (copy, nonatomic) NSString *eventType;
@property (copy, nonatomic) NSString *entityName;
@property (copy, nonatomic) NSString *entityType;
@property (copy, nonatomic) NSString *entityUniqueId;
@property (assign, nonatomic) NSInteger relatedTopicCount;

@end
