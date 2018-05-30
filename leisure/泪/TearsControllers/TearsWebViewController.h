//
//  TearsWebViewController.h
//  leisure
//
//  Created by qianfeng0 on 16/3/2.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "BaseViewController.h"
#import "TearsItemModel.h"
#import "CollectionViewController.h"

@protocol TearsWebViewDelegate <NSObject>

- (void)collectionStatusChanged;

@end


@interface TearsWebViewController : BaseViewController
@property(nonatomic,assign)id<TearsWebViewDelegate>delegate;

- (instancetype)initWithData:(TearsItemModel *)model;


- (instancetype)initWithURL:(NSString *)originUrl;

@end
