//
//  MineHeaderView.h
//  JLTShipper 我的界面 的 头部
//
//  Created by sinoservices on 16/4/13.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import <UIKit/UIKit.h>

//#import "WeatherReponse.h"
@interface MineHeaderView : UIView

@property (nonatomic, strong)UILabel *cityLab;
@property (nonatomic, strong)UILabel *temperatureLab;
@property (nonatomic, strong)UILabel *windDirectionLab;

- (instancetype)initWithFrame:(CGRect)frame;

- (void)refreshHeaderView;

//- (void)refreshHeaderViewWithWeatherModel:(WeatherReponse *)model;
@end
