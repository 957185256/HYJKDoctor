//
//  AFClient.h
//  NewWorld
//
//  Created by Sinoservice on 16/3/18.
//  Copyright © 2016年 odg. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "AFHTTPSessionManager.h"
#import "UIImageView+AFNetworking.h"
#import "MJExtension.h"
#import "DealWithModel.h"
@interface AFClient : AFHTTPSessionManager
//====================基类====================
//单利
+ (instancetype)sharedClient;
//网络监听
+(void)networkStatusMonitoring;

//====================AF请求====================
//范例
+(void)postMethods:(NSString*)host//请求地址
        parameters:(NSDictionary*)dic//参数
       cancelArray:(NSMutableArray*)array//取消请求数组
          showView:(UIView*)view//是否需要进度条
         stateSure:(void (^)(NSDictionary*sureDic))stateSureblock//请求成功状态成功
       stateNoSure:(void (^)(NSDictionary*noSureDic))stateNoSureblock//请求成功状态失败
           Failure:(void (^)(NSError *error))failureblock;//请求失败
//GET请求
+(void)getMethods:(NSString*)host//请求地址
       parameters:(NSDictionary*)dic
      cancelArray:(NSMutableArray*)array
         showView:(UIView*)view
        stateSure:(void (^)(NSDictionary*sureDic))stateSureblock
      stateNoSure:(void (^)(NSDictionary*noSureDic))stateNoSureblock
          Failure:(void (^)(NSError *error))failureblock;
//自动登录
//+(void)loginSuccessful:(void (^)(void))block
//               Failure:(void (^)(void))noblock;



@end
