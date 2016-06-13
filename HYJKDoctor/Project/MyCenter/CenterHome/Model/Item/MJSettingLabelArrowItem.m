//
//  MJSettingLabelArrowItem.m
//  JLTShipper
//
//  Created by sinoservices on 16/4/13.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import "MJSettingLabelArrowItem.h"

@implementation MJSettingLabelArrowItem
#pragma mark ---初始化带图片－标题－右边标题－目标控制器
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title rightTitle:(NSString *)rightTitle destVcClass:(Class)destVcClass
{
    MJSettingLabelArrowItem *item = [self itemWithIcon:icon title:title];
    item.destVcClass = destVcClass;
    item.rightTitle = rightTitle;
    return item;
}

#pragma mark ---初始化带标题－右边标题－目标控制器
+ (instancetype)itemWithTitle:(NSString *)title rightTitle:(NSString *)rightTitle destVcClass:(Class)destVcClass
{
    return [self itemWithIcon:nil title:title rightTitle:rightTitle destVcClass:destVcClass];
}


@end
