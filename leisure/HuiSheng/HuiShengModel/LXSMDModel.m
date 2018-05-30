//
//  LXSMDModel.m
//  leisure
//
//  Created by qianfeng0 on 16/2/28.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "LXSMDModel.h"

@implementation LXSMDModel

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"user.nick":@"userNick"}];
}

@end
