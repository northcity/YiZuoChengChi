//
//  ViewController.m
//  leisure
//
//  Created by qianfeng0 on 16/2/22.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "ViewController.h"
#import "Factory.h"
#import "HelperDefine.h"
#import "UIView+Addition.h"
#import "TearsViewController.h"


@interface ViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIPageControl *pageControl;
@property(nonatomic,strong)NSArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatFristScrollView];
   // [self.view insertSubview:self.EnterButton aboveSubview:self.scrollView];
}


- (void)creatFristScrollView
{
    [self initData];
    [self creatView];
}

- (void)initData
{
   
    self.dataSource = @[@"f0.jpg",@"f1.jpg",@"f2.jpg",@"f3.jpg"];
   // //NSLog(@"%@",self.dataSource);
}

- (void)creatView
{
    self.scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    self.scrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.scrollView];
    
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(50, ScreenHeight-64, ScreenWidth-100, 20)];
    self.pageControl.backgroundColor = [UIColor clearColor];
    self.pageControl.numberOfPages = self.dataSource.count;
    [self.pageControl addTarget:self action:@selector(pageChange) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.pageControl];
    //设置滚动进度条的风格
    self.scrollView.indicatorStyle = UIScrollViewIndicatorStyleDefault;

    [self addImageToScrollView];
}

- (void)addImageToScrollView {
    for (int i = 0; i < self.dataSource.count; i ++) {
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(i * ScreenWidth, 0, ScreenWidth, ScreenHeight)];
        
        image.image = [UIImage imageNamed:[NSString stringWithFormat:@"f%d.jpg",i]];
        ////NSLog(@"%@",image.image);
        [self.scrollView addSubview:image];
    }
    self.scrollView.contentSize = CGSizeMake(ScreenWidth * self.dataSource.count, 0);
   
    self.EnterButton = [Factory createButtonWithTitle:@"进入" frame:CGRectMake(ScreenWidth*(self.dataSource.count-1)+20,100, ScreenWidth-40, 44) target:self action:@selector(buttonDidClicled)];
    self.EnterButton.backgroundColor = [UIColor clearColor];
   
    [self.scrollView addSubview:self.EnterButton];
}
- (void)buttonDidClicled
{
    TearsViewController *tvc =  [[TearsViewController alloc]init];
    [self presentViewController:tvc animated:YES completion:^{
    //    //NSLog(@"111");
    
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - pageControl页码切换
- (void)pageChange {
    //当点击事件触发，使scrollView发生偏移
    [self.scrollView setContentOffset:CGPointMake(self.pageControl.currentPage * ScreenWidth, 0) animated:YES];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //contentOffset指的是偏移量。scrollView不移动，不发生偏移。
    //scrollView的frame中得宽和高与contentSize中得宽和高无关
    //NSInteger page = (scrollView.contentOffset.x - scrollView.width)/scrollView.width + 1;
    /*
     修正跳页，可以使用。
     */
    NSInteger page = scrollView.contentOffset.x/scrollView.width;
  //  //NSLog(@"%ld", page);
    //将计算得到的页码交给pageControl
    self.pageControl.currentPage = page;
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    self.scrollView.scrollEnabled = NO;

}

@end
