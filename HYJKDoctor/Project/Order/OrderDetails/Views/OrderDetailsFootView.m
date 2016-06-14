//
//  OrderDetailsFootView.m
//  HYJKDoctor
//
//  Created by shown on 16/6/14.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import "OrderDetailsFootView.h"

@implementation OrderDetailsFootView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, QZMAKEOF6(30), self.width, QZMAKEOF6(40));
        btn.backgroundColor = CustomThemeColor;
        [btn setTitle:@"设置闹钟" forState:UIControlStateNormal];
        [btn setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
        btn.titleLabel.font = fontWithSize(QZMAKEOF6(15));
        [self addSubview:btn];
    }
    return self;
}

@end
