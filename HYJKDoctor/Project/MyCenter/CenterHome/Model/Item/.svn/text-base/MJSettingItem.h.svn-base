//
//  MJSettingItem.h
//  00-ItcastLottery
//
//  Created by apple on 14-4-17.
//  Copyright (c) 2014年 itcast. All rights reserved.
//  每一个cell都应一个MJSettingItem模型

#import <Foundation/Foundation.h>

typedef void (^MJSettingItemOption)();

@interface MJSettingItem : NSObject

#pragma mark -图标
@property (nonatomic, copy) NSString *icon;

#pragma mark -标题
@property (nonatomic, copy) NSString *title;

#pragma mark -子标题
@property (nonatomic, copy) NSString *subtitle;


/**
 *  存储数据用的key
 */
//@property (nonatomic, copy) NSString *key;

#pragma mark -点击那个cell需要做什么事情(块)
@property (nonatomic, copy) MJSettingItemOption option;

#pragma mark ---初始化带图片以及标题
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title;

#pragma mark ---初始化带标题
+ (instancetype)itemWithTitle:(NSString *)title;
@end
