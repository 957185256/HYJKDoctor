//
//  SSBaseRequest.m
//  Ma17i56－基类网络数据请求类（封装）
//
//  Created by Sinoservice on 15/10/27.
//  Copyright (c) 2015年 odg. All rights reserved.
//

#import "SSBaseRequest.h"
//#import "AFHTTPSessionManager+Extension.h"
//#import "SoapArray.h"
//#import "SoapFault.h"
//#import "Soap.h"
//#import "SSNavigationViewController.h"
//#import "SSLoginViewController.h"
#import "AppDelegate.h"
//#import "AFHTTPRequestOperationManager.h"
//#import "AFNeworking.h"
#import <AFNetworking/AFNetworking.h>


static CGFloat const kTimeoutInterval = 25.0f;

@interface SSBaseRequest ()

+ (BOOL)isReachable;

@end

@implementation SSBaseRequest


/**
 *  判断网络是否可用
 *  @return 状态
 */
+ (BOOL)isReachable{

    return [AFNetworkReachabilityManager sharedManager].isReachable;
}


#pragma mark -普通http请求部分
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
                         failure:(FailureBlock)failure{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = kTimeoutInterval;
    NSSet *acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                     @"text/html",
                                     @"text/json",
                                     @"text/javascript",
                                     @"text/plain", nil];
    manager.responseSerializer.acceptableContentTypes = acceptableContentTypes;
    
    NSString *requestUrl;
//    NSString *requestUrl=[NSString stringWithFormat:@"%@:%@%@/%@",[[ProUserDefaultsTool shareInstance] getServiceURl],[[ProUserDefaultsTool shareInstance] getServicePort1],[[ProUserDefaultsTool shareInstance] getServiceProjectName],url];
//    
//    //没有端口号
//    if([[[ProUserDefaultsTool shareInstance] getServicePort1] length]==0)
//    {
//        requestUrl=[NSString stringWithFormat:@"%@%@/%@",[[ProUserDefaultsTool shareInstance] getServiceURl],[[ProUserDefaultsTool shareInstance] getServiceProjectName],url];
//    }
    
//    //如果url已经是全拼路径的话 就直接使用该路径
//    if ([url hasPrefix:@"http://"] || [url hasPrefix:@"https://"]) {
//        requestUrl = url;
//    }
    
    
    [manager GET:requestUrl parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        success(responseObject);

    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSString *errorMessage = [error.userInfo valueForKey:@"NSLocalizedDescription"];
//        [[UIApplication sharedApplication].keyWindow addSubview:[UIView viewWithMessage:errorMessage]];
        
        if(failure){
            failure(errorMessage);
        }
    }];
}

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
                          failure:(FailureBlock)failure{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = kTimeoutInterval;
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    NSString *requestUrl = [NSString stringWithFormat:@"http://test.hyyl.cc/openapi/?url=%@",url];
    
    
    [manager POST:requestUrl parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        success(dict);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSString *errorMessage = [error.userInfo valueForKey:@"NSLocalizedDescription"];
        //        [[UIApplication sharedApplication].keyWindow addSubview:[UIView viewWithMessage:errorMessage]];
        if(failure){
            failure(errorMessage);
        }

    }];
    
}

#pragma mark - 文件下载部分

- (void)sessionDownloadFileByUrl : (NSString *) fielUrl
{
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:config];
    
    //NSString *urlString = @"http://localhost/itcast/videos/01.C语言-语法预览.mp4";
    NSString *urlString = [fielUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDownloadTask *task = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        // 指定下载文件保存的路径
        // NSLog(@"%@ %@", targetPath, response.suggestedFilename);
        // 将下载文件保存在缓存路径中
        NSString *cacheDir = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
        NSString *path = [cacheDir stringByAppendingPathComponent:response.suggestedFilename];
        
        // URLWithString返回的是网络的URL,如果使用本地URL,需要注意
        NSURL *fileURL1 = [NSURL URLWithString:path];
        NSURL *fileURL = [NSURL fileURLWithPath:path];
        
        ODGLOG(@"== %@ |||| %@", fileURL1, fileURL);
        
        return fileURL;
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        ODGLOG(@"%@ %@", filePath, error);
    }];
    
    [task resume];
}



@end
