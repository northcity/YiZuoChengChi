//
//  DDDatasModel.m
//  leisure
//
//  Created by qianfeng0 on 16/2/25.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "DDDatasModel.h"

@implementation DDDatasModel

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"id":@"page_ID"}];
}



@end
