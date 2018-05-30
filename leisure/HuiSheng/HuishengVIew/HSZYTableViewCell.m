//
//  HSZYTableViewCell.m
//  leisure
//
//  Created by qianfeng0 on 16/2/28.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "HSZYTableViewCell.h"


@implementation HSZYTableViewCell


- (void)setCellContent:(LXSMModel *)model{
    self.title.text = model.title;
    self.Concent.text =model.intro;
    self.Count.text = [NSString stringWithFormat:@"%@人正在收听",model.count_play];

    [self.image sd_setImageWithURL:[NSURL URLWithString:model.cover_url]];

    self.image.layer.cornerRadius = 10.f;
    self.image.layer.masksToBounds = YES;

}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
