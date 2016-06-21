//
//  AFManger.m
//  HYJKDoctor
//
//  Created by wenzhizheng on 16/6/7.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import "AFManager.h"
#import "Account.h"

@implementation AFManager

+ (instancetype)shareManager
{
    static AFManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] initWithBaseURL:[NSURL URLWithString:@"http://test.hyyl.cc"]];
        
        manager.requestSerializer.timeoutInterval = 10.f;
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        
    });
    return manager;
}

+ (void)updataSessionSucceed:(void(^)(NSDictionary *session))succeed failed:(void(^)())failed
{
    Account *account = [Account getAccount];
    if (!account) {
        failed();
        return;
    }
    
    [self postWithPath:@"/doctor/signin" params:@{@"name":account.name,@"password":account.password} succeed:^(NSDictionary *responsedict) {
        NSDictionary *session = responsedict[@"data"][@"session"];
        succeed(session);
        account.session = session;
        [account save];
    } failed:^(NSError *error) {
        failed();
    }];
}

+ (void)postWithPath:(NSString *)path params:(NSDictionary *)params succeed:(void(^)(NSDictionary *responsedict))succeed failed:(void(^)(NSError *error))failed
{
    NSString *urlPath = [NSString stringWithFormat:@"/openapi/?url=%@",path];
    
    [[self shareManager] POST:urlPath parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:0];
        
        // 如果过期 更新session 递归请求
        NSString *errorStr = dict[@"status"][@"error_desc"];
        if ([errorStr containsString:@"过期"]) {
            NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:params];
            [dict removeObjectForKey:@"session"];
            [self updataSessionSucceed:^(NSDictionary *session) {
                [dict setObject:session forKey:@"session"];
                [self postWithPath:path params:dict succeed:succeed failed:failed];
            } failed:^{
                
                // 更新session失败
                if (failed) {
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"GetSessionFailed" object:nil];
                    failed(nil);
                }
            }];
            
        } else {
            if (succeed) {
                succeed(dict);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failed) {
            [Methods showToast:@"请检查网络" inSuperview:[UIApplication sharedApplication].keyWindow];
            failed(error);
            failed(error);
        }
    }];
}

+ (BOOL)isRequsetSucceed:(NSDictionary *)responsedict
{
    NSString *succeed = [NSString stringWithFormat:@"%@",responsedict[@"status"][@"succeed"]];
    if ([succeed isEqualToString:@"0"]) {
        NSString *error = responsedict[@"status"][@"error_desc"];
        [Methods showToast:error inSuperview:[UIApplication sharedApplication].keyWindow];
        return NO;
    }
    return YES;
}



@end
