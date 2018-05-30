//
//  QuWenViewController.m
//  leisure
//
//  Created by qianfeng0 on 16/2/23.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "QuWenViewController.h"
#import "JSONModel.h"
#import "MeiRiYiWenModel.h"

#import "MeiRiTableViewCell.h"

#import "SuiJiViewController.h"
#import "WZFlashButton.h"
#import "3DHSViewController.h"
#import "OneDetailViewController.h"

#define MRURL @"http://api.meiriyiwen.com/v2/day?date=%@&version=4"
@interface QuWenViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UIImageView *image;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)JSONModelArray *dataSource;
@property(nonatomic,strong)NSMutableArray *dataAAAAAA;
@property(nonatomic,strong)NSMutableDictionary *dict;

@property(nonatomic,strong) UIButton *oneButton;
@property(nonatomic,strong) UILabel *oneLabel;

@end

@implementation QuWenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"故事";

    [self createView1];
//    UILabel *title = [Factory createLabelWithTitle:@"故事" frame:CGRectMake(20, 8, ScreenWidth-40, 30)];
//    [self.navigationController.navigationBar addSubview:title];
//    title.font = [UIFont boldSystemFontOfSize:18.f];
//    title.textColor = [UIColor whiteColor];
//    title.textAlignment = NSTextAlignmentCenter;
//    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
//    self.navigationItem.backBarButtonItem = item;

//    self.navigationController.hidesBarsOnSwipe = NO;
    
    UIImageView *pin = [[UIImageView alloc]initWithFrame:CGRectMake(10, 35, 60, 30)];
    pin.image = [UIImage imageNamed:@"pin"];
    [self.navigationController.navigationBar addSubview:pin];
    
    
    

    UIButton *button = [Factory createButtonWithTitle:@"随" frame:CGRectMake(ScreenWidth-90, ScreenHeight-120, 60, 60) target:self action:@selector(buttonDidClicked)];
    
    if (PNCisIPHONEX) {
        button.frame = CGRectMake(ScreenWidth-90, ScreenHeight-140, 60, 60);
    }
    
    [button setTitleColor:BlackColor forState:UIControlStateNormal];
    button.backgroundColor = ClearColor;
    button.layer.cornerRadius =  25.f;
    button.titleLabel.font = [UIFont fontWithName:@"Wyue-GutiFangsong-NC" size:25];
    [button setBackgroundImage:[UIImage imageNamed:@"avator_profile"] forState:UIControlStateNormal];
    
    [self.view addSubview:button];

    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, 44)];
    if (PNCisIPHONEX) {
        image.frame = CGRectMake(0, 84, ScreenWidth, 44);
    }
    image.image = [UIImage imageNamed:@"titlebar_shadow"];
    [self.view insertSubview:image aboveSubview:self.tableView];

    if (PNCisIPHONEX) {
        image.frame = CGRectMake(0, 84, ScreenWidth, 44);
    }
}

- (void)createView1
{
    UIButton *button1 = [Factory createButtonWithTitle:@"" frame:CGRectMake(ScreenWidth-80, 76, 30, 30) target:self action:@selector(PushYinYue)];
    //   [self.navigationController.navigationBar addSubview:button1];
    button1.backgroundColor = [UIColor clearColor];
    [button1 setBackgroundImage:[UIImage imageNamed:@"abc_btn_radio_to_on_mtrl_000"] forState:UIControlStateNormal];
    [self.view addSubview:button1];
    [self.view bringSubviewToFront:button1];
    UILabel *label = [Factory createLabelWithTitle:@"电台" frame:CGRectMake(ScreenWidth-50, 76, 30, 30)];
    //[self.navigationController.navigationBar addSubview:label];
    [self.view addSubview:label];
    [self.view bringSubviewToFront:label];
    
    if (PNCisIPHONEX) {
        button1.frame = CGRectMake(ScreenWidth-80, 96, 30, 30);
        label.frame = CGRectMake(ScreenWidth-50, 96, 30, 30);

    }

}
- (void)viewWillAppear:(BOOL)animated{
    self.oneButton = [Factory createButtonWithTitle:@"" frame:CGRectMake(ScreenWidth-78, 32, 26, 26) target:self action:@selector(PushOne)];
    //   [self.navigationController.navigationBar addSubview:button1];
    self.oneButton.backgroundColor = [UIColor clearColor];
    [self.oneButton setBackgroundImage:[UIImage imageNamed:@"avator_profile.png"] forState:UIControlStateNormal];
//    [self.view addSubview:self.oneButton];
//    [self.view bringSubviewToFront:self.oneButton];
    self.oneLabel = [Factory createLabelWithTitle:@"One" frame:CGRectMake(ScreenWidth-50, 32, 30, 30)];
    self.oneLabel.textColor = [UIColor whiteColor];
    
    //[self.navigationController.navigationBar addSubview:label];
//    [self.view addSubview:self.oneLabel];
//    [self.view bringSubviewToFront:self.oneLabel];
    UIWindow *win = [UIApplication sharedApplication].keyWindow;
    [win addSubview:_oneButton];
    [win addSubview:_oneLabel];
//    [self initData];
    
    if (PNCisIPHONEX) {
        _oneButton.frame = CGRectMake(ScreenWidth-78, 52, 26, 26);
        _oneLabel.frame = CGRectMake(ScreenWidth-50, 52, 32, 30);
        
    }
}
-(void)viewWillDisappear:(BOOL)animated{
    [self.oneLabel removeFromSuperview];
    [self.oneButton removeFromSuperview];
}
- (void)PushOne
{
    OneDetailViewController *onv =[[ OneDetailViewController alloc]init];
    [self.navigationController pushViewController:onv animated:YES];
}


-(void)PushYinYue
{
    
    _DHSViewController *dvc = [[_DHSViewController alloc]init];
    [self.navigationController pushViewController:dvc animated:YES];
}

- (void)buttonDidClicked
{
    SuiJiViewController *svc =[[SuiJiViewController alloc]init];
    [self.navigationController pushViewController:svc animated:YES];



}


- (void)initData{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    
    [dateFormatter setDateFormat:@"yyyyMMdd"];
    
    NSDate *date = [NSDate date];
    
    NSString *dateString = [dateFormatter stringFromDate:date];
  
    NSLog(@"%@",dateString);
    //拼接网址
    NSString *url = [NSString stringWithFormat:MRURL,dateString];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    __weak typeof (self)weakSelf = self;
 
    
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
       weakSelf.dict = [[NSMutableDictionary alloc]init];

        
       weakSelf.dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"接收成功 =%@" ,weakSelf.dict);
        if ([weakSelf.dict[@"status"] intValue] == -1) {
            UILabel *label = [Factory createLabelWithTitle:@"今日文章还未更新......" frame:CGRectMake(20, 20, ScreenWidth/2, ScreenHeight/2)];
            label.textAlignment = NSTextAlignmentCenter;
            [self.view addSubview:label];
            
            label.center = self.view.center;
            label.font = [UIFont fontWithName:@"Wyue-GutiFangsong-NC" size:20];
            
        }
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //NSLog(@"接受失败");
    }];
}


- (void)createView{
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerNib:[UINib nibWithNibName:@"MeiRiTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    self.tableView.estimatedRowHeight = 10000.f;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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
    
      NSLog(@"%@",self.dict[@"content"]);
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleDefault];

    
    
    
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    
    cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backgroundDeng.png"]];
    
    cell.title.text = self.dict[@"title"];
    cell.title.font = [UIFont fontWithName:@"Wyue-GutiFangsong-NC" size:20];

    
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineSpacing = 5;
    
    NSDictionary *attributes = @{ NSFontAttributeName:[UIFont fontWithName:@"Wyue-GutiFangsong-NC" size:15], NSParagraphStyleAttributeName:paragraphStyle};
    cell.Content.attributedText = [[NSAttributedString alloc]initWithString:cell.Content.text attributes:attributes];
    
    
    
    if ([self.dict[@"status"] intValue] == -1) {
        cell.lineLabel.hidden = YES;
    }
    
    
    return  cell;

}





@end
