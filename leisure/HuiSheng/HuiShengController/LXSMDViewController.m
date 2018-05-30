//
//  LXSMDViewController.m
//  leisure
//
//  Created by ypf on 16/2/28.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "LXSMDViewController.h"

#import "NSString+Hashing.h"
#import "HelperDefine.h"
#import "UIView+Addition.h"
#import "JSONModel.h"

#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"
#import "JHRefresh.h"

#import "LXSMDModel.h"
#import "LXSMModel.h"
#import "HSZYTableViewCell.h"
#import "LXSMPLAYViewController.h"
#import "LXSMDTableViewCell.h"



#import <AVFoundation/AVFoundation.h>
#define LXSMDURL @"http://www.duole.fm/api/collect/get_sound_list?collect_id=%@&limit=20&sort=1&page=1&visitor_uid=256492&only_id=0&device=android&app_version=23"



#import "SDCycleScrollView.h"

@interface LXSMDViewController ()<UITableViewDataSource,UITableViewDelegate,SDCycleScrollViewDelegate>

{
    NSTimer *_timer;            //定时器对象

}
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)JSONModelArray *dataSource;
@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)LXSMModel *model;

@property (nonatomic, strong) AVAudioSession *session;

//@property(nonatomic,strong)AVAudioPlayer *player;

@property(nonatomic,strong)STKAudioPlayer *plaYYYYY;


@property (nonatomic,retain)CABasicAnimation *basicAnimation;

@end

@implementation LXSMDViewController


- (instancetype)initWithModel:(LXSMModel *)model
{
    self = [super init];
    if (self) {
        _model = model;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];


}

- (void)initData
{
 
#pragma  mark -----------------------初始化播放器----------------------------
    
    self.dataArray = [[NSMutableArray alloc]init];
    [self getNetData];
}

- (void)getNetData
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    __weak typeof (self)weakSelf = self;
    
    NSString *url = [NSString stringWithFormat:LXSMDURL,self.model.pageID];
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //NSLog(@"接收成功");
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
       // //NSLog(@"%@",dict);
        
        weakSelf.dataArray = dict[@"data"];
        weakSelf.dataSource= [[JSONModelArray alloc]initWithArray:self.dataArray modelClass:[LXSMDModel class]];
        
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //NSLog(@"接受失败");
    }];
    
}

- (void)createView
{
    self.tableView  = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"LXSMDTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    self.tableView.rowHeight = 100.f;
    //    self.tableView.estimatedRowHeight = 100.f;
   
    
    [self.tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"header"];

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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *string = @"cell";
    
    LXSMDTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:string forIndexPath:indexPath];
    LXSMDModel *model = self.dataSource[indexPath.row];

    [cell setCellContent:model];
   
    return  cell;
}

#pragma mark-------------------------button-------------------


#pragma mark ---------------头视图---------

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSArray *imageNames = @[@"S0",@"S1",@"S2",@"S3",@"S4"];
    
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, ScreenWidth, 200) shouldInfiniteLoop:YES imageNamesGroup:imageNames];
    cycleScrollView.delegate = self;
    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
   
    cycleScrollView.autoScrollTimeInterval = 4.0f;
    UIView *header = (UIView *)[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];

    [header addSubview:cycleScrollView];
    
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 200;
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
