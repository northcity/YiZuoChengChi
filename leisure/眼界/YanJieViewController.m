//
//  YanJieViewController.m
//  leisure
//
//  Created by qianfeng0 on 16/2/23.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "YanJieViewController.h"
#import "YanJieTableViewController.h"

@interface YanJieViewController ()

@end

@implementation YanJieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor blueColor];
    self.title = @"眼界";
//    UILabel *title = [Factory createLabelWithTitle:@"眼界" frame:CGRectMake(20, 8, ScreenWidth-40, 30)];
//    [self.navigationController.navigationBar addSubview:title];
//    title.font = [UIFont boldSystemFontOfSize:18.f];
//    title.textColor = [UIColor whiteColor];
//    title.textAlignment = NSTextAlignmentCenter;
    

    
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"titlebar_bg1.png"] forBarMetrics:(UIBarMetricsDefault)];
//    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    _everyDayVC = [[YanJieTableViewController alloc]initWithStyle:(UITableViewStyleGrouped)];
//    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:_everyDayVC];
//   nav.navigationBar.translucent = NO;
    [self addChildViewController:_everyDayVC];
    [self.view addSubview:_everyDayVC.view];
    
   // [self.navigationItem.backBarButtonItem setImage:[UIImage imageNamed:@"NavigationBar.png"]];
   
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
