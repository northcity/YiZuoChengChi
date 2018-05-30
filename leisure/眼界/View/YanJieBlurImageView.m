//
//  YanJieBlurImageView.m
//  leisure
//
//  Created by qianfeng0 on 16/2/24.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "YanJieBlurImageView.h"

@implementation YanJieBlurImageView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        //设置图片
        self.image = [UIImage imageNamed:@"11471923,2560,1600.jpg"];
        //创建模糊视图
        UIVisualEffectView *backVisual = [[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
        //将模糊视图的大小等同于自身
        backVisual.frame = self.bounds;
        //设置模糊视图的透明度
        backVisual.alpha = 1;
        [self addSubview:backVisual];
        
    }
    return self;

}

@end
