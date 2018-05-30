//
//  YanJieModel.h
//  leisure
//
//  Created by qianfeng0 on 16/2/24.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol videoListModel <NSObject>
@end


@interface YanJieModel : NSObject


@property (nonatomic, strong) NSString *category;

@property (nonatomic, strong) NSNumber *collectionCount;

@property (nonatomic, strong) NSNumber *replyCount;

@property (nonatomic, strong) NSNumber *shareCount;

@property (nonatomic, copy) NSString *coverBlurred;

@property (nonatomic, copy) NSString *coverForDetail;


@property (nonatomic, strong) NSString *descrip;

@property (nonatomic, strong) NSString *ID;

@property (nonatomic, strong) NSString *duration;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *playUrl;


@end
