//
//  BaseViewController.m
//  UINavigationControllerDemo2
//
//  Created by wanghailong on 16/1/4.
//  Copyright © 2016年 HailongExcellency. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //初始化数据
    [self initData];
    //创建视图
    [self createView];
    //添加用户行为
    [self addTouchAction];
}

//声明一个初始化数据的方法
- (void)initData {
    //只做空方法，不做实现，取消编译器的警告
}

//声明一个创建视图的方法
- (void)createView {
    //只做空方法，不做实现，取消编译器的警告
}

//添加用户交互信息
- (void)addTouchAction {
    //只做空方法，不做实现，取消编译器的警告
}

//声明一个创建上导航的右侧按钮
- (void)createRightNavigationBarButtonWithTitle:(NSString *)title target:(id)target action:(SEL)selector {
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStyleDone target:target action:selector];
    self.navigationItem.rightBarButtonItem = right;
}

- (void)createleftNavigationBarButtonWithTitle:(NSString *)title target:(id)target action:(SEL)selector
{
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStyleDone target:target action:selector];
    self.navigationItem.rightBarButtonItem = left;
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
