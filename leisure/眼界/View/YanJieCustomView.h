//
//  YanJieCustomView.h
//  leisure
//
//  Created by qianfeng0 on 16/2/24.
//  Copyright © 2016年 陈希. All rights reserved.
//



#import <UIKit/UIKit.h>

@interface YanJieCustomView : UIView
@property (nonatomic, strong) UIButton *button;

@property (nonatomic, strong) UILabel *label;

- (instancetype)initWithFrame:(CGRect)frame Width:(CGFloat)width LabelString:(id)labelString collor:(UIColor *)collor;

- (void)setTitle:(id)title;
- (void)setColor:(UIColor *)color;
@end
