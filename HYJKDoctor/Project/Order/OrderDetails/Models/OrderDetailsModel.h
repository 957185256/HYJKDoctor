//
//  OrderDetailsModel.h
//  HYJKDoctor
//
//  Created by shown on 16/6/14.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderDetailsModel : NSObject

@property (nonatomic, copy) NSString *order_sn; //订单编号

@property (nonatomic, copy) NSString *order_status_name;    //订单状态名称

@property (nonatomic, copy) NSString *order_status; //订单状态

@property (nonatomic, copy) NSString *disease_desc; //病情描述

@property (nonatomic, copy) NSString *disease_history; //历史病情描述

@property (nonatomic, copy) NSString *yuyue_time;   //预约时间

@property (nonatomic, copy) NSString *consignee;    //姓名

@property (nonatomic, copy) NSString *tel;  //手机号

@property (nonatomic, copy) NSString *age;  //年龄

@property (nonatomic, copy) NSString *weight;   //体重

@property (nonatomic, copy) NSString *height;   //身高

@property (nonatomic, copy) NSString *blood_type;   //血型

@property (nonatomic, copy) NSString *rhblood_type;   //rh血型

@property (nonatomic, copy) NSString *bmi;  //BMI

+ (void)postOrderDetail:(id)params Succeed:(void(^)(id obj))scueed Failed:(void(^)(id error))failed;

@end
