//
//  CollectionViewController.m
//  leisure
//
//  Created by qianfeng0 on 16/3/4.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "CollectionViewController.h"
#import "DatabaseManager.h"
#import "TearsItemModel.h"
#import "TearsViewController.h"
#import "TearsWebViewController.h"
#import "CollectionTableViewCell.h"

@interface CollectionViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataSource;
@property(nonatomic,strong)UIImageView *image;

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"收藏";
}
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = NO;
}
-(void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;

}
- (void)changeTableViewEditingStatus {
    self.tableView.editing = !self.tableView.editing;
}



- (void)initData
{
    self.dataSource = [[NSMutableArray alloc]initWithArray:[[DatabaseManager shareSingleton] searchData:nil]];
    
}

- (void)createView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
  //  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"CollectionTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CollectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    TearsItemModel *model = self.dataSource[indexPath.row];
    cell.textLabel.text = model.title;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TearsItemModel *model = self.dataSource[indexPath.row];
    TearsWebViewController *tvc = [[TearsWebViewController alloc]initWithData:model];
//    tvc.delegate = self;
    [self.navigationController pushViewController:tvc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    TearsItemModel *model = self.dataSource[indexPath.row];
    [self.dataSource removeObjectAtIndex:indexPath.row];
    [[DatabaseManager shareSingleton] deleteData:model];
    
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    //返回删除状态
    return UITableViewCellEditingStyleDelete;
}

@end
