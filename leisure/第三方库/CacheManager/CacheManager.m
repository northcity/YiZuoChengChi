//
//  CacheManager.m
//  LimitFree
//
//  Created by wanghailong on 16/2/18.
//  Copyright © 2016年 HailongExcellency. All rights reserved.
//

#import "CacheManager.h"
#import "NSString+Hashing.h"

static CacheManager *cache = nil;

@implementation CacheManager

//根据URL获取数据
+ (id)getDataFromCache:(NSString *)url {
    if (!cache) {
        cache = [CacheManager manager];
    }
    //获取路径
    NSString *filePath = [cache getFullPathByURL:url];
    //返回二进制
    return [NSData dataWithContentsOfFile:filePath];
}

//根据URL和数据写入缓存
+ (BOOL)writeDataToCache:(id)responseObject withUrl:(NSString *)url {
    if (!cache) {
        cache = [CacheManager manager];
    }
    //获取文件路径(根据Hash后的URL作为文件名称)
    NSString *fullPath = [cache getFullPathByURL:url];
    //把数据写入文件
    return [cache writeData:responseObject toFile:fullPath];
}

+ (CacheManager *)manager {
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        if (!cache) {
            cache = [[self alloc] init];
        }
    });
    return cache;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.manager = [NSFileManager defaultManager];
    }
    return self;
}

/*
 如果产品需求为根据功能或者分类进行缓存，需要定制缓存目录，清除某类缓存，可以直接删除对应的目录及文件即可。
 否则可以将所有缓存统一存放。这样，当缓存清除时，将对应的路径下的文件全部删除即可。
 */
- (NSString *)getFullPathByURL:(NSString *)url {
    //为URL加密，保证唯一，避免非法字符。
    NSString *fileName = [url MD5Hash];
    //获取主文件路径(取得Cache目录)
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    //建立自己的目录
    path = [path stringByAppendingString:@"/ResponseCache"];
    BOOL isDirectory = YES;
    //如果目录不存在，就创建
    if (![self.manager fileExistsAtPath:path isDirectory: &isDirectory]) {
        NSError *error = nil;
        //创建我们的目录
        [self.manager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
    }
    //返回完整路径
    return [path stringByAppendingFormat:@"/%@", fileName];
}

//写入操作
- (BOOL)writeData:(id)responseObject toFile:(NSString *)filePath {
    //如果文件不存在，如果存在，但是超时，也写入。
    if ([self checkCacheIsTimeout:filePath] || ![self.manager fileExistsAtPath:filePath]) {
        //创建一个文件，文件地址为filePath，内容为responseObject
        return [self.manager createFileAtPath:filePath contents:responseObject attributes:nil];
    }
    return NO;
}

//判断缓存是否超时
- (BOOL)checkCacheIsTimeout:(NSString *)filePath {
    NSError *error = nil;
    //获取文件的信息
    NSDictionary *dict = [self.manager attributesOfItemAtPath:filePath error:&error];
    //当前文件最新的修改时间
    NSDate *modificationDate = dict[NSFileModificationDate];
    //取得时间差(最新修改时间至当前时间的时间差)
    NSTimeInterval time = [modificationDate timeIntervalSinceNow];
    if (time >= 2 * 60) {
        return YES;
    }
    return NO;
}

@end





