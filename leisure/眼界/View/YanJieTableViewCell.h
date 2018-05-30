//
//  YanJieTableViewCell.h
//  leisure
//
//  Created by qianfeng0 on 16/2/24.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YanJieModel;

@interface YanJieTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *picture;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *littleLabel;

@property (nonatomic, strong) UIView *coverview;

@property (nonatomic, strong) YanJieModel *model;

- (CGFloat)cellOffset;

@end
