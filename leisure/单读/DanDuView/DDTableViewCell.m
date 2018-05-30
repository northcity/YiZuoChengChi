//
//  DDTableViewCell.m
//  leisure
//
//  Created by qianfeng0 on 16/2/25.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "DDTableViewCell.h"
#import "UIImageView+WebCache.h"


@implementation DDTableViewCell


- (void)setCellContent:(DDDatasModel *)model
{
    [self.image sd_setImageWithURL:[NSURL URLWithString:model.thumbnail]];
    self.image.contentMode = UIViewContentModeScaleAspectFill;
    self.imageHeiht.constant = kAUTOHEIGHT(250);
//        _effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
//    
//    _effectView = [[UIVisualEffectView alloc] initWithEffect:_effect];
//    
//    _effectView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 680);
//    
//    _effectView.alpha = 0.8;
//    
//    [self.image addSubview:_effectView];
   
    self.distance.constant  = kAUTOHEIGHT(35);
    
    self.title.text = model.title;
    self.content.text = model.excerpt;
    self.Catory.text = model.author;
   
    
#pragma mark --------------------行间距-------------------------
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineSpacing = 14;
    
    NSDictionary *attributes = @{ NSFontAttributeName:[UIFont systemFontOfSize:14], NSParagraphStyleAttributeName:paragraphStyle};
    self.content.attributedText = [[NSAttributedString alloc]initWithString:self.content.text attributes:attributes];
    
    
    self.pingLun.text = model.comment;
    self.like.text = model.good;
    self.readCount.text = [NSString stringWithFormat:@"阅读量 : %@",model.view];
    //[self AddSwipeGesture];
}

- (void)AddSwipeGesture
{
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeGestureAction:)];
    swipe.direction = UISwipeGestureRecognizerDirectionRight|UISwipeGestureRecognizerDirectionLeft;
    
    [self addGestureRecognizer:swipe];
}

-(void)swipeGestureAction:(UISwipeGestureRecognizer *)gesture
{
    [self transformer];
}

- (void)transformer {
  //  __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:5.f animations:^{

        [self.effectView removeFromSuperview];
        
    } completion:^(BOOL finished) {
        
    }];
}







- (void)awakeFromNib {


}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
