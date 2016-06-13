//
//  DealWithModel.m
//  NewWorld
//
//  Created by Sinoservice on 16/3/18.
//  Copyright © 2016年 odg. All rights reserved.
//

#import "DealWithModel.h"
#import "Methods.h"
@implementation DealWithModel
#pragma mark- =================数据交互默认设置=================
#pragma mark 字典取id
+(id)dicToId:(NSDictionary*)dic
objectForKey:(NSString*)str{
    id value= [dic objectForKey:str];
    return ([value isEqual:[NSNull null]]||value==nil)?@"":value;
    
}
#pragma mark 字典取 NSString
+(NSString*)dicToString:(NSDictionary*)dic
           objectForKey:(NSString*)str{
    id value= [dic objectForKey:str];
    NSString *valueStr=[NSString stringWithFormat:@"%@",value];
    return ([value isEqual:[NSNull null]]||value==nil)?@"":valueStr;
    
}
#pragma mark 字典取 NSArray
+(NSArray*)dicToArray:(NSDictionary*)dic
         objectForKey:(NSString*)str{
    id value= [dic objectForKey:str];
    return ([value isEqual:[NSNull null]]||value==nil)?@[]:value;
}
#pragma mark- =================AF成功失败处理=================
#pragma mark AF返回成功处理
+(void)dealWithSuccessful:(id)responseObject
                stateSure:(void (^)(NSDictionary *sureDic))block
                  stateNO:(void (^)(NSDictionary *noDic))noblock{
    
    //解析成功
    if ([[responseObject objectForKey:@"result"]intValue]==1) {
        //状态成功
        if (block) {
            block(responseObject);
        }
        
    }else{
        
        
        if (noblock) {
            noblock(responseObject);
        }
        
        [Methods showMBProgressfiul:[DealWithModel dicToString:responseObject objectForKey:@"msg"]];
        
        
        
    }
    
    
}
#pragma mark AF返回失败处理
+(void)dealWithFailure:(NSError*)error
               failure:(void (^)(void))block{
    
    if (error.code!=NSURLErrorCancelled) {
        
        if (block) {
            block();
        }
        [Methods showMBProgressfiul:[[error userInfo]objectForKey:@"NSLocalizedDescription"]];
        
        CLog(@"POST请求错误: %@", error );
    }else{
        CLog(@"请求取消");
        
    }
    
    
}


@end
