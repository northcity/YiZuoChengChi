//
//  EnterViewController.m
//  leisure
//
//  Created by qianfeng0 on 16/3/5.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "EnterViewController.h"
#import "MyTabBarViewController.h"
@interface EnterViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong)NSTimer *MyTime;
@property(nonatomic,strong)UIImageView *MyImageView;
@property (nonatomic,strong) IBOutlet UILabel *XibLabel;


@property(nonatomic,strong)UIScrollView *MyScroll;
@property(nonatomic,strong)UIImageView *imageBg;
@property(nonatomic,strong)UIImageView *fanSeImageBg;

@end

@implementation EnterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addTapGesture];
    
    
}

- (void)addTapGesture {
    //实例化一个手势的对象
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureAction:)];
    //添加点击次数触发事件
    //    gesture.numberOfTapsRequired = 1;
    //    //添加使用的手指数量
    //    gesture.numberOfTouchesRequired = 1;
    //使用addGestureRecognizer添加手势
    [self.MyScroll addGestureRecognizer:gesture];
}

- (void)tapGestureAction:(UITapGestureRecognizer *)gesture {
    
    MyTabBarViewController *tvc = [[MyTabBarViewController alloc]init];
    
    tvc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:tvc animated:YES completion:nil];
    
}

- (void)createView
{
    self.fanSeImageBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fansejiazaitu.png"]];
    self.fanSeImageBg.frame = self.view.bounds;
    self.fanSeImageBg.contentMode = UIViewContentModeScaleAspectFill;

    [self.view addSubview:self.fanSeImageBg];
    self.fanSeImageBg.alpha = 0;
    self.imageBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"jiazaitu.png"]];
    self.imageBg.frame = self.view.bounds;
    self.imageBg.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:self.imageBg];
    
    [UIView animateWithDuration:3 animations:^{
        self.imageBg.alpha = 0;
        self.fanSeImageBg.alpha = 1;
    } completion:^(BOOL finished) {
        MyTabBarViewController *tvc = [[MyTabBarViewController alloc]init];
        tvc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;    // 设置动画效果
        [UIView animateWithDuration:3 animations:^{
            [self presentViewController:tvc animated:YES completion:nil];
        }];
    }];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        
//        [self.imageBg removeFromSuperview];
//    });
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//
//        self.MyScroll = [[UIScrollView alloc]initWithFrame:self.view.bounds];
//        self.MyScroll.delegate =self;
//        self.MyScroll.contentSize = CGSizeMake(ScreenWidth*3,0);
//        //显示横向的滚动进度条
//        self.MyScroll.showsHorizontalScrollIndicator = YES;
//        //显示纵向的滚动进度条
//        self.MyScroll.showsVerticalScrollIndicator = YES;
//        [self.view addSubview:self.MyScroll];
//        self.MyImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth*3, ScreenHeight)];
//        self.MyImageView.image = [UIImage imageNamed:@"Enter.png"];
//        [self.MyScroll addSubview:self.MyImageView];
//        self.MyImageView.userInteractionEnabled = YES;
//
//        UIImageView *biaotiimage =[[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2-90, 120, 200, 200)];
//        biaotiimage.image =[UIImage imageNamed:@"BiaotiBai.png"];
//        [self.view addSubview:biaotiimage];
//        [self.view bringSubviewToFront:biaotiimage];
//        UIImageView *biaotiimage1 =[[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2-90, 120, 200, 200)];
//        biaotiimage1.image =[UIImage imageNamed:@"Biaoti.png"];
//        [self.view addSubview:biaotiimage1];
//        [self.view insertSubview:biaotiimage1 belowSubview:biaotiimage];
//
//        UIImageView *titleimage =[[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2-30, 250, 150, 150)];
//        titleimage.image =[UIImage imageNamed:@"EnterTitlewhite.png"];
//        [self.view addSubview:titleimage];
//        [self.view bringSubviewToFront:titleimage];
//        UIImageView *titleimage1 =[[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2-30, 250, 150, 150)];
//        titleimage1.image =[UIImage imageNamed:@"EnterTitle.png"];
//        [self.view addSubview:titleimage1];
//        [self.view insertSubview:titleimage1 belowSubview:titleimage];
//
//
//        UIImageView *nianchengimage = [[UIImageView alloc]initWithFrame:self.view.bounds];
//        nianchengimage.image = [UIImage imageNamed:@"f1.png"];
//        [self.view addSubview:nianchengimage];
//        [self.view insertSubview:nianchengimage belowSubview:biaotiimage1];
//        nianchengimage.alpha = 0;
//        biaotiimage.userInteractionEnabled = YES;
//        biaotiimage1.userInteractionEnabled = YES;
//        titleimage1.userInteractionEnabled = YES;
//        titleimage.userInteractionEnabled = YES;
//
//        [self.MyScroll setContentOffset: CGPointMake(ScreenWidth/2, 0) animated:YES];
//        [UIView animateWithDuration:3.5f animations:^{
//            //  self.MyImageView.frame = CGRectMake(0,0,ScreenWidth+ScreenWidth/7, ScreenHeight+ScreenHeight/7);
//
//            //    biaotiimage.alpha = 0;
//
//            [self.MyScroll setContentOffset: CGPointMake(ScreenWidth/2 + ScreenWidth/8, 0) animated:YES];
//            //  nianchengimage.alpha = 0.8;
//        } completion:^(BOOL finished) {
//
//        }];
//
//        [UIView animateWithDuration:4.5f animations:^{
//            self.MyScroll.alpha = 0;
//            biaotiimage.alpha = 0;
//            titleimage.alpha = 0;
//        } completion:^(BOOL finished) {
//            MyTabBarViewController *tvc = [[MyTabBarViewController alloc]init];
//            tvc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;    // 设置动画效果
//            [UIView animateWithDuration:3 animations:^{
//                [self presentViewController:tvc animated:YES completion:nil];
//            }];
//        }];
//
//
//
//    });


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

