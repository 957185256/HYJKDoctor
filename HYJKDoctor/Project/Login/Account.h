//
//  Account.h
//  HYJKDoctor
//
//  Created by wenzhizheng on 16/6/1.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Account : NSObject <NSCoding>

/**
 *  账号
 */
@property (nonatomic,strong) NSString *name;

/**
 *  密码
 */
@property (nonatomic,strong) NSString *password;



/**
 *  临时证明
 */
@property (nonatomic,strong) NSDictionary *session;

/**
 *  保存用户模型
 */
- (void)save;

/**
 *  读取本地保存用户模型
 */
+ (instancetype)getAccount;


/**
 *  用户退出登录
 */
+ (void)quit;

/**
 *  字典转模型
 */
+ (instancetype)accountWithDict:(NSDictionary *)dict;


@end
