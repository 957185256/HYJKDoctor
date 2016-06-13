//
//  DealWithModel.h
//  NewWorld
//
//  Created by Sinoservice on 16/3/18.
//  Copyright © 2016年 odg. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface DealWithModel : NSObject
//====================model安全存取====================
//字典取id
+(id)dicToId:(NSDictionary*)dic
objectForKey:(NSString*)str;
//字典取 NSString
+(NSString*)dicToString:(NSDictionary*)dic
           objectForKey:(NSString*)str;
//字典取 NSArray
+(NSArray*)dicToArray:(NSDictionary*)dic
         objectForKey:(NSString*)str;
//====================AF返回处理====================
//AF返回成功处理
+(void)dealWithSuccessful:(id)responseObject
                stateSure:(void (^)(NSDictionary *sureDic))block
                  stateNO:(void (^)(NSDictionary *noDic))noblock;
//AF返回失败处理
+(void)dealWithFailure:(NSError*)error
               failure:(void (^)(void))block;

@end