//
//  YanJieImageContentView.m
//  leisure
//
//  Created by qianfeng0 on 16/2/24.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "YanJieImageContentView.h"
#import "YanjieContentVIew.h"
#import "YanJieModel.h"


@implementation YanJieImageContentView


- (instancetype)initWithFrame:(CGRect)frame Width:(CGFloat)width model:(YanJieModel *)model collor:(UIColor *)collor{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.clipsToBounds = YES;
        
        _picture = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight / 1.7)];
        _picture.contentMode = UIViewContentModeScaleAspectFill;
        
        [self addSubview:_picture];
        
        //        _contentView = [[ContentView alloc]initWithFrame:CGRectMake(0, _picture.frame.size.height, kWidth, kHeight - _picture.frame.size.height) Width:width model:model collor:collor];
        //        [_contentView sd_setImageWithURL:[NSURL URLWithString:model.coverBlurred] placeholderImage:nil];
        //        [self addSubview:_contentView];
        
    }
    return self;
}


- (void)imageOffset {
    
    CGRect centerToWindow = [self convertRect:self.bounds toView:nil];
    
    CGFloat centerX = CGRectGetMidX(centerToWindow);
    CGPoint windowCenter = self.window.center;
    
    CGFloat cellOffsetX = centerX - windowCenter.x;
    
    CGFloat offsetDig =  cellOffsetX / self.window.frame.size.height *2;
    
    CGAffineTransform transX = CGAffineTransformMakeTranslation(- offsetDig * kWidth * 0.7, 0);
    
    //    self.titleLabel.transform = transY;
    //    self.littleLabel.transform = transY;
    
    self.picture.transform = transX;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
