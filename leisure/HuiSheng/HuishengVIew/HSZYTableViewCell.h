//
//  HSZYTableViewCell.h
//  leisure
//
//  Created by qianfeng0 on 16/2/28.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LXSMModel.h"

@interface HSZYTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *Concent;
@property (weak, nonatomic) IBOutlet UILabel *Count;

@property (weak, nonatomic) IBOutlet UIImageView *image;
- (void)setCellContent:(LXSMModel *)model;
@end
