//
//  DDTableViewCell.h
//  leisure
//
//  Created by qianfeng0 on 16/2/25.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDDatasModel.h"

@interface DDTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *content;

@property (weak, nonatomic) IBOutlet UILabel *Catory;
@property (weak, nonatomic) IBOutlet UILabel *pingLun;
@property (weak, nonatomic) IBOutlet UILabel *like;
@property (weak, nonatomic) IBOutlet UILabel *readCount;

@property(nonatomic,strong)UIVisualEffectView *effectView;
@property(nonatomic,strong)UIBlurEffect *effect;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *distance;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageHeiht;


- (void)setCellContent:(DDDatasModel *)model;

@end
