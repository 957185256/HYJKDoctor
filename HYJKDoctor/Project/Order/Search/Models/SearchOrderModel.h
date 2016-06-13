//
//  SearchOrderModel.h
//  HYJKDoctor
//
//  Created by shown on 16/6/13.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchOrderModel : NSObject<NSCoding>

@property (nonatomic, copy) NSString *order_id;     // 订单id

@property (nonatomic, copy) NSString *order_time;   // 订单生成时间

@property (nonatomic, copy) NSString *consignee;    // 患者姓名

@end
