//
//  LXSMModel.m
//  leisure
//
//  Created by qianfeng0 on 16/2/28.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "LXSMModel.h"

@implementation LXSMModel

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"id":@"pageID",@"user.nick":@"userNick",@"user.id":@"userID"}];
}

@end
