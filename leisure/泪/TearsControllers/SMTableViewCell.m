//
//  SMTableViewCell.m
//  leisure
//
//  Created by qianfeng0 on 16/3/2.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "SMTableViewCell.h"

@implementation SMTableViewCell

- (void)setCellContent:(TearsItemModel *)model
{
    self.sitePic.layer.cornerRadius = 10.f;
    self.sitePic.layer.masksToBounds = YES;
    [self.sitePic sd_setImageWithURL:[NSURL URLWithString:model.site_infoPic] placeholderImage:[UIImage imageNamed:@"abc_btn_switch_to_on_mtrl_00001.9.png"]];
    self.sitename.text = model.site_infoName;
    self.title.text = model.title;
    self.content.text = [NSString stringWithFormat:@"     %@",model.brief];
    [self.pic1 sd_setImageWithURL:[NSURL URLWithString:model.prepic1]];
    [self.pic2 sd_setImageWithURL:[NSURL URLWithString:model.prepic2]];
    [self.pic3 sd_setImageWithURL:[NSURL URLWithString:model.prepic3]];
    
    
    
    self.pic1.contentMode = UIViewContentModeScaleAspectFill;
    self.pic1.layer.masksToBounds = YES;
  
    self.pic2.contentMode = UIViewContentModeScaleAspectFill;
    self.pic2.layer.masksToBounds = YES;
    
    self.pic3.contentMode = UIViewContentModeScaleAspectFill;
    self.pic3.layer.masksToBounds = YES;
    

    

    
    
    
    NSString *str=model.pub_date;//时间戳
    
    NSTimeInterval time=[str doubleValue];//因为时差问题要加8小时 == 28800 sec
    
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:time];
    
    //NSLog(@"date:%@",[detaildate description]);
    
    //实例化一个NSDateFormatter对象
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    //设定时间格式,这里可以设置成自己需要的格式
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    
    
    NSString *currentDateStr = [dateFormatter stringFromDate: detaildate];

    self.creattime.text = [NSString stringWithFormat:@"|   %@",currentDateStr];
    
#pragma mark --------------------行间距-------------------------
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineSpacing = 14;
    
    NSDictionary *attributes = @{ NSFontAttributeName:[UIFont systemFontOfSize:14], NSParagraphStyleAttributeName:paragraphStyle};
    self.content.attributedText = [[NSAttributedString alloc]initWithString:self.content.text attributes:attributes];
    
   
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
