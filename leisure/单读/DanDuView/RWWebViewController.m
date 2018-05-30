//
//  RWWebViewController.m
//  leisure
//
//  Created by qianfeng0 on 16/2/27.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "RWWebViewController.h"
#import "RWModel.h"
#import <WebKit/WebKit.h>

@interface RWWebViewController ()

@property (nonatomic, strong) WKWebView *webView;
@property(nonatomic,strong)RWModel *model;


@end

@implementation RWWebViewController



- (instancetype)initWithData:(RWModel *)model
{
    self = [super init];
    if (self) {
        _model = model;
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];

    
   // self.navigationController .navigationBar.hidden = NO;

    self.navigationItem.leftItemsSupplementBackButton = YES;
    self.webView = [[WKWebView alloc]initWithFrame:self.view.bounds];
    self.webView.allowsBackForwardNavigationGestures = YES;
    
   // self.webView.navigationDelegate = self.view;
    [self.view addSubview:self.webView];
    
    //NSLog(@"%@",self.model.url);
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.model.url]]];

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
