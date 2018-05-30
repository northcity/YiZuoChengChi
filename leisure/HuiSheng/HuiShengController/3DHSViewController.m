//
//  3DHSViewController.m
//  leisure
//
//  Created by qianfeng0 on 16/3/3.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "3DHSViewController.h"
#import "LXSMViewController.h"
#import "YuanChuangYinYueViewController.h"
#import "FCBZViewController.h"
#import "LXYYViewController.h"
#import "XYMYViewController.h"
#import "XZYYViewController.h"
#import "QGViewController.h"
#import "XYMYViewController.h"
#import "LXViewController.h"
#import "SZRDViewController.h"
#import "GYSJViewController.h"
#import "YSDWViewController.h"
#import "TKXViewController.h"
#import "QGYHViewController.h"
#import "ZCSHViewController.h"
#import "LZDCViewController.h"
#import "GSMWViewController.h"
#import "QXDTViewController.h"
#import "YXJMViewController.h"


@interface _DHSViewController ()

@end

@implementation _DHSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;

    self.title = @"电台";
    
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, 44)];
    image.image = [UIImage imageNamed:@"titlebar_shadow"];
    //  [self.view insertSubview:image aboveSubview:self.tableView];
    
    
    [self.view addSubview:image];

    
    
    
    
    
    
    UIButton *button1 = [Factory createButtonWithTitle:@"" frame:CGRectMake(ScreenWidth-50, 76, 40, 40) target:self action:@selector(PushYinYue)];
    //   [self.navigationController.navigationBar addSubview:button1];
    button1.backgroundColor = [UIColor clearColor];
    [button1 setBackgroundImage:[UIImage imageNamed:@"abc_btn_radio_to_on_mtrl_000"] forState:UIControlStateNormal];
    [self.view addSubview:button1];
    [self.view bringSubviewToFront:button1];
    
    if (PNCisIPHONEX) {
        image.frame = CGRectMake(0, 84, ScreenWidth, 44);
        button1.frame = CGRectMake(ScreenWidth-50, 96, 40, 40);
    }
}

- (void)PushYinYue
{
    STKAudioPlayerManager *manager = [STKAudioPlayerManager shareSingleton];
    
   
    if (manager.player.state == STKAudioPlayerStatePlaying) {
        [[STKAudioPlayerManager shareSingleton] stop];
    }else{
        [[STKAudioPlayerManager shareSingleton] play];
    }
    
}

- (void)createView
{
    UIImageView *image = [[UIImageView alloc]initWithFrame:self.view.bounds];
    image.image = [UIImage imageNamed:@"f1.png"];
    [self.view addSubview:image];
    image.userInteractionEnabled = YES;

    
    _sphereView = [[DBSphereView alloc]initWithFrame:CGRectMake(50,120, ScreenWidth-100, ScreenWidth-100)];
    if (PNCisIPHONEX) {
        _sphereView.frame = CGRectMake(50, 150, ScreenWidth - 100, ScreenWidth - 100);
        image.contentMode = UIViewContentModeScaleAspectFill;
    }
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:0];

    
    NSArray *dataSource = @[@"两性私密",@"原创音乐",@"翻唱伴奏",@"流行音乐",@"校园民谣",@"小众音乐",@"情感",@"校园",@"旅行",@"时政热点",@"光影世界",@"有声读物",@"脱口秀",@"情感夜话",@"职场生活",@"励志典藏",@"故事美文",@"旗下电台",@"优秀节目",@"两性私密",@"原创音乐",@"翻唱伴奏",@"流行音乐",@"校园民谣",@"小众音乐",@"情感",@"校园",@"旅行",@"时政热点",@"光影世界",@"有声读物",@"脱口秀",@"情感夜话",@"职场生活",@"励志典藏",@"故事美文",@"旗下电台",@"优秀节目"];
    
    for (NSInteger i = 0; i < 38; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setTitle:[NSString stringWithFormat:@"%@", dataSource[i]] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:11];
        btn.frame = CGRectMake(0, 0, 60, 60);
        btn.layer.cornerRadius = 25;
       
        [btn setTitleColor:WhiteColor forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [array addObject:btn];
        [btn setBackgroundColor:ClearColor];
        btn.tag = 100+i;
        
        
        
        
        
        [btn setBackgroundImage:[UIImage imageNamed:@"avator_profile"] forState:UIControlStateNormal];
        
        [self.view addSubview:btn];
        
   //     [_sphereView addSubview:image];
   //     [_sphereView insertSubview:image atIndex:0];
        image.userInteractionEnabled = YES;
        [_sphereView addSubview:btn];

}

    
    [_sphereView setCloudTags:array];
    [self.view addSubview:_sphereView];
    

}

- (void)buttonPressed:(UIButton *)btn
{
    [_sphereView timerStop];
    
    [UIView animateWithDuration:0.3 animations:^{
        btn.transform = CGAffineTransformMakeScale(2., 2.);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
            btn.transform = CGAffineTransformMakeScale(1., 1.);
        } completion:^(BOOL finished) {
            [_sphereView timerStart];
        }];
    }];


    
    
    
    
    NSArray *array = @[@"LXSMViewController",@"YuanChuangYinYueViewController",@"FCBZViewController",@"LXYYViewController",@"XYMYViewController",@"XZYYViewController",@"QGViewController",@"XYMYViewController",@"LXViewController",@"SZRDViewController",@"GYSJViewController",@"YSDWViewController",@"TKXViewController",@"QGYHViewController",@"ZCSHViewController",@"LZDCViewController",@"GSMWViewController",@"QXDTViewController",@"YXJMViewController", @"LXSMViewController",@"YuanChuangYinYueViewController",@"FCBZViewController",@"LXYYViewController",@"XYMYViewController",@"XZYYViewController",@"QGViewController",@"XYMYViewController",@"LXViewController",@"SZRDViewController",@"GYSJViewController",@"YSDWViewController",@"TKXViewController",@"QGYHViewController",@"ZCSHViewController",@"LZDCViewController",@"GSMWViewController",@"QXDTViewController",@"YXJMViewController"];
    
    
    Class cls =NSClassFromString (array[btn.tag-100]);
    
    UIViewController *vc = [[cls alloc]init];
    [self.navigationController pushViewController:vc animated:YES];

    
    
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
