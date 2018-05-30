//
//  YuanChuangYinYueViewController.m
//  leisure
//
//  Created by qianfeng0 on 16/3/1.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "YuanChuangYinYueViewController.h"
#import "YCYYDViewController.h"
#import "SSSDModel.h"

#define YCYYURL @"http://www.duole.fm/api/category/get_collect_list?app_version=23&category_id=65&device=android&finish=0&limit=20&page=%ld&rm_empty=1&sort=3&visitor_uid=256492"

#define YCYYSURL @"http://www.duole.fm/api/recommend/foucs?v=23&device=android&app_version=23"





@interface YuanChuangYinYueViewController ()<UITableViewDataSource,UITableViewDelegate,SDCycleScrollViewDelegate>

@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)JSONModelArray *dataSource;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,assign)NSInteger page;

@property(nonatomic,strong)JSONModelArray *dataSSSSSSSS;
@property(nonatomic,strong)NSMutableArray *dataSSSSSSSB;
@property(nonatomic,strong)NSMutableArray *imageName;

@end

@implementation YuanChuangYinYueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  //  self.automaticallyAdjustsScrollViewInsets = YES;

    self.title = @"原创音乐";

    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, 44)];
    image.image = [UIImage imageNamed:@"titlebar_shadow"];
    //  [self.view insertSubview:image aboveSubview:self.tableView];
    
    if (PNCisIPHONEX) {
        image.frame = CGRectMake(0, 84, ScreenWidth, 44);
    }
    [self.view addSubview:image];
}

- (void)initData
{
    self.page = 1;
    
    self.dataSSSSSSSB = [[NSMutableArray alloc]init];
    self.dataArray = [[NSMutableArray alloc]init];
    [self getNetData];

     self.imageName = [[NSMutableArray alloc]initWithCapacity:0];
    
    SSSDModel *model = [[SSSDModel alloc]init];
    for (NSDictionary *data in self.dataSSSSSSSB) {
        model.picture_url = data[@"picture_url"];
        [self.imageName addObject:model];
    }
    //NSLog(@"%@",self.imageName);


}

- (void)getNetData
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    __weak typeof (self)weakSelf = self;
    
    NSString *url = [NSString stringWithFormat:YCYYURL,self.page];
    //NSLog(@"%@",url);
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //NSLog(@"接收成功");
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        if (weakSelf.page == 1) {
            [self.dataArray removeAllObjects];
        }
        
        
        // //NSLog(@"%@",dict);
        
#pragma mark___________--------------错了好几次----------------
        [weakSelf.dataArray addObjectsFromArray:dict[@"data"]];
        
        weakSelf.dataSource= [[JSONModelArray alloc]initWithArray:self.dataArray modelClass:[LXSMModel class]];
        
        //结束上拉加载
        [weakSelf.tableView footerEndRefreshing];
        //结束下拉刷新
        [weakSelf.tableView headerEndRefreshingWithResult:JHRefreshResultSuccess];
        //数据整理完毕即可刷新视图
        [weakSelf.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //NSLog(@"接受失败");
    }];
    
    [manager GET:YCYYSURL parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
         
             NSDictionary *dicts = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
             [weakSelf.dataSSSSSSSB addObjectsFromArray:dicts[@"data"]];
            // weakSelf.dataSSSSSSSS = [[JSONModelArray alloc]initWithArray:weakSelf.dataSSSSSSSB modelClass:[SSSDModel class]];
             
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             
         }];
    
    
    
    
}

- (void)createView
{
    self.tableView  = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"HSZYTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    self.tableView.rowHeight = 100.f;
    //    self.tableView.estimatedRowHeight = 100.f;
    [self.tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"header"];
    [self addRefreshView];
    
}

- (void)addRefreshView {
    __weak typeof(self) weakSelf = self;
    [self.tableView addRefreshHeaderViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        weakSelf.page = 1;
        [weakSelf getNetData];
    }];
    
    [self.tableView addRefreshFooterViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        weakSelf.page ++;
        [weakSelf getNetData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark --------------------代理---------------------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *string = @"cell";
    
    HSZYTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:string forIndexPath:indexPath];
    LXSMModel *model = self.dataSource[indexPath.row];

    [cell setCellContent:model];
    return  cell;

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LXSMModel *model = self.dataSource[indexPath.row];
   YCYYDViewController *lmc = [[YCYYDViewController alloc]initWithModel:model];
    [self.navigationController pushViewController:lmc animated:YES];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSArray *imageNames = @[@"S0",@"S1",@"S2",@"S3",@"S4"];
    
    
    
    
   
    
    
    
    
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, ScreenWidth, 200) shouldInfiniteLoop:YES imageNamesGroup:imageNames];
    
    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    
    cycleScrollView.autoScrollTimeInterval = 4.0f;
//
   UIView *header = (UIView *)[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
//        [header addSubview:image];
    [header addSubview:cycleScrollView];
    
//    SDCycleScrollView *cycleScrollView3 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, ScreenWidth, 180) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
//  //  cycleScrollView3.currentPageDotImage = [UIImage imageNamed:@"pageControlCurrentDot"];
// //   cycleScrollView3.pageDotImage = [UIImage imageNamed:@"pageControlDot"];
//    cycleScrollView3.imageURLStringsGroup = self.imageName;
//    
//    [header addSubview:cycleScrollView3];
    


    
    
    
    
    
    
    
    
    
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 200;
}





@end
