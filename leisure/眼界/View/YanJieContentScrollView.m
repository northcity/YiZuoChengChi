//
//  YanJieContentScrollView.m
//  leisure
//
//  Created by qianfeng0 on 16/2/24.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "YanJieContentScrollView.h"
#import "YanJieImageContentView.h"
#import "YanJieModel.h"

@interface YanJieContentScrollView()

@property (nonatomic ,assign ,readwrite) NSInteger currentIndex;


@end

@implementation YanJieContentScrollView

- (instancetype)initWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray index:(NSInteger)index{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.contentSize = CGSizeMake([imageArray count] * kWidth, 0);
        
        self.bounces = NO;
        
        self.pagingEnabled = YES;
        
        self.contentOffset = CGPointMake(index * kWidth, 0);
        
        for (int i = 0; i < [imageArray count]; i ++) {
            
            YanJieImageContentView *sonView = [[YanJieImageContentView alloc]initWithFrame:CGRectMake(i * kWidth, 0, kWidth, kHeight) Width:35 model:imageArray[i] collor:[UIColor whiteColor]];
            
            YanJieModel *model = [[YanJieModel alloc]init];
            
            model = imageArray[i];
            
            [sonView.picture sd_setImageWithURL:[NSURL URLWithString:model.coverForDetail] placeholderImage:nil];
            
            [self addSubview:sonView];
        }
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
