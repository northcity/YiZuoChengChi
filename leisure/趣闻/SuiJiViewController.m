//
//  SuiJiViewController.m
//  leisure
//
//  Created by qianfeng0 on 16/2/27.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "SuiJiViewController.h"
#import "MeiRiTableViewCell.h"

#define MRURL @"http://api.meiriyiwen.com/v2/day?date=%@&version=4"

@interface SuiJiViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSMutableDictionary *dict;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,copy)NSString *daTTTTTTTTTT;

@end

@implementation SuiJiViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.title = @"旧城";
}


- (void)initData
{
    
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%f", a];
    NSString *ten = [timeString substringToIndex:10];
    NSInteger Suiji = [ten integerValue] - 86400*(arc4random()%30);
    
    //NSLog(@"%ld",Suiji);
    
    
    NSString *str= [NSString stringWithFormat:@"%ld",Suiji];//时间戳
    
    NSTimeInterval time=[str doubleValue]+28800;//因为时差问题要加8小时 == 28800 sec
    
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:time];
    
    //NSLog(@"date:%@",[detaildate description]);
    
    //实例化一个NSDateFormatter对象
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    //设定时间格式,这里可以设置成自己需要的格式
    
    [dateFormatter setDateFormat:@"yyyyMMdd"];
    
    
    
    NSString *currentDateStr = [dateFormatter stringFromDate: detaildate];
    
    
       NSString *url = [NSString stringWithFormat:MRURL,currentDateStr];

    NSLog(@"%@",currentDateStr);
    
    self.daTTTTTTTTTT = currentDateStr;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    __weak typeof (self)weakSelf = self;
    
    
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //NSLog(@"接收成功");
        weakSelf.dict = [[NSMutableDictionary alloc]init];
        
        
        weakSelf.dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        [weakSelf.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //NSLog(@"接受失败");
    }];
}




- (void)createView
{
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
    //  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"MeiRiTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    // self.tableView.rowHeight = 500;
    
    
     [self.tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"header"];
  
    self.tableView.estimatedRowHeight = 10000.f;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;

    
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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *string = @"cell";
    MeiRiTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:string forIndexPath:indexPath];
    
    //  [cell setBackgroundView:self.image];
    // cell.alpha = 1;
    //  cell.Content.text =self.dict[@"content"];
    NSString *str = self.dict[@"content"];
    
    NSString *str1 = @"<p>";
    NSString *str2 = @"</p>";
    
    NSArray *array = [str componentsSeparatedByString:str1];
 //  //NSLog(@"%@",array);
    
    NSString *str3 = [array componentsJoinedByString:@"    "];
    
    NSArray * array2 =  [str3 componentsSeparatedByString:str2];
    NSMutableArray * array3 = [[NSMutableArray alloc]initWithArray:array2];
    [array3 removeObject:@""];
    
    NSString *str4 = [array3 componentsJoinedByString:@""];
    
    cell.Content.text = str4;
    
    cell.backgroundView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backgroundDeng.png"]];
    
    //  //NSLog(@"%@",self.dict[@"content"]);
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleDefault];
    
    
    
    
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    
    cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backgroundDeng.png"]];
    
    
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineSpacing = 5;
    
    NSDictionary *attributes = @{ NSFontAttributeName:[UIFont systemFontOfSize:14], NSParagraphStyleAttributeName:paragraphStyle};
    cell.Content.attributedText = [[NSAttributedString alloc]initWithString:cell.Content.text attributes:attributes];
    cell.title.text = self.dict[@"title"];
    return  cell;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    
    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"titlebar_shadow1@.png"]];
    UIView *header = (UIView *)[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
    [header addSubview:image];
    
    
   
    
    
    NSString *lableString = [NSString stringWithFormat:@"Day:~~%@~~",self.daTTTTTTTTTT];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 8,ScreenWidth, 20)];
    label.backgroundColor = [UIColor clearColor];
    label.text = lableString;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont italicSystemFontOfSize:15.f];
    label.font = [UIFont boldSystemFontOfSize:15.f];
    label.shadowColor = [UIColor whiteColor];
    label.shadowOffset = CGSizeMake(1, 1);
    label.font = [UIFont fontWithName:@"Cochin-BoldItalic" size:15.f];
    
    [header addSubview:label];
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 30;
}
@end
