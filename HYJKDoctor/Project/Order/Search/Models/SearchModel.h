//
//  SearchModel.h
//  HYJKDoctor
//
//  Created by 刘朝涛 on 16/6/5.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchOrderModel.h"

@interface SearchModel : NSObject

+ (void)getOrderList:(NSDictionary *)params Succeed:(void (^)(id obj))succeed Fail:(void (^)(id error))fail;

@end
