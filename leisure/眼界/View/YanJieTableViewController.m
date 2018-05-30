//
//  YanJieTableViewController.m
//  leisure
//
//  Created by qianfeng0 on 16/2/24.
//  Copyright © 2016年 陈希. All rights reserved.
//
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>



#import "YanJieTableViewController.h"
#import "YanJieModel.h"
#import "YanJieTableViewCell.h"
#import "YanJieContentScrollView.h"
#import "YanjieContentVIew.h"
#import "ZuiNiuBiDeView.h"
#import "YanJieCustomView.h"
#import "YanJieImageContentView.h"

#import "HelperDefine.h"
#import "UIView+Addition.h"
#import "JSONModel.h"

#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"
#import "JHRefresh.h"

#define URLL @"http://baobab.wandoujia.com/api/v1/feed"

#import "dailyListModel.h"



#import "PlayViewController.h"
//#import "YanJieHederView.h"
#import "YanJieFooterView.h"

@interface SDWebImageManager (cache)
- (BOOL)memoryCachedImageExistsForURL:(NSURL *)url;

@end

@implementation SDWebImageManager(cache)


- (BOOL)memoryCachedImageExistsForURL:(NSURL *)url {
    NSString *key = [self cacheKeyForURL:url];
    return ([self.imageCache imageFromMemoryCacheForKey:key] != nil) ?  YES : NO;
}


@end



@interface YanJieTableViewController ()
@property (nonatomic, retain) NSMutableDictionary *selectDic;

@property(nonatomic,strong)JSONModelArray *dataArray;
@property(nonatomic,strong)NSMutableArray*dataBBBBBBBBBBBBBBBBBBB;
//@property(nonatomic,)
@property(nonatomic,strong)NSDate *RefrshDate;
@property(nonatomic,copy)NSString *TodayDate;

@property(nonatomic,assign)NSInteger datEEEEEEEEEEEEEE;
@property(nonatomic,strong)AVPlayerViewController *av;


@end

@implementation YanJieTableViewController


























- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
     [self creatView];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma ----------数据处理----------------
- (void)initData
{
    self.RefrshDate = [[NSDate alloc]init];
    self.selectDic = [[NSMutableDictionary alloc]init];
    self.dataBBBBBBBBBBBBBBBBBBB = [[NSMutableArray alloc]init];
    
    [self getNetData];
    
}
#pragma mark----------------------创建视图------------------------------
- (void) creatView{
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.tableView registerClass:[YanJieTableViewCell class] forCellReuseIdentifier:@"haha"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
  
    //self.tableView.pagingEnabled = YES;
    //注册头视图
    [self.tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"header"];
    //注册尾视图
//    [self.tableView registerClass:[YanJieFooterView class] forHeaderFooterViewReuseIdentifier:@"footer"];
    
    [self addRefreshView];
}

- (void)addRefreshView
{
    __weak typeof(self)weakSelf = self;
    [self.tableView addRefreshHeaderViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        weakSelf.datEEEEEEEEEEEEEE = [[weakSelf GetTodayTime] integerValue];
        [weakSelf getNetData];
    }];
    [self.tableView addRefreshFooterViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        weakSelf.datEEEEEEEEEEEEEE--;
        [weakSelf getNetData];
    }];


}

#pragma mark ----------数据解析--------------

- (void)getNetData
{
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    
        [dateFormatter setDateFormat:@"yyyyMMdd"];
    
    //    NSDate *date = [NSDate date];
    
    //    NSString *dateString = [dateFormatter stringFromDate:date];
    
        //拼接网址
        //NSString *url = [NSString stringWithFormat:kEveryDay,self.datEEEEEEEEEEEEEE];
   //     //NSLog(@"%@",url);
    //++++++++++++++++++++++++++++++++++++++++++++++++
   // NSString *date = [self GetTodayTime];
    //++++++++++++++++++++++++++++++++++++++++++
    UIWindow *win = [UIApplication sharedApplication].keyWindow;
    [MBProgressHUD showHUDAddedTo:win animated:YES];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [MBProgressHUD hideAllHUDsForView:win animated:YES];
    __weak typeof (self)weakSelf = self;
    
    weakSelf.datEEEEEEEEEEEEEE = [[weakSelf GetTodayTime] integerValue];
    [manager GET:URLL parameters:@{@"num":@"100",@"date":@(self.datEEEEEEEEEEEEEE),@"vc":@"125",@"u":@"39912febcd7affda38b6e528e76697152729ac02",@"v":@"1.8.1",@"f":@"iphone"} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        ////NSLog(@"接收成功");
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
       // //NSLog(@"%@",dict);
        
        weakSelf.TodayDate = [self GetTodayTime];
        
//    ==========================
        if (weakSelf.datEEEEEEEEEEEEEE == [weakSelf.TodayDate integerValue]) {
            [weakSelf.dataBBBBBBBBBBBBBBBBBBB removeAllObjects];
        }

        
        
        NSArray *array = dict[@"dailyList"];
        for (NSDictionary *dic in array) {
            NSMutableArray*selectArray = [[NSMutableArray alloc]init];
            NSArray *ary = dic[@"videoList"];
            for (NSDictionary *dic1 in ary) {
                YanJieModel *model = [[YanJieModel alloc]init];
                [model setValuesForKeysWithDictionary:dic1];
                model.collectionCount = dic1[@"consumption"][@"collectionCount"];
                model.replyCount = dic1[@"consumption"][@"replyCount"];
                model.shareCount = dic1[@"consumption"][@"shareCount"];
                
                [selectArray addObject:model];
            }
            
            NSString *date = [[dic[@"date"] stringValue] substringToIndex:10];
            [self.selectDic setValue: selectArray forKey:date];
         
       //     //NSLog(@"我是这个===============%@",date);

        }
        
        NSComparisonResult (^priceBlock)(NSString *, NSString *) = ^(NSString *string1, NSString *string2){
            
            NSInteger number1 = [string1 integerValue];
            NSInteger number2 = [string2 integerValue];
            
            if (number1 > number2) {
                return NSOrderedAscending;
            }else if(number1 < number2){
                return NSOrderedDescending;
            }else{
                return NSOrderedSame;
            }
            
        };
        
        self.dataBBBBBBBBBBBBBBBBBBB = [[[self.selectDic allKeys] sortedArrayUsingComparator:priceBlock]mutableCopy];
        
 
        [weakSelf.tableView footerEndRefreshing];
        [weakSelf.tableView headerEndRefreshingWithResult:JHRefreshResultSuccess];
        
        [weakSelf.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    //    //NSLog(@"接受失败");
    }];
    
}
- (NSString*)GetTodayTime
{
    // df.dateFormat = @"yyyy/MM/dd HH:mm:ss.S EEE";
    NSDateFormatter * df = [[NSDateFormatter alloc] init];
    df.dateFormat = @"yyyyMMdd";
    NSDate * date = [NSDate date];
    NSString * dateDtr = [df stringFromDate:date];
   // //NSLog(@"我是今天的+++++++++++++++++++++++++++++%@", dateDtr);
    return dateDtr;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -------表信息--------------------------

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
   // //NSLog(@"%@",self.dataArray);
    return [self.dataBBBBBBBBBBBBBBBBBBB count];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSMutableArray *array = self.selectDic[_dataBBBBBBBBBBBBBBBBBBB[section]];
    return array.count;
    
//    return [self.selectDic[self.dataBBBBBBBBBBBBBBBBBBB[section]] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YanJieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"haha" forIndexPath:indexPath];
    
    return cell;
}

#pragma ----------------头标题--------------------


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 250;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 30;
}
#pragma --------动画-------------
- (void)tableView:(UITableView *)tableView willDisplayCell:(YanJieTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    YanJieModel *model = self.selectDic[self.dataBBBBBBBBBBBBBBBBBBB[indexPath.section]][indexPath.row];
    
    
   // //NSLog(@"%@",model);
   
    
    if (![[SDWebImageManager sharedManager] memoryCachedImageExistsForURL:[NSURL URLWithString:model.coverForDetail]]) {
        
        CATransform3D rotation;//3D旋转
        
        rotation = CATransform3DMakeTranslation(0 ,50 ,20);
        //        rotation = CATransform3DMakeRotation( M_PI_4 , 0.0, 0.7, 0.4);
        //逆时针旋转
        
        rotation = CATransform3DScale(rotation, 0.9, .9, 1);
        
        rotation.m34 = 1.0/ -600;
        
        cell.layer.shadowColor = [[UIColor blackColor]CGColor];
        cell.layer.shadowOffset = CGSizeMake(10, 10);
        //透明度
        cell.alpha = 0;
        
        cell.layer.transform = rotation;
        
        [UIView beginAnimations:@"rotation" context:NULL];
        //旋转时间
        [UIView setAnimationDuration:0.6];
        cell.layer.transform = CATransform3DIdentity;
        cell.alpha = 1;
        cell.layer.shadowOffset = CGSizeMake(0, 0);
        [UIView commitAnimations];
    }
    [cell cellOffset];
    cell.model = model;
    
}

#pragma mark ---------- 单元格代理方法 ----------

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self showImageAtIndexPath:indexPath];
}

#pragma mark --------- 设置待播放界面 ----------

- (void)showImageAtIndexPath:(NSIndexPath *)indexPath{
    
    _array = self.selectDic[_dataBBBBBBBBBBBBBBBBBBB[indexPath.section]];
   // [_array addObject:model];
  ////NSLog(@"%@",_array);
    _currentIndexPath = indexPath;
    
    YanJieTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    CGRect rect = [cell convertRect:cell.bounds toView:nil];
    CGFloat y = rect.origin.y;
    
    _rilegoule = [[ZuiNiuBiDeView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight) imageArray:_array index:indexPath.row];
    _rilegoule.offsetY = y;
    _rilegoule.animationTrans = cell.picture.transform;
    _rilegoule.animationView.picture.image = cell.picture.image;
    
    _rilegoule.scrollView.delegate = self;
    
    [[self.tableView superview] addSubview:_rilegoule];
#pragma --------------------------清扫手势-----------------------
    
    //添加轻扫手势
   
    UISwipeGestureRecognizer *Swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
    
    _rilegoule.contentView.userInteractionEnabled = YES;
    
    Swipe.direction = UISwipeGestureRecognizerDirectionUp;
    
    [_rilegoule.contentView addGestureRecognizer:Swipe];
#pragma ----------------------点击手势----------------------
    
    //添加点击播放手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
    [_rilegoule.scrollView addGestureRecognizer:tap];
    
    [_rilegoule aminmationShow];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if ([scrollView isEqual:_rilegoule.scrollView]) {
        
        for (YanJieImageContentView *subView in scrollView.subviews) {
            
            if ([subView respondsToSelector:@selector(imageOffset)] ) {
                [subView imageOffset];
            }
        }
        
        CGFloat x = _rilegoule.scrollView.contentOffset.x;
        
        CGFloat off = ABS( ((int)x % (int)kWidth) - kWidth/2) /(kWidth/2) + .2;
        
        [UIView animateWithDuration:1.0 animations:^{
            _rilegoule.playView.alpha = off;
            _rilegoule.contentView.titleLabel.alpha = off + 0.3;
            _rilegoule.contentView.littleLabel.alpha = off + 0.3;
            _rilegoule.contentView.lineView.alpha = off + 0.3;
            _rilegoule.contentView.descripLabel.alpha = off + 0.3;
            _rilegoule.contentView.collectionCustom.alpha = off + 0.3;
            _rilegoule.contentView.shareCustom.alpha = off + 0.3;
            _rilegoule.contentView.cacheCustom.alpha = off + 0.3;
            _rilegoule.contentView.replyCustom.alpha = off + 0.3;
            
        }];
        
    } else {
        
        NSArray<YanJieTableViewCell *> *array = [self.tableView visibleCells];
        
        [array enumerateObjectsUsingBlock:^(YanJieTableViewCell * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            [obj cellOffset];
        }];
        
    }
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    if ([scrollView isEqual:_rilegoule.scrollView]) {
        
        int index = floor((_rilegoule.scrollView.contentOffset.x - scrollView.frame.size.width / 2) / scrollView.frame.size.width) + 1;
        
        _rilegoule.scrollView.currentIndex = index;
        
        self.currentIndexPath = [NSIndexPath indexPathForRow:index inSection:self.currentIndexPath.section];
        
        [self.tableView scrollToRowAtIndexPath:self.currentIndexPath atScrollPosition:(UITableViewScrollPositionMiddle) animated:NO];
        
        [self.tableView setNeedsDisplay];
        YanJieTableViewCell *cell = [self.tableView cellForRowAtIndexPath:self.currentIndexPath];
        
        [cell cellOffset];
        
        CGRect rect = [cell convertRect:cell.bounds toView:nil];
        _rilegoule.animationTrans = cell.picture.transform;
        _rilegoule.offsetY = rect.origin.y;
        
        YanJieModel *model = _array[index];
        
        [_rilegoule.contentView setData:model];
        
        [_rilegoule.animationView.picture sd_setImageWithURL:[NSURL URLWithString: model.coverForDetail] ];
        // [_rilegoule.animationView.picture setImageWithURL:[NSURL URLWithString: model.coverForDetail]];
    }
}

#pragma mark -------------- 平移手势触发事件 -----------

- (void)panAction:(UISwipeGestureRecognizer *)swipe{
    
    [_rilegoule animationDismissUsingCompeteBlock:^{
        
        _rilegoule = nil;
    }];
}

#pragma mark -------------- 点击手势触发事件 -----------
- (void)tapAction
{
    PlayViewController *playVC = [[PlayViewController alloc]init];
    //
    //
    //
    playVC.modelArray = _array;
    //
    playVC.index = _currentIndexPath.row;
    
      [self.navigationController pushViewController:playVC animated:YES];
   // [self presentViewController:playVC animated:YES completion:nil];
}

- (void)tapAction :(NSIndexPath *)indexPath{
    
   
    
    YanJieModel *model = _dataArray[indexPath.row];
    ////NSLog(@"%@",model.playUrl);
    
    
    PlayViewController *playVC = [[PlayViewController alloc]initWithModel:model];
    //
    //
    //
    playVC.modelArray = _array;
    //
    playVC.index = _currentIndexPath.row;
    
    [self.navigationController pushViewController:playVC animated:YES];

    
    
//    self.av = [[AVPlayerViewController alloc]init];
//    self.av.player = [AVPlayer playerWithURL:[NSURL URLWithString:model.playUrl]];
//   
//    [self showMovieView];
//    
    
    //********************我改的***********************
    

}

- (void)showMovieView
{
    [self presentViewController:self.av animated:YES completion:NULL];
    
}


#pragma  mark----------------------------------头视图-----------------------------------------------


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *header = (UIView *)[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];

    if (!self.headerImage) {
        self.headerImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"titlebar_shadow1@.png"]];
        [header addSubview:self.headerImage];

    }
    
    _headerImage.frame = header.bounds;

    NSString *string = self.dataBBBBBBBBBBBBBBBBBBB[section];
    
    long long int date1 = (long long int)[string intValue];
    
    NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:date1];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    
    [dateFormatter setDateFormat:@"MM/dd"];
    
    NSString *dateString = [dateFormatter stringFromDate:date2];

    
    NSString *lableString = [NSString stringWithFormat:@"Day:~~%@~~",dateString];
    
   

    if (!_label) {
        _label = [[UILabel alloc]initWithFrame:CGRectMake(0, 8,ScreenWidth, 20)];
        [header addSubview:_label];
    }
    _label.backgroundColor = [UIColor clearColor];
    _label.text = lableString;
    _label.textAlignment = NSTextAlignmentCenter;
    _label.font = [UIFont italicSystemFontOfSize:15.f];
    _label.font = [UIFont boldSystemFontOfSize:15.f];
    _label.shadowColor = [UIColor whiteColor];
    _label.shadowOffset = CGSizeMake(1, 1);
    _label.font = [UIFont fontWithName:@"Cochin-BoldItalic" size:15.f];
    return header;
}

//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    YanJieFooterView *footer = (YanJieFooterView *)[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"footer"];
//    return footer;
//}

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

@end
