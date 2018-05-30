//
//  MeiRiYiWenModel.h
//  leisure
//
//  Created by qianfeng0 on 16/2/26.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "JSONModel.h"

@interface MeiRiYiWenModel : JSONModel

@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *author;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSString *date;

@end
