//
//  TearsWebViewController.m
//  leisure
//
//  Created by qianfeng0 on 16/3/2.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "TearsWebViewController.h"
#import "DatabaseManager.h"
#import "TearsItemModel.h"

@interface TearsWebViewController ()<UIWebViewDelegate>{

    NSString *_originUrl;
}

@property(nonatomic,strong)TearsItemModel *model;
@property (nonatomic, strong) UIWebView *webView;
@property(nonatomic,strong)UIImageView *image;
@end

@implementation TearsWebViewController


- (instancetype)initWithData:(TearsItemModel *)model
{
    self = [super init];
    if (self) {
        _model = model;
    }
    return self;
}

- (instancetype)initWithURL:(NSString *)originUrl
{
    self = [super init];
    if (self) {
        _originUrl = [originUrl copy];
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = NO;
}
-(void)viewWillDisappear:(BOOL)animated{
    
//    UINavigationController *rootVC = (UINavigationController *)[UIApplication sharedApplication].delegate.window.rootViewController;
//    UIViewController *currentVC = [[rootVC viewControllers] lastObject];
//    if ([currentVC isKindOfClass:[CollectionViewController class]]) {
//        self.navigationController.navigationBar.hidden = YES;
//    }
    
}



//- (void)viewDidAppear:(BOOL)animated
//{
//    self.tabBarController.tabBar.hidden = YES;
//
//}
//- (void)viewWillDisappear:(BOOL)animated
//{
//    self.tabBarController.tabBar.hidden = NO;
//}


- (void)viewDidLoad {
    [super viewDidLoad];

  
    self.title = self.model.title;
    self.webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    //    self.webView.allowsBackForwardNavigationGestures = YES;
    
    self.webView.delegate = self;
    [self.view addSubview:self.webView];
    
    ////NSLog(@"%@",self.model.share);
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.model.origin_url]]];
    [self AddSwipeGesture];



    UIButton *button1 = [Factory createButtonWithTitle:@"" frame:CGRectMake(ScreenWidth-50, ScreenHeight-100, 50, 50) target:self action:@selector(collectionButtonClicked:)];
    button1.backgroundColor = [UIColor clearColor];
    [button1 setBackgroundImage:[UIImage imageNamed:@"laud.png"] forState:UIControlStateNormal];
    [self.view addSubview:button1];
    [self.view bringSubviewToFront:button1];

    
    
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, 44)];
    image.image = [UIImage imageNamed:@"titlebar_shadow"];
    [self.webView addSubview:image];
    [self.view bringSubviewToFront:image];
    
    if (PNCisIPHONEX) {
        image.frame = CGRectMake(0, 84, ScreenWidth, 44);
    }
}

- (void)fanHuiShouCang
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)collectionButtonClicked:(UIButton *)button
{
    DatabaseManager *manager = [DatabaseManager shareSingleton];
    if (![manager checkDataDidCollection:self.model]) {
        [manager insertData:self.model];
        [button setBackgroundImage:[UIImage imageNamed:@"laud_selected.png"] forState:UIControlStateNormal];
    }else{
        [manager deleteData:self.model];
        [button setBackgroundImage:[UIImage imageNamed:@"laud.png"] forState:UIControlStateNormal];

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
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



@end
