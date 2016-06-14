//
//  StatusSetFootView.m
//  HYJKDoctor
//
//  Created by shown on 16/6/14.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import "StatusSetFootView.h"

@implementation StatusSetFootView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, 1)];
        line.backgroundColor = RGB(244, 244, 245, 1);
        [self addSubview:line];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, QZMAKEOF6(20), self.width, QZMAKEOF6(45));
        [btn setTitle:@"保存" forState:UIControlStateNormal];
        btn.backgroundColor = CustomThemeColor;
        btn.titleLabel.font = fontWithSize(QZMAKEOF6(15));
        [btn setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
    return self;
}

/**
 *  保存
 */
- (void)btnAction
{
    
}

@end
