//
//  TearsItemModel.h
//  leisure
//
//  Created by qianfeng0 on 16/3/2.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "JSONModel.h"

@interface TearsItemModel : JSONModel

@property(nonatomic,copy)NSString *pageID;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *brief;
@property(nonatomic,copy)NSString *origin_url;
@property(nonatomic,copy)NSString *prepic1;
@property(nonatomic,copy)NSString<Optional> *prepic2;
@property(nonatomic,copy)NSString<Optional>*prepic3;
@property(nonatomic,copy)NSString *site_infoName;
@property(nonatomic,copy)NSString *site_infoPic;
@property(nonatomic,copy)NSString *update_time;
@property(nonatomic,copy)NSString *pub_date;


@end
