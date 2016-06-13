//
//  MJSettingItem.m
//  00-ItcastLottery
//
//  Created by apple on 14-4-17.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJSettingItem.h"

@implementation MJSettingItem

#pragma mark ---初始化带图片以及标题
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title
{
    MJSettingItem *item = [[self alloc] init];
    item.icon = icon;
    item.title = title;
    return item;
}

#pragma mark ---初始化带标题
+ (instancetype)itemWithTitle:(NSString *)title
{
    return [self itemWithIcon:nil title:title];
}
@end
