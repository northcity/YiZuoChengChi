//
//  DatabaseManager.m
//  FMDBDemo
//
//  Created by wanghailong on 16/1/25.
//  Copyright © 2016年 HailongExcellency. All rights reserved.
//

#import "DatabaseManager.h"

static DatabaseManager *manager = nil;

@implementation DatabaseManager

//做成单例
+ (id)shareSingleton {
    //声明一个多线程的token，用来记录执行状态。
    static dispatch_once_t token;
    //调用once方法，使用状态token，用来表示block中的代码，在程序运行过程中，只被调用一次。
    dispatch_once(&token, ^{
        if (!manager) {
            manager = [[self alloc] init];
        }
    });
    return manager;
}

- (id)init {
    self = [super init];
    if (self) {
        //创建数据库
        [self createDatabase];
        //创建表
        [self createTable];
    }
    return self;
}

- (void)createDatabase {
    //数据库存放在Documents目录下
    NSString *path = [NSHomeDirectory() stringByAppendingString:@"/Documents/leisure.db"];
    //NSLog(@"%@", path);
    //在指定的目录下创建数据库
    self.database = [FMDatabase databaseWithPath:path];
    if (_database) {
        //如果数据库不为空
        [_database open];
    } else {
        //NSLog(@"数据库创建失败");
        [_database close];
    }
}

- (void)createTable {
    //创建学生表的sql语句
    NSString *sqlString = @"create table if not exists Collection (pageID text, title text, origin_url text);";
    //用一个Bool值来接收创建表的结果
    /*
     当数据库的内容需要发生改变(创建表，增/删/改数据)时，调用executeUpdate:(可以传入多个参数)，参数对应:
     第一个一般都传sql语句。如果sql语句中包含参数，就用“？”占位，然后将对应的内容，放到后续的参数中。
     */
    BOOL result = [_database executeUpdate:sqlString];
    if (!result) {
        //NSLog(@"新闻收藏表创建失败，数据库即将关闭");
        //关闭数据库
        [_database close];
    }
}

//增加数据
- (void)insertData:(TearsItemModel *)data {
    NSString *sqlString = @"insert into Collection (pageID, title, origin_url) values (?, ?, ?);";
    //executeUpdate变参方法，可传入多个参数。
    /*
     如果有参数我们需要从model或者数据源中传入。就将对应的sql语句中的value值写“？”表示此处的内容，是由外部传入。需要对应顺序。
     */
    BOOL result = [_database executeUpdate:sqlString, data.pageID, data.title,data.origin_url];
    if (!result) {
        //NSLog(@"数据插入失败，数据库即将关闭");
        [_database close];
    }
}

//删除数据
- (void)deleteData:(TearsItemModel *)data {
    NSString *sql = @"delete from Collection where pageID = ?;";
    BOOL result = [_database executeUpdate:sql, data.pageID];
    if (!result) {
        //NSLog(@"删除失败，即将关闭数据库");
        [_database close];
    }
}

//查找数据
- (NSArray *)searchData:(TearsItemModel *)data {
    //sql语句不确定，需要根据是否传入参数来判断用户是查找全部数据，还是部分数据。
    NSString *sqlString = nil;
    if (!data) {
        sqlString = @"select * from Collection;";
    } else {
        sqlString = [NSString stringWithFormat:@"select * from Collection where pageID = %@;", data.pageID];
    }
    NSMutableArray *temp = [[NSMutableArray alloc] initWithCapacity:0];
    //查找的结果集合
    FMResultSet *set = [_database executeQuery:sqlString];
    //如果集合中的next返回为YES，说明超找到的数据还有没有整理的。所以while会一直执行，如果返回NO，while中断，说明没有数据。
    while (set.next) {
        TearsItemModel *model = [[TearsItemModel alloc] init];
        model.pageID = [set stringForColumn:@"pageID"];
        model.title = [set stringForColumn:@"title"];
        model.origin_url = [set stringForColumn:@"origin_url"];
        [temp addObject:model];
    }
    return temp;
}

//更新数据
- (void)updateData:(TearsItemModel *)data {
    NSString *sqlString = @"update Collection set title = ?, origin_url = ? where pageID = ?;";
    BOOL result = [_database executeUpdate:sqlString, data.title, data.origin_url, data.pageID];
    if (!result) {
        //NSLog(@"修改失败，即将关闭数据库");
        [_database close];
    }
}

//插入多条数据
- (void)insertManyData:(NSArray *)datas {
    //让数据库开启事务
    [_database beginTransaction];
    //如果出现异常，就将标志设置为YES
    BOOL isError = NO;
    //捕获异常，正常代码会在try中执行，如果出现异常，catch会有回调。
    @try {
        //将要插入的多条数据一一取出，并且插入数据库
        for (TearsItemModel *model in datas) {
            NSString *sqlString = @"insert into Collection (title, origin_url) values (?, ?);";
            [_database executeUpdate:sqlString, model.title, model.origin_url];
        }
    }
    @catch (NSException *exception) {
        if (exception.reason) {
            //NSLog(@"%@", exception.reason);
        }
        isError = YES;
    }
    @finally {
        if (isError) {
            //回滚
            [_database rollback];
        }
        //提交事务
        [_database commit];
    }
}


- (BOOL)checkDataDidCollection:(TearsItemModel *)data {
    NSArray *objects = [self searchData:data];
    if ([objects count] != 0) {
        return YES;
    } else {
        return NO;
    }
}
@end











