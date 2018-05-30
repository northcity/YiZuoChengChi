//
//  PlayViewController.m
//  leisure
//
//  Created by qianfeng0 on 16/2/24.
//  Copyright © 2016年 陈希. All rights reserved.
//
@class YanJieViewController;
#import "PlayViewController.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
#import "YanJieModel.h"


@interface PlayViewController ()
@property (nonatomic, strong) AVPlayer *player;

@property(nonatomic,strong)AVPlayerViewController *av;
@property(nonatomic,strong)YanJieModel *model;

@property (nonatomic, strong) AVPlayerItem *playerItem;
@end

@implementation PlayViewController


- (instancetype)initWithModel:(YanJieModel *)model
{
    self = [super init];
    if (self) {
        self.model = model;
    }
    return self;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    YanJieModel *model = _modelArray[_index];
    
    
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight/2)];
    [image sd_setImageWithURL:[NSURL URLWithString:model.coverForDetail]];
    [self.view addSubview:image];
    image.contentMode = UIViewContentModeScaleAspectFill;
    image.layer.masksToBounds = YES;
    UIImageView *image2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, ScreenHeight/2, ScreenWidth, ScreenHeight/2)];
    [image2 sd_setImageWithURL:[NSURL URLWithString:model.coverBlurred]];
    [self.view addSubview:image2];
    image2.contentMode = UIViewContentModeScaleAspectFill;
    image2.layer.masksToBounds = YES;
    
    
    
    UIButton *button = [Factory createButtonWithTitle:@"Back" frame:CGRectMake(ScreenWidth-(ScreenWidth/4), ScreenHeight-(ScreenWidth/1.8), ScreenWidth/6,ScreenWidth/6) target:self action:@selector(Fanhui)];
    [button setTitleColor:WhiteColor forState:UIControlStateNormal];
    button.backgroundColor = ClearColor;
    button.layer.cornerRadius = 25.f;
    [button setBackgroundImage:[UIImage imageNamed:@"avator_profile"] forState:UIControlStateNormal];
    
    [self.view addSubview:button];
    [self.view bringSubviewToFront:button];
    
    
    
    
    
    UIButton *button1 = [Factory createButtonWithTitle:@"" frame:CGRectMake(ScreenWidth/2-40, ScreenHeight/4-40, 80, 80) target:self action:@selector(showMovieView)];
    [button1 setTitleColor:WhiteColor forState:UIControlStateNormal];
    button1.backgroundColor = ClearColor;
    button1.layer.cornerRadius = 25.f;
    [button1 setBackgroundImage:[UIImage imageNamed:@"video-play.png"] forState:UIControlStateNormal];
    image.userInteractionEnabled =YES;
    [image addSubview:button1];
  //  [self.view bringSubviewToFront:button1];

    
    
    self.av = [[AVPlayerViewController alloc]init];
    // self.player = [AVPlayer playerWithURL:[NSURL URLWithString:model.playUrl]];
    self.av.player = [AVPlayer playerWithURL:[NSURL URLWithString:model.playUrl]];
    //  model.playUrl
    // Do any additional setup after loading the view.
    //  [self.navigationController pushViewController:bvc animated:YES];
    [self showMovieView];
    [self createView];

    
    
   
    
    UILabel *label = [Factory createLabelWithTitle:@"" frame:CGRectMake(0, ScreenWidth/2                                                                                                                                                                                      , ScreenWidth-20,ScreenWidth-20)];
   
    label.numberOfLines = 3;

    label.text = [NSString stringWithFormat:@"“%@”",model.descrip];
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.shadowColor = [UIColor blackColor];
    //设置label字体阴影的偏移
    label.shadowOffset = CGSizeMake(2, 2);
    //设置文字的颜色
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
   // NSArray *fontFamily = [UIFont familyNames];
    //取得该家族的字体成员
   // NSArray *fontMemory = [UIFont fontNamesForFamilyName:@"Cochin"];
    //使用字体的名字取得字体
    label.font = [UIFont fontWithName:@"Cochin-BoldItalic" size:14.f];
    [self.view addSubview:label];
    

}

- (void)createView
{
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.frame = CGRectMake(100, 40, 60, 60);
//    [button addTarget:self action:@selector(Fanhui) forControlEvents:UIControlEventTouchUpInside];
//    button.backgroundColor = [UIColor blackColor];
//    [self.view addSubview:button];
}
- (void)Fanhui
{
//    YanJieViewController *yvc =[[YanJieViewController alloc]init];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)showMovieView
{
    [self presentViewController:self.av animated:YES completion:NULL];
    
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
