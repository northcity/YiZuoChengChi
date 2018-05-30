//
//  YanjieContentVIew.h
//  leisure
//
//  Created by qianfeng0 on 16/2/24.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YanJieCustomView;
@class YanJieModel;

@interface YanjieContentVIew : UIView

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *littleLabel;

@property (nonatomic, strong) UILabel *descripLabel;

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) YanJieCustomView *collectionCustom;

@property (nonatomic, strong) YanJieCustomView *shareCustom;

@property (nonatomic, strong) YanJieCustomView *cacheCustom;

@property (nonatomic, strong) YanJieCustomView *replyCustom;

- (instancetype)initWithFrame:(CGRect)frame Width:(CGFloat)width model:(YanJieModel *)model collor:(UIColor *)collor;

- (void)setData:(YanJieModel *)model;

@end
