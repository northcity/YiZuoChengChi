//
//  DDDatasModel.h
//  leisure
//
//  Created by qianfeng0 on 16/2/25.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "JSONModel.h"

@interface DDDatasModel : JSONModel

@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *excerpt;
@property(nonatomic,copy)NSString *lead;
@property(nonatomic,copy)NSString *thumbnail;
@property(nonatomic,copy)NSString *create_time;
@property(nonatomic,copy)NSString *update_time;
@property(nonatomic,copy)NSString *video;
@property(nonatomic,copy)NSString *share;
@property(nonatomic,copy)NSString *comment;
@property(nonatomic,copy)NSString *good;
@property(nonatomic,copy)NSString *bookmark;
@property(nonatomic,copy)NSString *author;
@property(nonatomic,copy)NSString *category;
@property(nonatomic,copy)NSArray *tags;
@property(nonatomic,copy)NSArray *hot_comments;
@property(nonatomic,copy)NSString *view;
@property(nonatomic,copy)NSString *page_ID;

@end
