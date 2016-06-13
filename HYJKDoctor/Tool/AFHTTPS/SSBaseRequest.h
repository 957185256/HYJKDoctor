//
//  SSBaseRequest.h
//  Ma17i56－基类网络数据请求类（封装）
//
//  Created by Sinoservice on 15/10/27.
//  Copyright (c) 2015年 odg. All rights reserved.
//

#import <Foundation/Foundation.h>

//成功失败返回block块
typedef void(^SuccessBlock)(NSDictionary *reponseDict);
typedef void(^FailureBlock)(NSString *errorMsg);

@interface SSBaseRequest : NSObject{
    	id deserializeTo; //这个对象是什么
}

//网络是否可用
+ (BOOL)isReachable;

#pragma mark - 普通请求部分

/**
 *  接口请求－普通请求-Get
 *
 *  @param parameters 接口参数
 *  @param success    成功回调
 *  @param failure    失败回调
 */
+ (void)requestGetWithParameters:(NSDictionary *)parameters
                   requestUrl:(NSString *)url
                      success:(SuccessBlock)success
                      failure:(FailureBlock)failure;

/**
 *  接口请求－普通请求-Post
 *
 *  @param parameters 接口参数
 *  @param success    成功回调
 *  @param failure    失败回调
 */
+ (void)requestPostWithParameters:(NSDictionary *)parameters
                      requestUrl:(NSString *)url
                         success:(SuccessBlock)success
                         failure:(FailureBlock)failure;


#pragma mark - 文件下载部分

- (void)sessionDownloadFileByUrl : (NSString *) fielUrl;





@end
