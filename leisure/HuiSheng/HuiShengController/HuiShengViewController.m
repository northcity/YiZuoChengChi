//
//  HuiShengViewController.m
//  leisure
//
//  Created by qianfeng0 on 16/2/26.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "HuiShengViewController.h"
#import "LXSMViewController.h"
#import "YuanChuangYinYueViewController.h"
#import "FCBZViewController.h"
#import "LXYYViewController.h"
#import "XYMYViewController.h"
#import "XZYYViewController.h"
#import "QGViewController.h"
#import "XYMYViewController.h"
#import "LXViewController.h"
#import "SZRDViewController.h"
#import "GYSJViewController.h"
#import "YSDWViewController.h"
#import "TKXViewController.h"
#import "QGYHViewController.h"
#import "ZCSHViewController.h"
#import "LZDCViewController.h"
#import "GSMWViewController.h"
#import "QXDTViewController.h"
#import "YXJMViewController.h"
#import "3DHSViewController.h"

@interface HuiShengViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UIImageView *image;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *dataSource;
@property(nonatomic,strong)UIImageView *BackImage;
@end

@implementation HuiShengViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.image = [[UIImageView alloc]initWithFrame:self.view.bounds];
//    [self.image sd_setImageWithURL:[NSURL URLWithString:@"http://g.hiphotos.baidu.com/image/h%3D200/sign=a622e6cfd02a28345ca6310b6bb4c92e/91ef76c6a7efce1b5b6d3e18ab51f3deb58f659a.jpg"]];
//    [self.view addSubview:self.image];
//
//    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
//
//        UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
//    
//        effectView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 680);
//    
//        effectView.alpha = 0.8;
//    
//        [self.image addSubview:effectView];

}


- (void)initData{

    self.dataSource = @[@"两性私密",@"原创音乐",@"翻唱伴奏",@"流行音乐",@"校园民谣",@"小众音乐",@"情感",@"校园",@"旅行",@"时政热点",@"光影世界",@"有声读物",@"脱口秀",@"情感夜话",@"职场生活",@"励志典藏",@"故事美文",@"旗下电台",@"优秀节目"];
}

- (void)createView
{
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.rowHeight = 50.f;
    self.BackImage = [[UIImageView alloc]initWithFrame:self.view.bounds];
    [self.BackImage sd_setImageWithURL:[NSURL URLWithString:@"http://h.hiphotos.baidu.com/image/h%3D200/sign=a0184301d500baa1a52c40bb7711b9b1/b219ebc4b74543a9bd0374211a178a82b80114c6.jpg"]];
  //  self.BackImage.alpha = 0.5f;
   // [self.view addSubview:self.BackImage];
    UIImageView *imagee = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"meinv.jpg"]];
    
    [self.tableView setBackgroundView:imagee];
 //   self.tableView.alpha = 0.2f;
  
    
    //没有边线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    //边线颜色
    self.tableView.separatorColor = [UIColor redColor];

    [self.view addSubview:self.tableView];
    
    
    
    [self createRightNavigationBarButtonWithTitle:@"电台" target:self action:@selector(Push)];
}
- (void)Push
{
    _DHSViewController *dvc = [[_DHSViewController alloc]init];
    [self.navigationController pushViewController:dvc animated:YES];
}


- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *string = @"cell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:string forIndexPath:indexPath];
    cell.textLabel.text = self.dataSource[indexPath.row];
    
    cell.backgroundColor=[UIColor clearColor];//关键语句

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *array = @[@"LXSMViewController",@"YuanChuangYinYueViewController",@"FCBZViewController",@"LXYYViewController",@"XYMYViewController",@"XZYYViewController",@"QGViewController",@"XYMYViewController",@"LXViewController",@"SZRDViewController",@"GYSJViewController",@"YSDWViewController",
@"TKXViewController",@"QGYHViewController",@"ZCSHViewController",@"LZDCViewController",@"GSMWViewController",@"QXDTViewController",@"YXJMViewController"];
    Class cls =NSClassFromString (array[indexPath.row]);
    
    UIViewController *vc = [[cls alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
    
    //NSLog(@"%@",cls);

}



@end
