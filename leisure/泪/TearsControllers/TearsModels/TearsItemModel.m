//
//  TearsItemModel.m
//  leisure
//
//  Created by qianfeng0 on 16/3/2.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "TearsItemModel.h"

@implementation TearsItemModel
+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"id":@"pageID",@"site_info.name":@"site_infoName",@"site_info.pic":@"site_infoPic"}];
}
@end
