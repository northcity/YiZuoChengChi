//
//  MEView/Users/qianfeng0/Desktop/leisure/leisure.xcodeprojController.m
//  leisure
//
//  Created by qianfeng0 on 16/2/23.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "MEViewController.h"
#import "MEModel.h"
#import "HelperDefine.h"
#import "UIView+Addition.h"
#import "JSONModel.h"

#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"
#import "JHRefresh.h"
#import "RWTableViewCell.h"
#import "METableViewCell.h"

#define MEURL @"http://app.16k.cn/e/extend/tzhu/tzhu_api.php?type=getarticlelist&pagesize=30&channel=2&appkey=N5Q3SUERWYHIJ6CMGLF9X80TK7P1ZBO4D2AV&isgood=0&order=lastdotime&typeid=0&pagenum=1&mid=undefined&uname=undefined&mlrnd=undefined"



@interface MEViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UIImageView *image;

@property(nonatomic,strong)NSMutableArray *dataSourcre;
@property(nonatomic,strong)JSONModelArray *dataAAAAAAAAAAAAA;
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation MEViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)initData
{
    self.dataSourcre = [[NSMutableArray alloc]init];
    [self getNetData];
}
-(void)getNetData
{

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    __weak typeof (self)weakSelf = self;
    
    [manager GET:MEURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
     //    //NSLog(@"%@",dict);
        weakSelf.dataSourcre = dict[@"data"];
        weakSelf.dataAAAAAAAAAAAAA = [[JSONModelArray alloc]initWithArray:self.dataSourcre modelClass:[MEModel class]];
        
//        [weakSelf.tableView footerEndRefreshing];
//        [weakSelf.tableView headerEndRefreshingWithResult:JHRefreshResultSuccess];
        
        [weakSelf.tableView reloadData];
        //NSLog(@"接收成功");
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];

    
}

- (void)createView
{
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"METableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.estimatedRowHeight = 100;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
 

    
    [self.view addSubview:self.tableView];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
 //   //NSLog(@"%ld",self.dataAAAAAAAAAAAAA.count);
    
    return self.dataAAAAAAAAAAAAA.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
    METableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    MEModel *model = self.dataAAAAAAAAAAAAA[indexPath.row];
   
    NSString *str = [NSString stringWithFormat:@"http://app.16k.cn%@",model.image];
 //   //NSLog(@"%@",str);
    [ cell.Image sd_setImageWithURL:[NSURL URLWithString:str]];
    cell.title.text = model.title;
    cell.Content.text = model.writer;
    
    cell.imageHight.constant = [model.diggtop floatValue]/4;
    cell.imageWith.constant = [model.diggdown floatValue]/2;
    
    
    return cell;
}

@end
