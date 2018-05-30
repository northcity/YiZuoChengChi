//
//  SMTableViewCell.h
//  leisure
//
//  Created by qianfeng0 on 16/3/2.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TearsItemModel.h"

@interface SMTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *sitePic;
@property (weak, nonatomic) IBOutlet UILabel *sitename;
@property (weak, nonatomic) IBOutlet UILabel *bianjituijian;
@property (weak, nonatomic) IBOutlet UILabel *creattime;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UIImageView *pic1;
@property (weak, nonatomic) IBOutlet UIImageView *pic2;

@property (weak, nonatomic) IBOutlet UIImageView *pic3;

- (void)setCellContent:(TearsItemModel *)model;



@end
