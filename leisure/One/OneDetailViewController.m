//
//  OneDetailViewController.m
//  leisure
//
//  Created by qianfeng0 on 16/3/5.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "OneDetailViewController.h"

#define OneURL @"http://m.wufazhuce.com/one"
@interface OneDetailViewController ()

@property(nonatomic,strong)UIWebView *webView;
@end

@implementation OneDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    //    self.webView.allowsBackForwardNavigationGestures = YES;
    
  [self.view addSubview:self.webView];
    
    ////NSLog(@"%@",self.model.share);
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:OneURL]]];

    
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, 44)];
    image.image = [UIImage imageNamed:@"titlebar_shadow"];
    [self.webView addSubview:image];
    [self.view bringSubviewToFront:image];

    if (PNCisIPHONEX) {
        image.frame = CGRectMake(0, 84, ScreenWidth, 44);
    }
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
