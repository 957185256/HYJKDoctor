//
//  OrderDetailsHeadView.h
//  HYJKDoctor
//
//  Created by shown on 16/6/14.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import <UIKit/UIKit.h>
@class OrderDetailsModel;

@interface OrderDetailsHeadView : UIView

@property (nonatomic, strong) UILabel *lab_OrderID; // 订单号

@property (nonatomic, strong) UILabel *lab_OrderState;  //订单状态

@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UILabel *lab_Describe;    //描述

@property (nonatomic, strong) UILabel *lab_OrderTime;   //订单时间

- (void)initDataWith:(OrderDetailsModel *)model;

@end
