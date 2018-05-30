//
//  LXSMModel.h
//  leisure
//
//  Created by qianfeng0 on 16/2/28.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "JSONModel.h"

@interface LXSMModel : JSONModel


@property(nonatomic,copy)NSString *pageID;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *intro;
@property(nonatomic,copy)NSString *count_play;
@property(nonatomic,copy)NSString *count_sound;
@property(nonatomic,copy)NSString *update_time;
@property(nonatomic,copy)NSString *userNick;
@property(nonatomic,copy)NSString *userID;
@property(nonatomic,copy)NSString *cover_url;


@end
