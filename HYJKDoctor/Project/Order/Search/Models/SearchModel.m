//
//  SearchModel.m
//  HYJKDoctor
//
//  Created by 刘朝涛 on 16/6/5.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import "SearchModel.h"
#import "SearchOrderModel.h"

@implementation SearchModel

+ (void)getOrderList:(NSDictionary *)params Succeed:(void (^)(id))succeed Fail:(void (^)(id))fail
{
    [SSBaseRequest requestPostWithParameters:params requestUrl:@"/doctor/order_list" success:^(NSDictionary *reponseDict) {
        NSMutableArray *arr = [NSMutableArray array];
        
        NSArray *tempArr = reponseDict[@"data"];
        
        for (NSDictionary *dataDict in tempArr)
        {
            SearchOrderModel *model = [[SearchOrderModel alloc] init];
            model.order_id = [NSString stringWithFormat:@"%@",dataDict[@"order_id"]];
            
            NSString *timeStr = [NSString stringWithFormat:@"%@",dataDict[@"order_time"]];
            NSRange range = [timeStr rangeOfString:@" "];
            model.order_time = [timeStr substringToIndex:range.location];
            model.consignee = [NSString stringWithFormat:@"%@",dataDict[@"patient_info"][@"consignee"]];
            [arr addObject:model];
        }
        
        succeed(arr);
    } failure:^(NSString *errorMsg) {
        fail(errorMsg);
    }];
}

@end
