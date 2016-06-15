//
//  UIAlertController+extend.h
//  Sonhoo
//
//  Created by wenzhizheng on 16/5/11.
//  Copyright © 2016年 Qzzl.Sonhoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (extend)

/**
 *  alert一个提示
 *
 *  @param title        提示标题
 *  @param controller 显示所在的控制器
 */
+ (void)alertWithtitle:(NSString *)title inController:(UIViewController *)controller handler:(void(^)())handler;

/**
 *  actionsheet 一些标题
 *
 *  @param titles     actionsheet标题数组
 *  @param controller 显示所在的控制器
 */
+ (void)actionSheetWith:(NSArray *)titles inController:(UIViewController *)controller handler:(void(^)(int index))handler;

/**
 *  弹出一个输入框
 *
 *  @param title      标题
 *  @param didInput   输入回调
 *  @param controller 显示所在的控制器
 */
+ (void)alertInputWithTitle:(NSString *)title placeholder:(NSString *)placeholder secureTextEntry:(BOOL)secureTextEntry inController:(UIViewController *)controller  didInput:(void(^)(NSString *content))didInput;

@end
