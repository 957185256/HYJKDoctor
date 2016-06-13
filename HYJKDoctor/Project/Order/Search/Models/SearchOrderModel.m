//
//  SearchOrderModel.m
//  HYJKDoctor
//
//  Created by shown on 16/6/13.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import "SearchOrderModel.h"

@implementation SearchOrderModel

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_order_id forKey:@"order_id"];
    [aCoder encodeObject:_order_time forKey:@"order_time"];
    [aCoder encodeObject:_consignee forKey:@"consignee"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init])
    {
        _order_id = [aDecoder decodeObjectForKey:@"order_id"];
        _order_time = [aDecoder decodeObjectForKey:@"order_time"];
        _consignee = [aDecoder decodeObjectForKey:@"consignee"];
    }
    return self;
}

@end
