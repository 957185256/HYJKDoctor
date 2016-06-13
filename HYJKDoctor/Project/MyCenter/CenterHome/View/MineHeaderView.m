//
//  MineHeaderView.m
//  JLTShipper 我的界面 的 头部
//
//  Created by sinoservices on 16/4/13.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import "MineHeaderView.h"

@implementation MineHeaderView




- (instancetype)initWithFrame:(CGRect)frame;
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = CustomThemeColor;
        
        
        
        //头像
        UIImageView *headImageView=[[UIImageView alloc] init];
        [self addSubview:headImageView];
        headImageView.frame = CGRectMake(20, QZMAKEOF6(35), frame.size.height/2., frame.size.height/2.);
        headImageView.centerX = self.width/2.;
        headImageView.image = [UIImage imageNamed:@"mine_avatar_default"];
        headImageView.backgroundColor = GRAY_COLOR_BG;
        
        [headImageView qzSetCornerRadius:headImageView.width/2.];
        
     
        
        UILabel *nameLab=[[UILabel alloc] initWithFrame:CGRectMake(0, headImageView.bottom , ScreenWidth, 35)];
        nameLab.centerX = headImageView.centerX;
        nameLab.textAlignment = NSTextAlignmentCenter;
        nameLab.textColor = WHITE_COLOR;
        nameLab.text=@"昵称";
        nameLab.font=fontWithSize(QZMAKEOF6(17));
        [self addSubview:nameLab];

       
    }
    return self;
}

- (void)refreshHeaderView
{
    
}
//- (void)refreshHeaderViewWithWeatherModel:(WeatherReponse *)model
//{
//    self.cityLab.text = model.cityName;
//    self.temperatureLab.text = model.temperature;
//    self.windDirectionLab.text = model.windDirection;
//}


@end
