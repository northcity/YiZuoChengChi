//
//  LXSMPLAYViewController.m
//  leisure
//
//  Created by qianfeng0 on 16/2/29.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "LXSMPLAYViewController.h"
#import "STKDataSource.h"
#import "UIImage+Blur.h"
#import "Factory.h"


@interface LXSMPLAYViewController ()

@property(nonatomic,retain)UIButton *nextButton;
@property(nonatomic,retain)UIButton *lastButton;
@property(nonatomic,retain)UILabel *timeLabel;
@property(nonatomic,retain)UILabel *allTimeLabel;
@property(nonatomic,retain)UISlider *progressSlider;
@property(nonatomic,retain)NSTimer *timer;//定时器 播放时间
@property(nonatomic,retain)NSTimer *myTime;//定时器 轮播标题
@property (nonatomic,retain)CABasicAnimation *basicAnimation;
@property(nonatomic,retain)UIImageView *imageView;
@property(nonatomic,retain)UIScrollView *scrollView;


@property(nonatomic,strong)LXSMDModel *model;
@end

@implementation LXSMPLAYViewController


#pragma mark ------------------肯恩和有问题---------------



- (instancetype)initWithData:(LXSMDModel *)model;
{
    self = [super init];
    if (self) {
        _model = model;
    }
    return self;
}

//- (CABasicAnimation *)basicAnimation {
//    if (_basicAnimation == nil) {
//        self.basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
//        //旋转一圈时长
//        self.basicAnimation.duration = 30;
//        //开始动画的起始位置
//        self.basicAnimation.fromValue = [NSNumber numberWithInt:0];
//        //M_PI是180度
//        self.basicAnimation.toValue = [NSNumber numberWithInt:M_PI*2];
//        //动画重复次数
//        [self.basicAnimation setRepeatCount:NSIntegerMax];
//        //播放完毕之后是否逆向回到原来位置
//        [self.basicAnimation setAutoreverses:NO];
//        //是否叠加（追加）动画效果
//        [self.basicAnimation setCumulative:YES];
//        //停止动画，速度设置为0
//        self.imageView.layer.speed = 1;
//        //    self.ImageView.layer.speed = 0;
//        [self.imageView.layer addAnimation:self.basicAnimation forKey:@"basicAnimation"];
//        
//    }
//    return _basicAnimation;
//}




- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    //NSLog(@"你妈别");
    self.title = @"bofang";
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
  //  [button setBackgroundImage:[UIImage imageNamed:@"iconfont-fanhui.png"] forState:UIControlStateNormal];
    [button setTitle:@"bofang" forState:UIControlStateNormal];
    button.tintColor = [UIColor blackColor];
    button.frame = CGRectMake(0, 0, 60 , 44 );
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    [button addTarget:self action:@selector(backButtonAction) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:button];
    self.player = [[STKAudioPlayer alloc] initWithOptions:(STKAudioPlayerOptions){ .flushQueueOnSeek = YES, .enableVolumeMixer = YES, .equalizerBandFrequencies = {50, 100, 200, 400, 800, 1600, 2600, 16000} }];
    //下面的初始化也可以,但设置不了enableVolumeMixer,就无法调节音量
    //self.player = [[STKAudioPlayer alloc] init];
  //  self.player.delegate = self;
    self.player.volume = 0.5;
    
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    [self.view addSubview:imageView];
    UIImage *image = [UIImage imageNamed:@"332a4a1eff7b50757eb8126948ab1ef6.jpg"];
    imageView.image = [image boxblurImageWithBlur:1];
    //    [imageView release];
    
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(60 , 150 , 250 , 250 )];
    self.imageView.layer.masksToBounds = YES;
    self.imageView.layer.cornerRadius = 125 ;
    [self.view addSubview:self.imageView];
    
   


    self.playButton = [Factory createButtonWithTitle:@"qunimabi" frame:CGRectMake(100, 100, 60, 44) backgroundColor:BlackColor backgroundImage:nil target:self action:@selector(playMusic)];
    [self.view addSubview:self.playButton];
    
}



- (void)playMusic
{
   
     [self.player play:self.model.sound_url];
    
   if (self.player.state == STKAudioPlayerStatePaused) {
        [self.player resume];
  
   }else if(self.player.state == STKAudioPlayerStatePlaying){
        [self.player pause];
    
        
    }
}


-(void)backButtonAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
