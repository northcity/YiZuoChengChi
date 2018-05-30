//
//  DDWebViewController.h
//  leisure
//
//  Created by qianfeng0 on 16/2/25.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "BaseViewController.h"

@class DDDatasModel;

@interface DDWebViewController : BaseViewController
@property(nonatomic,strong)UIImageView *image;

- (instancetype)initWithData:(DDDatasModel *)model;
@end
