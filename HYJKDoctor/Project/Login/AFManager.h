//
//  AFManger.h
//  HYJKDoctor
//
//  Created by wenzhizheng on 16/6/7.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFHTTPSessionManager.h>

@interface AFManager : AFHTTPSessionManager

/**
 *  post
 *
 *  @param path    路径
 *  @param params  参数
 *  @param succeed 成功
 *  @param failed  失败
 */
+ (void)postWithPath:(NSString *)path params:(NSDictionary *)params succeed:(void(^)(NSDictionary *responsedict))succeed failed:(void(^)(NSError *error))failed;

@end
