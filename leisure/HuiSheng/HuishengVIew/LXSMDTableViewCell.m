//
//  LXSMDTableViewCell.m
//  leisure
//
//  Created by qianfeng0 on 16/2/29.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "LXSMDTableViewCell.h"


@implementation LXSMDTableViewCell


- (void)setCellContent:(LXSMDModel *)model
{
    self.isPlay = NO;
    
    self.title.text = model.title;
    self.content.text = model.intro;
    [self.image sd_setImageWithURL:[NSURL URLWithString:model.cover_url]];
    
    self.image.layer.cornerRadius = 40.f;
    self.image.layer.masksToBounds = YES;

    
    
    
    [self.button setBackgroundImage:[UIImage imageNamed:@"abc_btn_radio_to_on_mtrl_000.png"] forState:UIControlStateNormal];
    NSString *playUrl = model.sound_url;
    [self.button setTitle:playUrl forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(ButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.button.tintColor = [UIColor clearColor];
    
    self.AudioPlayer = [STKAudioPlayerManager shareSingleton];
//    self.plaYYYYY = [[STKAudioPlayer alloc] initWithOptions:(STKAudioPlayerOptions){ .flushQueueOnSeek = YES, .enableVolumeMixer = YES, .equalizerBandFrequencies = {50, 100, 200, 400, 800, 1600, 2600, 16000} }];
//    //下面的初始化也可以,但设置不了enableVolumeMixer,就无法调节音量
//    //self.player = [[STKAudioPlayer alloc] init];
//    //  self.player.delegate = self;
//    self.plaYYYYY.volume = 0.5;
}

- (void)ButtonDidClicked:(UIButton *)button
{

    
        [self basicAnimation];
    //self.AudioPlayer.player.delegate = self;
       NSString * url = [button titleForState:UIControlStateNormal];
    
   
    
    if (!self.isPlay) {
        [button setBackgroundImage:[UIImage imageNamed:@"abc_btn_radio_to_on_mtrl_015.png"] forState:UIControlStateNormal];
        [self.AudioPlayer play:url];
        
        CFTimeInterval stopTime = [self.image.layer timeOffset];
        self.image.layer.beginTime = 0;
        self.image.layer.timeOffset = 0;
        self.image.layer.speed = 1;
        
        CFTimeInterval tempTime = [self.image.layer convertTime:CACurrentMediaTime() fromLayer:nil] - stopTime;
        self.image.layer.beginTime = tempTime;
    
        self.isPlay = YES;
    }else if(self.isPlay){
        [self.button setBackgroundImage:[UIImage imageNamed:@"abc_btn_radio_to_on_mtrl_000.png"] forState:UIControlStateNormal];
        [self.AudioPlayer pause];
        CFTimeInterval stopTime = [self.image.layer convertTime:CACurrentMediaTime() fromLayer:nil];
        self.image.layer.speed = 0;
        self.image.layer.timeOffset = stopTime;
        self.isPlay = NO;
    }
    
    
    

    
    
//    if (!self.isPlay) {
//        [self.AudioPlayer play:url];
//        self.isPlay = YES;
//    }
//    else {
//    
//        [self.AudioPlayer stop];
//        self.isPlay = NO;
//    }
}


- (CABasicAnimation *)basicAnimation{
    if (_basicAnimation == nil) {
        self.basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        //旋转一圈时长
        self.basicAnimation.duration = 30;
        //开始动画的起始位置
        self.basicAnimation.fromValue = [NSNumber numberWithInt:0];
        //M_PI是180度
        self.basicAnimation.toValue = [NSNumber numberWithInt:M_PI*2];
        //动画重复次数
        [self.basicAnimation setRepeatCount:NSIntegerMax];
        //播放完毕之后是否逆向回到原来位置
        [self.basicAnimation setAutoreverses:NO];
        //是否叠加（追加）动画效果
        [self.basicAnimation setCumulative:YES];
        //停止动画，速度设置为0
        //        [self.view viewWithTag:self.imageView.layer.speed = 10];
        //    self.ImageView.layer.speed = 0;
        //   [self.view viewWithTag:self.imageView.layer.]
        self.image.layer.speed = 1.f;
        
        [self.image.layer addAnimation:self.basicAnimation forKey:@"basicAnimation"];
        
    }
    return _basicAnimation;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
