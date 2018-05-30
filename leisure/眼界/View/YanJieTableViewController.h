//
//  YanJieTableViewController.h
//  leisure
//
//  Created by qianfeng0 on 16/2/24.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZuiNiuBiDeView;

@interface YanJieTableViewController : UITableViewController

@property (nonatomic, strong) ZuiNiuBiDeView *rilegoule;

@property (nonatomic, strong) UIImageView *BlurredView;

@property (nonatomic, strong) NSMutableArray *array;

@property (nonatomic, strong) NSIndexPath *currentIndexPath;

@property(nonatomic,strong)UIImageView *headerImage;
@property(nonatomic,strong)UILabel *label;

@end
