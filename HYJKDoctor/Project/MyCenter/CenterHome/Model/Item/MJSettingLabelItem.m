//
//  MJSettingLabelItem.m
//  00-ItcastLottery
//
//  Created by apple on 14-4-17.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJSettingLabelItem.h"

@implementation MJSettingLabelItem

//图标－标题－右边标题
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title RightTitle:(NSString *)rightTitle{
    MJSettingLabelItem *item = [self itemWithIcon:icon title:title];
    item.rightTitle = rightTitle;
    return item;
}

//标题－右边标题
+ (instancetype)title:(NSString *)title RightTitle:(NSString *)rightTitle{
    MJSettingLabelItem *item = [self itemWithTitle:title];
    item.rightTitle = rightTitle;
    return item;
}



@end
