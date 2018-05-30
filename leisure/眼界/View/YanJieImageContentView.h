//
//  YanJieImageContentView.h
//  leisure
//
//  Created by qianfeng0 on 16/2/24.
//  Copyright © 2016年 陈希. All rights reserved.
//




#import <UIKit/UIKit.h>

@class YanjieContentVIew;
@class YanJieModel;

@interface YanJieImageContentView : UIView

@property (nonatomic, strong) UIImageView *picture;

- (instancetype)initWithFrame:(CGRect)frame Width:(CGFloat)width model:(YanJieModel *)model collor:(UIColor *)collor;

- (void)imageOffset;

@end
