//
//  AFClient.m
//  NewWorld
//
//  Created by Sinoservice on 16/3/18.
//  Copyright © 2016年 odg. All rights reserved.
//

#import "AFClient.h"
#import "Methods.h"
@implementation AFClient
static NSString * const BaseURLString = @"http://www.baidu.com";
#pragma mark - ==============基类==============
#pragma mark 单利
+ (instancetype)sharedClient {
    static AFClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[AFClient alloc] initWithBaseURL:[NSURL URLWithString:BaseURLString]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        //设置超时时间
        [_sharedClient.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        _sharedClient.requestSerializer.timeoutInterval = 10.f;
        [_sharedClient.requestSerializer didChangeValueForKey:@"timeoutInterval"];
        NSSet *acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                         @"text/html",
                                         @"text/json",
                                         @"text/javascript",
                                         @"text/plain", nil];
        _sharedClient.responseSerializer.acceptableContentTypes = acceptableContentTypes;
        _sharedClient.requestSerializer = [AFJSONRequestSerializer serializer];
    });
    
    return _sharedClient;
}
#pragma mark  网络状态监听
+(void)networkStatusMonitoring{
    
    AFURLSessionManager* manager=[AFClient sharedClient];
    //网络变化
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case -1:
            {
                NSLog(@"当前网络状态改变为:%ld    未知网络",(long)status);
            }
                break;
            case 0:
            {
                NSLog(@"当前网络状态改变为:%ld    没有网络",(long)status);
            }
                break;
            case 1:
            {
                NSLog(@"当前网络状态改变为:%ld    窝蜂网络",(long)status);
            }
                break;
            case 2:
            {
                NSLog(@"当前网络状态改变为:%ld    WiFi网络",(long)status);
            }
                break;
            default:
                break;
        }
        
    }];
    [manager.reachabilityManager startMonitoring];
    
}
#pragma mark - ==============AF请求==============
#pragma mark AF快速设置
//GET请求
+(void)getMethods:(NSString*)host//请求地址
       parameters:(NSDictionary*)dic
      cancelArray:(NSMutableArray*)array
         showView:(UIView*)view
        stateSure:(void (^)(NSDictionary*sureDic))stateSureblock
      stateNoSure:(void (^)(NSDictionary*noSureDic))stateNoSureblock
          Failure:(void (^)(NSError *error))failureblock{
    if (view) {
        [Methods showMBProgress:@"请稍等..." withView:view];
    }
    CLog(@"=======================分割线开始====================");
    if (dic) {
        CLog(@"%@",dic);
    }
    
    NSURLSessionDataTask *post;
    
    NSMutableDictionary *dd=[[NSMutableDictionary alloc]initWithDictionary:dic];
    
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970];
    
    NSString *timeString = [NSString stringWithFormat:@"%d",(int)a];
    
    [dd setObject:timeString forKey:@"stamp"];
    [dd setObject:@"IOS" forKey:@"platform"];
    NSString  *signature=[Methods signatureWithMd5:dd andHost:host];
    [dd setObject:signature forKey:@"bd_sig"];
    post = [[AFClient sharedClient]GET:host parameters:dd progress:^(NSProgress * _Nonnull downloadProgress) {
        //请求进程条
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //去掉数组AF
        if (array) {

            [array removeObject:post];
        }
        
        //去掉加载进度条
        if (view) {
            [Methods dismissMBProgressWithView:view];
        }
        
        //请求成功 统一判断状态处理
        [DealWithModel dealWithSuccessful:responseObject
                                stateSure:^(NSDictionary *sureDic) {
                                    //状态成功
                                    if (stateSureblock) {
                                        stateSureblock([sureDic objectForKey:@"data"]);
                                    }
                                    
                                } stateNO:^(NSDictionary *noDic) {
                                    //状态失败
                                    if (stateNoSureblock) {
                                        stateNoSureblock([noDic objectForKey:@"data"]);
                                    }
                                }];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //去掉数组AF
        if (array) {
            [array removeObject:post];
        }
        //去掉加载进度条
        if (view) {
            [Methods dismissMBProgressWithView:view];
        }
        
        //请求失败统一失败处理
        [DealWithModel dealWithFailure:error
                               failure:^{
                                   if (failureblock) {
                                       failureblock(error);
                                   }
                               }];
        
    }];
    
    if (array) {
        [array addObject:post];
    }
    
    
}


//POST请求
+(void)postMethods:(NSString*)host
        parameters:(NSDictionary*)dic
       cancelArray:(NSMutableArray*)array
          showView:(UIView*)view
         stateSure:(void (^)(NSDictionary*sureDic))stateSureblock
       stateNoSure:(void (^)(NSDictionary*noSureDic))stateNoSureblock
           Failure:(void (^)(NSError *error))failureblock{
    if (view) {
        [Methods showMBProgress:@"" withView:view];
    }
    NSURLSessionDataTask *post;
    
    NSMutableDictionary *dd=[[NSMutableDictionary alloc]initWithDictionary:dic];
    
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970];
    
    NSString *timeString = [NSString stringWithFormat:@"%d",(int)a];
    
    [dd setObject:timeString forKey:@"stamp"];
    [dd setObject:@"IOS" forKey:@"platform"];
    NSString  *signature=[Methods signatureWithMd5:dd andHost:host];
    
    [dd setObject:signature forKey:@"bd_sig"];
    
    post=[[AFClient sharedClient]POST:host parameters:dd constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        //请求数据包
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        //请求进程条
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //去掉数组AF
        if (array) {
            [array removeObject:post];
        }
        
        //去掉加载进度条
        if (view) {
            [Methods dismissMBProgressWithView:view];
        }
        
        //请求成功 统一判断状态处理
        [DealWithModel dealWithSuccessful:responseObject
                                stateSure:^(NSDictionary *sureDic) {
                                    //状态成功
                                    if (stateSureblock) {
                                        stateSureblock([sureDic objectForKey:@"data"]);
                                    }
                                    
                                } stateNO:^(NSDictionary *noDic) {
                                    //状态失败
                                    if (stateNoSureblock) {
                                        stateNoSureblock(noDic);
                                    }
                                }];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //去掉数组AF
        if (array) {
            [array removeObject:post];
        }
        //去掉加载进度条
        if (view) {
            [Methods dismissMBProgressWithView:view];
        }
        
        //请求失败统一失败处理
        [DealWithModel dealWithFailure:error
                               failure:^{
                                   if (failureblock) {
                                       failureblock(error);
                                   }
                               }];
        
        
    }];
    
    //请求队列加入数组 返回页面自动取消
    
    if (array) {
        [array addObject:post];
    }
}

@end
