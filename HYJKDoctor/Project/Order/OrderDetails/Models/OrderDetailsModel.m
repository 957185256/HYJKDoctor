//
//  OrderDetailsModel.m
//  HYJKDoctor
//
//  Created by shown on 16/6/14.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import "OrderDetailsModel.h"

@implementation OrderDetailsModel

+ (void)postOrderDetail:(id)params Succeed:(void (^)(id))scueed Failed:(void (^)(id))failed
{
    [SSBaseRequest requestPostWithParameters:params requestUrl:@"/doctor/order_info" success:^(NSDictionary *reponseDict) {
        
        OrderDetailsModel *model = [[OrderDetailsModel alloc] init];
        if ([reponseDict[@"status"][@"succeed"] intValue] == 1)
        {
            model.order_sn = [NSString stringWithFormat:@"%@",reponseDict[@"data"][@"order_sn"]];
            model.order_status_name = [NSString stringWithFormat:@"%@",reponseDict[@"data"][@"order_status_name"]];
            model.order_status = [NSString stringWithFormat:@"%@",reponseDict[@"data"][@"order_status"]];
            
            model.disease_desc = [NSString stringWithFormat:@"病情描述：%@",reponseDict[@"data"][@"order_case_info"][@"user_case"][@"disease_desc"]];
            model.disease_history = [NSString stringWithFormat:@"%@",reponseDict[@"data"][@"order_case_info"][@"user_case"][@"disease_history"]];
            model.yuyue_time = [NSString stringWithFormat:@"%@",reponseDict[@"data"][@"order_case_info"][@"yuyue_time"]];
            
            model.consignee = [NSString stringWithFormat:@"%@",reponseDict[@"data"][@"patient_info"][@"consignee"]];
            model.tel = [NSString stringWithFormat:@"%@",reponseDict[@"data"][@"patient_info"][@"tel"]];
            model.age = [NSString stringWithFormat:@"%@岁",reponseDict[@"data"][@"order_case_info"][@"user_case"][@"age"]];
            model.bmi = [NSString stringWithFormat:@"%@",reponseDict[@"data"][@"order_case_info"][@"user_case"][@"bmi"]];
            model.blood_type = [NSString stringWithFormat:@"%@",reponseDict[@"data"][@"order_case_info"][@"user_case"][@"blood_type"]];
            model.height = [NSString stringWithFormat:@"%@cm",reponseDict[@"data"][@"order_case_info"][@"user_case"][@"height"]];
            model.weight = [NSString stringWithFormat:@"%@kg",reponseDict[@"data"][@"order_case_info"][@"user_case"][@"weight"]];
            model.rhblood_type = [NSString stringWithFormat:@"%@",reponseDict[@"data"][@"order_case_info"][@"user_case"][@"rhblood_type"]];
            
        }
        scueed(model);
    } failure:^(NSString *errorMsg) {
        failed(errorMsg);
    }];
}

@end
