//
//  TearsViewController.m
//  leisure
//
//  Created by qianfeng0 on 16/2/22.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "TearsViewController.h"
#import "TearsItemModel.h"
#import "SMTableViewCell.h"
#import "TearsWebViewController.h"
#import "MEEEEViewController.h"
#import "CacheManager.h"


#define SMURLAPI @"http://reader.smartisan.com/index.php?r=line/show&art_id=%@&page_size=20"
//#define SMURLAPI @"http://reader.smartisan.com/index.php?r=userLine/show&art_id=1534467&page_size=20"
@interface TearsViewController ()<UITableViewDataSource,UITableViewDelegate,SDCycleScrollViewDelegate>

@property(nonatomic,strong)JSONModelArray *dataAAAAAAA;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataBBBBB;

@property(nonatomic,strong)NSIndexPath *MyIndexpath;

@property(nonatomic,copy)NSString *pageID;

@property(nonatomic,assign)NSInteger page;

@property(nonatomic,copy)NSString *originUrl;

@end

@implementation TearsViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"随读";
//    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
//    self.navigationItem.backBarButtonItem = item;
//    [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //   self.title = @"快报";

//    UIButton *button = [Factory createButtonWithTitle:@"" frame:CGRectMake(12, 5, 35, 35) target:self action:@selector(pushViewControllerhaha:)];
//    [self.navigationController.navigationBar addSubview:button];
//    button.backgroundColor = [UIColor clearColor];
//    [button setBackgroundImage:[UIImage imageNamed:@"add_favorite_empty.png"] forState:UIControlStateNormal];
//    
//    UILabel *label = [Factory createLabelWithTitle:@"ME" frame:CGRectMake(50, 5, 40, 40)];
//    [self.navigationController.navigationBar addSubview:label];
    
    
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"titlebar_bg1.png"] forBarMetrics:(UIBarMetricsDefault)];
//    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
   
    
    
    UIImageView *pin = [[UIImageView alloc]initWithFrame:CGRectMake(10, 35, 60, 30)];
    pin.image = [UIImage imageNamed:@"pin"];
    
    [self.navigationController.navigationBar addSubview:pin];
    
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, 44)];
    image.image = [UIImage imageNamed:@"titlebar_shadow"];
    [self.view insertSubview:image aboveSubview:self.tableView];
    
    if (PNCisIPHONEX) {
        image.frame = CGRectMake(0, 84, ScreenWidth, 44);
    }
    
    UILabel *title = [Factory createLabelWithTitle:@"随读" frame:CGRectMake(20, 8, ScreenWidth-40, 30)];
//    [self.navigationController.navigationBar addSubview:title];
    title.font = [UIFont boldSystemFontOfSize:18.f];
    title.textColor = [UIColor whiteColor];
    title.textAlignment = NSTextAlignmentCenter;
    

    
    
  //  [self createleftNavigationBarButtonWithTitle:@"我的" target:self action:@selector(pushViewControllerhaha)];
//self.navigationController.navigationItem set
}

- (void)pushViewControllerhaha:(UIButton *)button
{
    [button setBackgroundImage:[UIImage imageNamed:@"add_favorite_empty.png"] forState:UIControlStateNormal];

    
   MEEEEViewController *mvc = [[MEEEEViewController alloc]init];
    [self.navigationController pushViewController:mvc animated:YES];    //
//    CATransition *anima = [CATransition animation];
//    [anima setType:kCATransitionFade];
//    [anima setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
//    
//    
//    anima.duration = 1;
//    //@"cube"－ 立方体效果  @"suckEffect"－收缩效果，如一块布被抽走   @"oglFlip"－上下翻转效果   @"rippleEffect"－滴水效果  @"pageCurl"－向上翻一页  @"pageUnCurl"－向下翻一页 @"rotate" 旋转效果 @"cameraIrisHollowOpen"     相机镜头打开效果(不支持过渡方向)  @"cameraIrisHollowClose"    相机镜头关上效果(不支持过渡方向)
//    //动画类型
//    //kCATransitionFade    新视图逐渐显示在屏幕上，旧视图逐渐淡化出视野
//    //kCATransitionMoveIn  新视图移动到旧视图上面，好像盖在上面
//    //kCATransitionPush    新视图将旧视图退出去
//    //kCATransitionReveal  将旧视图移开显示下面的新视图
//    anima.type = @"cube";
//    anima.subtype = kCATransitionFromRight;
//    
//    //放到 导航的view 的layer   两个子视图控制器的view 都在 导航的view上
//    [self.navigationController.view.layer addAnimation:anima forKey:nil];
//    
//    [self.navigationController pushViewController:mvc animated:YES];
//
    
}
- (void)initData{
    
    self.pageID = 0;
    self.dataBBBBB = [[NSMutableArray alloc]init];
    
    [self getNetData];
}

- (void)getNetData
{
    UIWindow *win = [UIApplication sharedApplication].keyWindow;
    [MBProgressHUD showHUDAddedTo:win animated:YES];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    __weak typeof (self)weakSelf = self;
    [MBProgressHUD hideAllHUDsForView:win animated:YES];
    
    
    NSString *url = [NSString stringWithFormat:SMURLAPI,weakSelf.pageID];
   
    //NSLog(@"%@",url);
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        [CacheManager writeDataToCache:responseObject withUrl:url];
        
      //  //NSLog(@"%@",dict);
        
        if (weakSelf.pageID == 0) {
            [weakSelf.dataBBBBB removeAllObjects];
        }

        
        
        NSDictionary *listdict =dict[@"data"];
        
        [weakSelf.dataBBBBB addObjectsFromArray:listdict[@"list"]];
        
        NSDictionary *dictTTT = [weakSelf.dataBBBBB lastObject];
        weakSelf.pageID = dictTTT[@"id"];
        //NSLog(@"%@",weakSelf.pageID);
        
        //   //NSLog(@"%@",listdict);
        weakSelf.dataAAAAAAA = [[JSONModelArray alloc]initWithArray:weakSelf.dataBBBBB modelClass:[TearsItemModel class]];
        
        [weakSelf.tableView footerEndRefreshing];
        //结束下拉刷新
        [weakSelf.tableView headerEndRefreshingWithResult:JHRefreshResultSuccess];
        //数据整理完毕即可刷新视图
        [weakSelf.tableView reloadData];
        
        
    
    
    
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
             //取出URL，因为URL是我们缓存的路径
             NSString *url = operation.request.URL.absoluteString;
             //根据url从缓存中读取数据，并且将数据作为返回值返回
             id responseObject = [CacheManager getDataFromCache:url];
#warning 陈希
        NSDictionary *dict  = [NSDictionary dictionary];
        if (responseObject &&responseObject != nil) {
         dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        }
        
        
        if (weakSelf.pageID == 0) {
            [weakSelf.dataBBBBB removeAllObjects];
        }
        
        
        
        NSDictionary *listdict =dict[@"data"];
        
        [weakSelf.dataBBBBB addObjectsFromArray:listdict[@"list"]];
        
        NSDictionary *dictTTT = [weakSelf.dataBBBBB lastObject];
        weakSelf.pageID = dictTTT[@"id"];
        //NSLog(@"%@",weakSelf.pageID);
        
        //   //NSLog(@"%@",listdict);
        weakSelf.dataAAAAAAA = [[JSONModelArray alloc]initWithArray:weakSelf.dataBBBBB modelClass:[TearsItemModel class]];
        
        [weakSelf.tableView footerEndRefreshing];
        //结束下拉刷新
        //[weakSelf.tableView headerEndRefreshingWithResult:JHRefreshResultSuccess];
        //数据整理完毕即可刷新视图
        [weakSelf.tableView reloadData];
        

             
             
    }];
}
- (void)createView
{
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    // [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"SMTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
   // self.tableView.rowHeight = 320.f;
    
    self.tableView.estimatedRowHeight = 1000.f;
    
    
   [self addRefreshView];
}


- (void)addRefreshView {
    __weak typeof(self) weakSelf = self;
    [self.tableView addRefreshHeaderViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        weakSelf.pageID = 0;
        [weakSelf getNetData];
    }];
    
    [self.tableView addRefreshFooterViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
       // NSDictionary *dict = [weakSelf.dataBBBBB lastObject];
//        weakSelf.pageID = dict[@"pageID"];
//        
//        //NSLog(@"%@",weakSelf.pageID);
//        
        
        [weakSelf getNetData];
    }];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
 //   //NSLog(@"%ld",self.dataAAAAAAA.count);
    return self.dataAAAAAAA.count ;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *string = @"cell";
    
    
    SMTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:string forIndexPath:indexPath];
    TearsItemModel *model = self.dataAAAAAAA[indexPath.row];
    ////NSLog(@"%@",model);
    [cell setCellContent:model];
    
    
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    
    cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backgroundDeng.png"]];
    
    
        return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TearsItemModel *model = self.dataAAAAAAA[indexPath.row];
    TearsWebViewController *tvc = [[TearsWebViewController alloc]initWithData:model];
    
    [self.navigationController pushViewController:tvc animated:YES];
    
    
   // tvc.navigationController.navigationBarHidden = YES;
 //   [[UIApplication sharedApplication] openURL:[NSURL URLWithString:model.origin_url]];
    
    
}




@end
