//
//  YanJieContentScrollView.h
//  leisure
//
//  Created by qianfeng0 on 16/2/24.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YanJieImageContentView;
@class YanJieContentScrollView;

@protocol YanJieContentScrollViewDelegate <UIScrollViewDelegate>

- (void)headerScroll:(YanJieContentScrollView *)scroll didSelectItemAtIndex:(NSInteger)index;
- (void)headerScroll:(YanJieContentScrollView *)scroll didClose:(BOOL)close;

@end

@interface YanJieContentScrollView : UIScrollView
@property (nonatomic ,assign ,readonly) NSInteger currentIndex;

- (void)setCurrentIndex:(NSInteger)currentIndex;

- (instancetype)initWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray index:(NSInteger)index;



@end
