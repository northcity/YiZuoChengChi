//
//  MEModel.h
//  leisure
//
//  Created by qianfeng0 on 16/2/27.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "JSONModel.h"

@interface MEModel : JSONModel

@property(nonatomic,strong)NSString * title;
@property(nonatomic,strong)NSString * writer;
@property(nonatomic,strong)NSString * image;
@property(nonatomic,strong)NSString * diggtop;
@property(nonatomic,strong)NSString * diggdown;

@end
