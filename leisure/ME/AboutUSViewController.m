//
//  AboutUSViewController.m
//  NewRevenue
//
//  Created by 北城 on 16/9/2.
//  Copyright © 2016年 com.beicheng. All rights reserved.
//

#import "AboutUSViewController.h"
#import "Factory.h"
#import "UIImage+ImageEffects.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height


#define DEF_UICOLORFROMRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define DEF_COLOR_RGB(r,g,b)         [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0f]
@interface AboutUSViewController ()

@end

@implementation AboutUSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 44)];
    image.image = [UIImage imageNamed:@"titlebar_shadow"];
    [self.view addSubview:image];
    if (PNCisIPHONEX) {
        image.frame = CGRectMake(0, 84, ScreenWidth, 44);
    }
}

- (void)createUI{
    
    UIImageView * backimage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [self.view addSubview:backimage];
    backimage.image = [[UIImage imageNamed:@"QQ20180305-0.jpg"] applyBlurWithRadius:5 tintColor:nil saturationDeltaFactor:0.5 maskImage:nil];
    
    UIButton * backBtn = [Factory createButtonWithTitle:@"" frame:CGRectMake(20, 30, 20, 20) backgroundColor:[UIColor clearColor] backgroundImage:[UIImage imageNamed:@""] target:self action:@selector(backAction)];
    
    [backBtn setImage:[UIImage imageNamed:@"返回黑"] forState:UIControlStateNormal];
    [self.view addSubview:backBtn];
    
    UILabel * label = [Factory createLabelWithTitle:@"关于" frame:CGRectMake(80, 20, 60, 40) fontSize:16.f];
    label.font = [UIFont fontWithName:@"Heiti SC" size:20.f];

    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor blackColor];
    [self.view addSubview:label];
    
    
    UIView *label111 = [[UIView alloc]initWithFrame:CGRectMake((ScreenWidth-80)/2, 120, 80, 80)];
    label111.backgroundColor = [UIColor whiteColor];
    label111.layer.cornerRadius=12;
    label111.layer.shadowColor=[UIColor grayColor].CGColor;
    label111.layer.shadowOffset=CGSizeMake(1, 1);
    label111.layer.shadowOpacity=0.8;
    label111.layer.shadowRadius=1.2;
    [self.view addSubview:label111];
    
    
    UIImageView *  iconImage = [[UIImageView alloc]init];
    iconImage.frame = CGRectMake(0, 0, 80, 80);
    iconImage.layer.cornerRadius = 12.f;
    iconImage.layer.masksToBounds = YES;
    iconImage.image = [UIImage imageNamed:@"iconcheng.png"];
    [label111 addSubview:iconImage];
    
    
    UILabel * label1 = [Factory createLabelWithTitle:[NSString stringWithFormat:@"Version：v%@",[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]]
 frame:CGRectMake((ScreenWidth-120)/2, 210, 120, 40) fontSize:16.f];
   
    label1.font = [UIFont fontWithName:@"Heiti SC" size:15.f];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.backgroundColor = [UIColor clearColor];
    label1.textColor = [UIColor blackColor];
    [self.view addSubview:label1];
    
    
    UIButton * backBtn1 = [Factory createButtonWithTitle:@"在微博关注我" frame:CGRectMake(44, ScreenHeight-120, ScreenWidth-88, 40) backgroundColor:[UIColor clearColor] backgroundImage:[UIImage imageNamed:@""] target:self action:@selector(weboAction)];
    backBtn1.layer.cornerRadius = 6;
    backBtn1.layer.shadowColor = DEF_COLOR_RGB(245, 0, 44).CGColor;
        backBtn1.layer.shadowOffset = CGSizeMake(1, 1);
    backBtn1.layer.shadowRadius = 1.f;
    backBtn1.layer.shadowOpacity= 0.5;
    backBtn1.alpha = 0.8;
    backBtn1.backgroundColor = DEF_COLOR_RGB(33,33,33);
    [backBtn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    
    
    [self.view addSubview:backBtn1];
    UIButton * backBtn2 = [Factory createButtonWithTitle:@"在微信关注我" frame:CGRectMake(44, ScreenHeight-175, ScreenWidth-88, 40) backgroundColor:[UIColor clearColor] backgroundImage:[UIImage imageNamed:@""] target:self action:@selector(weChatAction)];
    backBtn2.layer.cornerRadius = 6;
    backBtn2.layer.shadowColor = DEF_COLOR_RGB(245, 0, 44).CGColor;
    backBtn2.layer.shadowOffset = CGSizeMake(1, 1);
    backBtn2.layer.shadowRadius = 1.f;
    backBtn2.layer.shadowOpacity= 0.5;
    backBtn2.alpha = 0.8;
    backBtn2.backgroundColor = DEF_COLOR_RGB(33,33,33);
    [backBtn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    backBtn2.titleLabel.font =[UIFont fontWithName:@"Heiti SC" size:15.f];
    backBtn1.titleLabel.font =[UIFont fontWithName:@"Heiti SC" size:15.f];

    [self.view addSubview:backBtn2];
    
    
    
    UILabel * label2 = [Factory createLabelWithTitle:@"Created by NorthCityTime in Shanghai.XinZhuang" frame:CGRectMake(44, ScreenHeight-70, ScreenWidth-88, 40) fontSize:11.f];
    
    label2.font = [UIFont fontWithName:@"Heiti SC" size:13.f];
    label2.textAlignment = NSTextAlignmentCenter;
    label2.backgroundColor = [UIColor clearColor];
    label2.textColor = [UIColor blackColor];
    [self.view addSubview:label2];
    
    
    UIImageView * icon1 = [[UIImageView alloc]initWithFrame:CGRectMake(115, ScreenHeight-169, 27, 27)];
    icon1.image = [UIImage imageNamed:@"微信"];
    [self.view addSubview:icon1];
    UIImageView * icon2 = [[UIImageView alloc]initWithFrame:CGRectMake(115, ScreenHeight-114, 27, 27)];
    icon2.image = [UIImage imageNamed:@"微博"];
    [self.view addSubview:icon2];
    

}

- (void)weChatAction{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"微信公众号<北城以北小Cat>已复制，打开微信粘贴，即可关注微信号，打开微信>通讯录>添加>查找公众号>粘贴 "delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];

    pasteboard.string = @"北城以北小Cat";
    [alertView show];
}


- (void)weboAction{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://weibo.com/u/5227295178?refer_flag=1001030102_&is_hot=1"]];

}

- (void)backAction{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
