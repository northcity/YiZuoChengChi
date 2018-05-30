//
//  PlayViewController.h
//  leisure
//
//  Created by qianfeng0 on 16/2/24.
//  Copyright © 2016年 陈希. All rights reserved.
//
@class YanJieModel;

#import "BaseViewController.h"

@interface PlayViewController : BaseViewController

@property (nonatomic, strong) NSArray *modelArray;

@property (nonatomic, assign) NSInteger index;

- (instancetype)initWithModel:(YanJieModel *)model;


@end
