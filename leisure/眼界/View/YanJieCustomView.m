//
//  YanJieCustomView.m
//  leisure
//
//  Created by qianfeng0 on 16/2/24.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "YanJieCustomView.h"

@implementation YanJieCustomView
- (instancetype)initWithFrame:(CGRect)frame Width:(CGFloat)width LabelString:(id)labelString collor:(UIColor *)collor{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        CGFloat totalWidth = self.frame.size.width;
        CGFloat totalHeight = self.frame.size.height;
        
        _button = [UIButton buttonWithType:(UIButtonTypeSystem)];
        
        _button.frame = CGRectMake(0, 0, width, totalHeight);
        
        _button.tintColor = collor;
        
        [self addSubview:_button];
        
        _label = [[UILabel alloc]initWithFrame:CGRectMake(width, 0, totalWidth - width, totalHeight)];
        
        _label.textColor = collor;
        
        NSString *string = [NSString stringWithFormat:@"%@",labelString];
        
        _label.text = string;
        
#pragma -------------------------------------------标记打印-----------------------------------------
        
      //  //NSLog(@"%@",string);
        
        _label.font = [UIFont systemFontOfSize:14];
        
        [self addSubview:_label];
        
    }
    return self;
}

- (void)setTitle:(NSString *)title {
    
    self.label.text =[NSString stringWithFormat:@"%@",title];
}

- (void)setColor:(UIColor *)color {
    
    self.button.tintColor = color;
    self.label.textColor = color;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
