//
//  CacheManager.h
//  LimitFree
//
//  Created by wanghailong on 16/2/18.
//  Copyright © 2016年 HailongExcellency. All rights reserved.
//

/*
 缓存策略
 缓存，一般通过缓存，我们提前缓存一定的数据内容，一方面避免网络不通时，导致内容无法浏览的尴尬，一方面节省用户的流量。
 有些情况不适合使用缓存。
 即时更新数据：例如，订单列表，消费记录等。
 
 缓存策略有两个点要注意
 时效性：时效性决定，如果用户的最新的缓存数据如果没有超过时效，我们可以认为，用户不需要获取新的变化。通过读取缓存，来帮助用户节省流量。
 缓存大小：一般应用对于用户来说，缓存内容越小越好。但是对于开发者来说，我们从来都是上不封顶。
 
 一般公司面试经常会问：你们之前开发采用的是什么框架？你有没有封装过什么使用框架？
 缓存策略，网络请求策略，数据存储。
 */
#import <Foundation/Foundation.h>

@interface CacheManager : NSObject

/*
 缓存将数据以二进制的形式存入文件，第一，拿到文件也看不出是什么东西，第二，方便每个视图控制器以相同的处理方式，处理网络请求管理器抛上来的数据。
 
 缓存管理一般也使用单例作为最好的呈现，整个程序只被一个管理器管理，逻辑统一。
 */
//根据URL获取数据
+ (id)getDataFromCache:(NSString *)url;
//根据URL和数据写入缓存
+ (BOOL)writeDataToCache:(id)responseObject withUrl:(NSString *)url;

//文件操作需要一个fileManager
@property (nonatomic, strong) NSFileManager *manager;

@end








