//
//  LXSMPLAYViewController.h
//  leisure
//
//  Created by qianfeng0 on 16/2/29.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "BaseViewController.h"
#import "STKAudioPlayer.h"
#import "LXSMDModel.h"

@interface LXSMPLAYViewController : BaseViewController
@property(nonatomic,retain)STKAudioPlayer *player;
@property(nonatomic,copy)NSString *coverImage; //动画图
@property(nonatomic,retain)UIButton *playButton; //播放按钮

//+(instancetype)shareListenDetailViewController;
- (instancetype)initWithData:(LXSMDModel *)model;

@end
