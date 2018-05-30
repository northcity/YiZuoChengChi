//
//  ReadWorldViewController.m
//  leisure
//
//  Created by qianfeng0 on 16/2/27.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "ReadWorldViewController.h"

@interface ReadWorldViewController ()

@end

@implementation ReadWorldViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Read world";
    _RWtableView = [[RWTableViewController alloc]initWithStyle:(UITableViewStyleGrouped)];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:_RWtableView];
    nav.navigationBar.translucent = NO;
    [self addChildViewController:nav];
    [self.view addSubview:nav.view];

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
