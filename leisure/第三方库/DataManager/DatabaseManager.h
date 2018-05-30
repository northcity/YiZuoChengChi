//
//  DatabaseManager.h
//  FMDBDemo
//
//  Created by wanghailong on 16/1/25.
//  Copyright © 2016年 HailongExcellency. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TearsItemModel.h"
#import "FMDB.h"

@interface DatabaseManager : NSObject

//FMDatabase用来作为管理数据库的核心
@property (nonatomic, strong) FMDatabase *database;

//做成单例
+ (id)shareSingleton;

//增加数据
- (void)insertData:(TearsItemModel *)data;
//删除数据
- (void)deleteData:(TearsItemModel *)data;
//查找数据
- (NSArray *)searchData:(TearsItemModel *)data;
//更新数据
- (void)updateData:(TearsItemModel *)data;
//插入多条数据
- (void)insertManyData:(NSArray *)datas;

- (BOOL)checkDataDidCollection:(TearsItemModel *)data;

@end











