//
//  LXSMDTableViewCell.h
//  leisure
//
//  Created by qianfeng0 on 16/2/29.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LXSMDModel.h"
#import "STKAudioPlayerManager.h"




@interface LXSMDTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property(nonatomic,strong) STKAudioPlayerManager *AudioPlayer;
@property (nonatomic, assign)  BOOL isPlay;
@property(nonatomic,assign)NSInteger indexRow;

@property (nonatomic,retain)CABasicAnimation *basicAnimation;

- (void)setCellContent:(LXSMDModel *)model;
@end
