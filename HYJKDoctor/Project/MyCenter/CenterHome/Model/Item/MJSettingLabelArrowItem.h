//
//  MJSettingLabelArrowItem.h
//  JLTShipper
//
//  Created by sinoservices on 16/4/13.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import "MJSettingItem.h"

@interface MJSettingLabelArrowItem : MJSettingItem
#pragma mark -点击这行cell需要跳转的控制器
@property (nonatomic, assign) Class destVcClass;
#pragma mark -右边标题
@property (nonatomic, copy) NSString *rightTitle;


+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title rightTitle:(NSString *)rightTitle destVcClass:(Class)destVcClass;
+ (instancetype)itemWithTitle:(NSString *)title rightTitle:(NSString *)rightTitle destVcClass:(Class)destVcClass;



@end
