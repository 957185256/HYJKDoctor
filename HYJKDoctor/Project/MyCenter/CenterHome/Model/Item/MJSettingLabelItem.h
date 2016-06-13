//
//  MJSettingLabelItem.h
//  00-ItcastLottery
//
//  Created by apple on 14-4-17.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJSettingItem.h"

@interface MJSettingLabelItem : MJSettingItem

#pragma mark -右边标题
@property (nonatomic, copy) NSString *rightTitle;

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title RightTitle:(NSString *)rightTitle;

+ (instancetype)title:(NSString *)title RightTitle:(NSString *)rightTitle;
@end
