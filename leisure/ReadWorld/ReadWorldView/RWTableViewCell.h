//
//  RWTableViewCell.h
//  leisure
//
//  Created by qianfeng0 on 16/2/27.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RWTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *Image;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *Content;

@end
