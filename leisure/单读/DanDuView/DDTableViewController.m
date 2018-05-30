//
//  DDTableViewController.m
//  leisure
//
//  Created by qianfeng0 on 16/2/25.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "DDTableViewController.h"
#import "DDDatasModel.h"
#import "DDTableViewCell.h"

#import "HelperDefine.h"
#import "UIView+Addition.h"
#import "JSONModel.h"

#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"
#import "JHRefresh.h"

#define DDURL @"http://static.owspace.com/?c=Api&a=getList&p=%ld&model=0&page_id=%@&create_time=%@&client=android&version=1.1.0&time=%ld&device_id=865931028550879"

#import "DDWebViewController.h"

#import "CBStoreHouseRefreshControl.h"
#import "CacheManager.h"


@interface DDTableViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@property(nonatomic,strong)JSONModelArray *dataAAAAAAAAAAAAAAAAAAAAAA;
@property(nonatomic,strong)NSMutableArray *dataSource;
@property(nonatomic,assign)NSInteger TimeEEEEEEEEEEEEEE;
@property(nonatomic,copy)NSString *TodayDate;
@property(nonatomic,assign)NSInteger PageID;
@property(nonatomic,assign)NSInteger PPP;

@property(nonatomic,copy)NSString *page;
@property(nonatomic,copy)NSString *creatTime;
@end

@implementation DDTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self creatView];
   
        
    
//    self.tabBarController.
   [self AddSwipeGesture];
}

#pragma mark--------------------数据处理---------------------
- (void)initData
{
    self.dataSource = [[NSMutableArray alloc]init];
    
    self.PPP = 0;
    self.page = @"0";
    self.creatTime = @"0";
    self.TimeEEEEEEEEEEEEEE = [self getTodayData];
    
    [self getNetData];
    //[self getTodayData];
    self.page = [[NSString alloc]init];
}

- (NSInteger)getTodayData
{
    
//    NSDate *date = [NSDatedateWithTimeIntervalSince1970:NSTimeIntervalSince1970];
    NSInteger date = [[NSDate date] timeIntervalSince1970];
    
    //NSLog(@"%ld",date);
    return date;
}
//1456454938
//337502
//1456117437
//338037
//1455779400
//1452547812
- (void)getNetData
{
    UIWindow *win = [UIApplication sharedApplication].keyWindow;
    [MBProgressHUD showHUDAddedTo:win animated:YES];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    __weak typeof (self)weakSelf = self;
  
    [MBProgressHUD hideHUDForView:win animated:YES];
    
   // NSInteger todayDate = [self getTodayData];
    NSString *url = [NSString stringWithFormat:DDURL,weakSelf.PPP,weakSelf.page,weakSelf.creatTime,weakSelf.TimeEEEEEEEEEEEEEE];
    //NSLog(@"%@",url);
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //NSLog(@"接收成功");
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
       // //NSLog(@"%@",dict);
        
        [CacheManager writeDataToCache:responseObject withUrl:url];

        
        
        [weakSelf Factory:dict];
        NSDictionary *dictTTT = [weakSelf.dataSource lastObject];
        // //NSLog(@"%@",dict);
        
        
        NSString *pageID = dictTTT[@"id"];
        //NSLog(@"%@",pageID);
        weakSelf.creatTime = dictTTT[@"create_time"];
        weakSelf.page = pageID;
        weakSelf.TodayDate = [NSString stringWithFormat:@"%ld",[weakSelf getTodayData]];
        //NSLog(@"%@",weakSelf.creatTime);
        if (weakSelf.PPP == 0 ) {
            [weakSelf.dataSource removeAllObjects];
            
        }
        
        
        [weakSelf.tableView footerEndRefreshing];
        [weakSelf.tableView headerEndRefreshingWithResult:JHRefreshResultSuccess];
        [self.tableView reloadData];
    
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //NSLog(@"接受失败");
    }];
}


- (void)Factory:(NSDictionary *)dict
{
    NSArray *datas = dict[@"datas"];
    [self.dataSource addObjectsFromArray:datas];
    self.dataAAAAAAAAAAAAAAAAAAAAAA = [[JSONModelArray alloc]initWithArray:self.dataSource modelClass:[DDDatasModel class]];
   // //NSLog(@"%@",self.dataAAAAAAAAAAAAAAAAAAAAAA);
}

#pragma mark-----------------------------------创建View------------------------------------



- (void)creatView
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    if (PNCisIPHONEX) {
        self.tableView.frame = CGRectMake(0, 84, ScreenWidth, ScreenHeight);
    }
    //self.navigationController.automaticallyAdjustsScrollViewInsets = NO;
    
    self.tableView.dataSource = self;
    self.tableView.delegate =self;
    self.tableView.pagingEnabled = YES;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"DDTableViewCell" bundle:nil] forCellReuseIdentifier:@"haha"];
   // self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;

    [self addRefreshView];
    
}

- (void)addRefreshView
{
    __weak typeof(self)weakSelf = self;
    [self.tableView addRefreshHeaderViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        weakSelf.TimeEEEEEEEEEEEEEE = [weakSelf getTodayData] ;
        weakSelf.PPP =0;
        weakSelf.creatTime = 0;
        weakSelf.page = 0;
        [weakSelf getNetData];
    }];
    [self.tableView addRefreshFooterViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
      
        weakSelf.TimeEEEEEEEEEEEEEE = weakSelf.TimeEEEEEEEEEEEEEE -345600;
        weakSelf.PPP++;
        [weakSelf getNetData];
    }];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}










#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  //  //NSLog(@"%ld",self.dataAAAAAAAAAAAAAAAAAAAAAA.count);

    return  self.dataAAAAAAAAAAAAAAAAAAAAAA.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    //buyaoyong系统的
    DDTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"haha" forIndexPath:indexPath];
    
    DDDatasModel *model = self.dataAAAAAAAAAAAAAAAAAAAAAA[indexPath.row];
   // //NSLog(@"%ld",self.dataAAAAAAAAAAAAAAAAAAAAAA.count);
    [cell setCellContent:model];
   
//    cell.effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
//    
//    cell.effectView = [[UIVisualEffectView alloc] initWithEffect:cell.effect];
//    
//    cell.effectView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 680);
//    
//        cell.effectView.alpha = 0.8;
//    
//    [cell.image addSubview:cell.effectView];

    
    
    
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return ScreenHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DDDatasModel *model = self.dataAAAAAAAAAAAAAAAAAAAAAA[indexPath.row];
    
    DDWebViewController *Wvc = [[DDWebViewController alloc]initWithData:model];
    [self.navigationController pushViewController:Wvc animated:YES];
}


- (void)AddSwipeGesture
{
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeGestureAction:)];
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.view addGestureRecognizer:swipe];
}

-(void)swipeGestureAction:(UISwipeGestureRecognizer *)gesture
{
    [self transformer];
}

- (void)transformer {
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:1.f animations:^{
        weakSelf.tabBarController.tabBar.hidden = NO;
    } completion:^(BOOL finished) {
        
    }];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    ////NSLog(@"滚动视图已经停止减速");
    
//    self.tabBarController.tabBar.hidden = YES;
   // self.navigationController.navigationBarHidden = YES;
  //  self.navigationController.navigationBar.hidden = YES;
}
@end
