//
//  TelTools.h
//  Sonhoo
//
//  Created by wenzhizheng on 16/5/12.
//  Copyright © 2016年 Qzzl.Sonhoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TelTools : NSObject

/**
 *  打电话
 *
 *  @param telNumber 电话号码
 *  @param view      要打电话的界面
 */
+ (void)callNumber:(NSString *)telNumber inView:(UIView *)view;

/**
 *  发信息
 *
 *  @param telNumber 需要发送的信息号码
 */
+ (void)sendMessageToTelNumber:(NSString *)telNumber;


/**
 *  从通讯录中获取联系人电话号码和姓名
 *
 *  @param controller      要显示的控制器
 *  @param didChoosePerson 选择一个联系人之后回调
 */
+ (void)getAddressBookPersonInfoInController:(UIViewController *)controller didChoosePerson:(void(^)(NSString *name,NSString *tel))didChoosePerson;

/**
 *  添加一个联系人到本地通讯录
 
 *  @param controller   要显示的控制器
 *  @param name         姓名
 *  @param tel          电话
 */
+ (void)addPersonInfoInController:(UIViewController *)controller name:(NSString *)name tel:(NSString *)tel;

@end
