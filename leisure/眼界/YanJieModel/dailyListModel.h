//
//  dailyListModel.h
//  leisure
//
//  Created by qianfeng0 on 16/2/24.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "JSONModel.h"
#import "YanJieModel.h"

@interface dailyListModel : JSONModel
@property(nonatomic,strong)NSArray<videoListModel>*videoList;
@end
