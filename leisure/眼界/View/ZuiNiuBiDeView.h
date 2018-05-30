//
//  ZuiNiuBiDeView.h
//  leisure
//
//  Created by qianfeng0 on 16/2/24.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YanjieContentVIew;
@class YanJieContentScrollView;
@class YanJieTableViewCell;



@interface ZuiNiuBiDeView : UIView

@property (nonatomic, strong) YanjieContentVIew *contentView;

@property (nonatomic, strong) YanJieContentScrollView *scrollView;

@property (nonatomic, strong)  YanJieTableViewCell *animationView;


@property (nonatomic ,strong) UIImageView *playView;

@property (nonatomic ,assign) NSInteger currentIndex;

- (instancetype)initWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray index:(NSInteger)index;

@property (nonatomic ,assign) CGFloat offsetY;
@property (nonatomic ,assign) CGAffineTransform animationTrans;

- (void)aminmationShow;
- (void)animationDismissUsingCompeteBlock:(void (^)(void))complete;


@end
