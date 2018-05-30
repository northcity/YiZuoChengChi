//
//  DanDuViewController.m
//  leisure
//
//  Created by qianfeng0 on 16/2/23.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "DanDuViewController.h"
#import "DDTableViewController.h"
#import "3DHSViewController.h"

@interface DanDuViewController ()

@end

@implementation DanDuViewController

-(void)viewWillAppear:(BOOL)animated
{
    if (self.tabBarController.tabBar.hidden == YES) {
        return;
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    self.Dvc = [[DDTableViewController alloc]initWithStyle:(UITableViewStyleGrouped)];
//    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:_Dvc];
//   nav.navigationBar.translucent = NO;
//    [nav setNavigationBarHidden:YES animated:NO];
    [self addChildViewController:self.Dvc];
    [self.view addSubview:self.Dvc.view];

    self.title = @"听说";
//self.tabBarItem
    
  //  self.tabBarController.hidesBottomBarWhenPushed = YES;
    UIImageView *pin = [[UIImageView alloc]initWithFrame:CGRectMake(10, 35, 60, 30)];
    pin.image = [UIImage imageNamed:@"pin"];
    
    [self.navigationController.navigationBar addSubview:pin];
    
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, 44)];
    image.image = [UIImage imageNamed:@"titlebar_shadow"];
    //[self.view insertSubview:image aboveSubview:self.tableView];
    
    if (PNCisIPHONEX) {
        image.frame = CGRectMake(0, 84, ScreenWidth, 44);
    }
    
    [self.view addSubview:image];
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"titlebar_bg1.png"] forBarMetrics:(UIBarMetricsDefault)];
//    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
   // [self.view bringSubviewToFront:self.navigationController.navigationBar];
    UIButton *button1 = [Factory createButtonWithTitle:@"" frame:CGRectMake(ScreenWidth-80, 76, 30, 30) target:self action:@selector(PushYinYue)];
    [self.navigationController.navigationBar addSubview:button1];
    button1.backgroundColor = [UIColor clearColor];
    [button1 setBackgroundImage:[UIImage imageNamed:@"abc_btn_radio_to_on_mtrl_000"] forState:UIControlStateNormal];
    [self.view addSubview:button1];
   
    
    
    [self.view bringSubviewToFront:button1];
    UILabel *label = [Factory createLabelWithTitle:@"电台" frame:CGRectMake(ScreenWidth-50, 76, 30, 30)];
    //[self.navigationController.navigationBar addSubview:label];
    [self.view addSubview:label];
    [self.view bringSubviewToFront:label];
    
    if (PNCisIPHONEX) {
        button1.frame = CGRectMake(ScreenWidth - 80, 96, 30, 30);
        label.frame = CGRectMake(ScreenWidth - 50, 96, 30, 30);
    }
    
    UILabel *title = [Factory createLabelWithTitle:@"听说" frame:CGRectMake(20, 8, ScreenWidth-40, 30)];
   // [self.navigationController.navigationBar addSubview:title];
    title.font = [UIFont boldSystemFontOfSize:18.f];
    title.textColor = [UIColor whiteColor];
    title.textAlignment = NSTextAlignmentCenter;

    
    
    
    
    
    
    
    
    


}
-(void)PushYinYue
{
    
    _DHSViewController *dvc = [[_DHSViewController alloc]init];
    [self.navigationController pushViewController:dvc animated:YES];
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
