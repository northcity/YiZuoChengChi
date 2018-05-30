//
//  LXSMDModel.h
//  leisure
//
//  Created by qianfeng0 on 16/2/28.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "JSONModel.h"

@interface LXSMDModel : JSONModel

@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *intro;
@property(nonatomic,strong)NSString *author;
@property(nonatomic,strong)NSString *announcer;
@property(nonatomic,strong)NSString *userNick;
@property(nonatomic,strong)NSString *sound_url;
@property(nonatomic,strong)NSString *build_time;
@property(nonatomic,strong)NSString *cover_url;


@end
