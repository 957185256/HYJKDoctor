//
//  OrderDetailsHeadView.m
//  HYJKDoctor
//
//  Created by shown on 16/6/14.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import "OrderDetailsHeadView.h"
#import "OrderDetailsModel.h"

@implementation OrderDetailsHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = RGB(233, 233, 233, 1);
        [self initView];
    }
    return self;
}

- (void)initView
{
    UILabel *lab_1 = [[UILabel alloc] initWithFrame:CGRectMake(QZMAKEOF6(12), QZMAKEOF6(24), QZMAKEOF6(64), QZMAKEOF6(14))];
    lab_1.text = @"预约单号";
    lab_1.font = fontWithSize(QZMAKEOF6(14));
    [self addSubview:lab_1];
    
    _lab_OrderID = [[UILabel alloc] initWithFrame:CGRectMake(lab_1.right + QZMAKEOF6(12), QZMAKEOF6(24), ScreenWidth - QZMAKEOF6(98), QZMAKEOF6(14))];
    _lab_OrderID.text = @"2150828007917";
    _lab_OrderID.font = fontWithSize(QZMAKEOF6(14));
    [self addSubview:_lab_OrderID];
    
    UILabel *lab_2 = [[UILabel alloc] initWithFrame:CGRectMake(QZMAKEOF6(12), lab_1.bottom + QZMAKEOF6(4), QZMAKEOF6(64), QZMAKEOF6(14))];
    lab_2.text = @"当前状态";
    lab_2.font = fontWithSize(QZMAKEOF6(14));
    [self addSubview:lab_2];
    
    _lab_OrderState = [[UILabel alloc] initWithFrame:CGRectMake(lab_2.right + QZMAKEOF6(12), lab_2.top, _lab_OrderID.width, _lab_OrderID.height)];
    _lab_OrderState.text = @"预约确认中";
    _lab_OrderState.font = fontWithSize(QZMAKEOF6(14));
    _lab_OrderState.textColor = CustomThemeColor;
    [self addSubview:_lab_OrderState];
    
    _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, QZMAKEOF6(80), self.width, QZMAKEOF6(180))];
    _bgView.backgroundColor = WHITE_COLOR;
    [self addSubview:_bgView];
    
    _lab_Describe = [[UILabel alloc] initWithFrame:CGRectMake(QZMAKEOF6(12), QZMAKEOF6(24), _bgView.width - QZMAKEOF6(24), 0)];
    _lab_Describe.numberOfLines = 0;
    _lab_Describe.font = fontWithSize(QZMAKEOF6(14));
    _lab_Describe.textColor = RGB(145, 145, 145, 1);
    [_bgView addSubview:_lab_Describe];
    
    _lab_OrderTime = [[UILabel alloc] initWithFrame:CGRectMake(QZMAKEOF6(12), _bgView.height - QZMAKEOF6(20), _lab_Describe.width, QZMAKEOF6(14))];
    _lab_OrderTime.font = fontWithSize(QZMAKEOF6(14));
    [_bgView addSubview:_lab_OrderTime];
}

- (void)initDataWith:(OrderDetailsModel *)model
{
    _lab_OrderID.text = model.order_sn;
    _lab_OrderState.text = model.order_status_name;
    _lab_Describe.text = model.disease_desc;
    CGSize size = [NSString getTextMultilineContent:_lab_Describe.text withFont:_lab_Describe.font withSize:CGSizeMake(_lab_Describe.width, MAXFLOAT)];
    _lab_Describe.height = size.height;
    _lab_OrderTime.text = model.yuyue_time;
}

@end
