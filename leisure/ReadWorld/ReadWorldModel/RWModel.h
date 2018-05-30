//
//  RWModel.h
//  leisure
//
//  Created by qianfeng0 on 16/2/27.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "JSONModel.h"

@interface RWModel : JSONModel


@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *url;
@property(nonatomic,copy)NSString *snapshot;
@property(nonatomic,copy)NSString<Optional> *brief;


@end
