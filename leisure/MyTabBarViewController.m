//
//  MyTabBarViewController.m
//  leisure
//
//  Created by qianfeng0 on 16/2/23.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "MyTabBarViewController.h"
#import "MyTabbarViewController.h"
#import "TearsViewController.h"
#import "DanDuViewController.h"
#import "YanJieViewController.h"
#import "QuWenViewController.h"
#import "MEViewController.h"
#import "HuiShengViewController.h"
#import "ReadWorld/ReadWorldViewController.h"
#import "3DHSViewController.h"
#import "ME/MEEEEViewController.h"
#import "OneDetailViewController.h"
#import "OneViewController.h"


@interface MyTabBarViewController ()

@end

@implementation MyTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatView];
}

- (void)creatView{
//
//    self.tabBar.barTintColor = FenSeColor;
//    设置tabBar的背景色
    self.tabBar.tintColor = [UIColor blackColor];
   
  
    [self creatSubViewController];

  //  [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbar_bg1.png"]];
    [self.tabBar setBackgroundColor:WhiteColor
     ];
   
//    UIImageView *image = [[UIImageView alloc]init];
//    image.image = [UIImage imageNamed:@"feedback_edit_text.9"];
//    [self.tabBarController.tabBar addSubview:image];
}

- (void)creatSubViewController{
    NSArray *controllerName = @[@"随读",@"故事",@"听说",@"眼界",@"ME"];
    
    NSArray *controllers = @[@"TearsViewController",@"QuWenViewController",@"DanDuViewController",@"YanJieViewController",@"MEEEEViewController"];
    NSMutableArray *temp = [[NSMutableArray alloc]init];
    for (int i = 0; i < [controllers count]; i++) {
        Class cls = NSClassFromString([controllers objectAtIndex:i]);
        UIViewController * controller = [[cls alloc]init];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:controller];
 
#pragma ---------------修改Navigation---------------
       //  [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"Na1.png"] forBarMetrics:(UIBarMetricsDefault)];
        [nav.navigationBar setShadowImage:[[UIImage alloc] init]];

        //创建一个tabBarItem的对象
        /*
         UITabBarItem 类型的对象其实就是tabBarController的标签。
         */
        
        NSString *imageName = [NSString stringWithFormat:@"tabbar%d.png",i];
        NSString *selectName = [NSString stringWithFormat:@"tabbar0%d.png",i];
        
        UIImage *image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *select = [[UIImage imageNamed:selectName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                                                          
       
        
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:[controllerName objectAtIndex:i] image:image selectedImage:select];
        //设置提示红点
        
        
       // NSString *value = [NSString stringWithFormat:@"%u",arc4random()%50];
        
        //item.badgeValue = value;
        
        
        //设置Nav的item
        nav.tabBarItem = item;
        //将Navigation作为temp的子视图控制器。
        [temp addObject:nav];
    }
    self.viewControllers = temp;
}

- (void)DingZhiTabBarItem
{
    
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
