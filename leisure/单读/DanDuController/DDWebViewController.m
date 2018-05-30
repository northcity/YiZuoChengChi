//
//  DDWebViewController.m
//  leisure
//
//  Created by qianfeng0 on 16/2/25.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "DDWebViewController.h"
#import "DDDatasModel.h"
#import <WebKit/WebKit.h>
#import "LeafProgressView.h"

@interface DDWebViewController ()<UIWebViewDelegate>

@property(nonatomic,strong)DDDatasModel *model;

@property (nonatomic, strong) UIWebView *webView;

@property (nonatomic, strong) NSTimer *timer;

@property(nonatomic,strong)LeafProgressView *progress;
@property(nonatomic,strong)UIVisualEffectView *effectView;
@property(nonatomic,strong)UIBlurEffect *effect;
@end

@implementation DDWebViewController


- (instancetype)initWithData:(DDDatasModel *)model
{
    self = [super init];
    if (self) {
        _model = model;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
   
      //  [_progress startLoading];
    
    
    self.navigationItem.leftItemsSupplementBackButton = YES;
    self.webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
//    self.webView.allowsBackForwardNavigationGestures = YES;
    
    self.webView.delegate = self;
    [self.view addSubview:self.webView];

    //NSLog(@"%@",self.model.share);
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.model.share]]];
    [self AddSwipeGesture];
    [self AddSwipeGesture2];

    
        self.effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    
        self.effectView = [[UIVisualEffectView alloc] initWithEffect:self.effect];
    
        self.effectView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 680);
    
            self.effectView.alpha = 1.f;
    self.effectView.userInteractionEnabled = YES;
   //     [self.webView addSubview:self.effectView];

    self.progress = [[LeafProgressView alloc]initWithFrame:CGRectMake(36, 200, 248, 35)];
  //  [self.effectView addSubview:_progress];


}

#define GUANGGAO @"http://img.owspace.com/images/h5/owappbk.png?0108"
#pragma mark---------------------去广告-0----------------------

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if ([request.URL.absoluteString hasSuffix:GUANGGAO]) {
        return NO;
    }
    
    //NSLog(@"开始请求数据");
    return YES;
}


#pragma mark---------------------添加右划手势----------------------------


- (void)AddSwipeGesture
{
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeGestureAction:)];
    swipe.direction = UISwipeGestureRecognizerDirectionRight;

    [self.view addGestureRecognizer:swipe];
}

-(void)swipeGestureAction:(UISwipeGestureRecognizer *)gesture
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)AddSwipeGesture2
{
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeGestureAction2:)];
    swipe.direction = UISwipeGestureRecognizerDirectionLeft;
    
    [self.view addGestureRecognizer:swipe];
}

-(void)swipeGestureAction2:(UISwipeGestureRecognizer *)gesture
{
    [self.effectView removeFromSuperview];
}



- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(refreshWebProgres) userInfo:nil repeats:YES];
    //NSLog(@"开始下载");
    [_progress startLoading];
    
   // [_progress setProgress:self.webView.estimatedProgress];
}

- (void)webViewWebContentProcessDidTerminate:(WKWebView *)webView {
    //NSLog(@"进度结束");
}

- (void)refreshWebProgres {
    //estimatedProgress 下载进度
  //  //NSLog(@"%f", self.webView.estimatedProgress);
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
  
    [self.timer invalidate];
    self.timer = nil;
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
