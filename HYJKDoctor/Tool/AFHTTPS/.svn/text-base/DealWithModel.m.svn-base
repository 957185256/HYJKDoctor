//
//  DealWithModel.m
//  NewWorld
//
//  Created by Sinoservice on 16/3/18.
//  Copyright © 2016年 odg. All rights reserved.
//

#import "DealWithModel.h"
#import "Methods.h"
#import "LocaData.h"
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
//***************************************************
//
//
//                   Model处理
//
//
//
//***************************************************
#pragma mark- =================第一次运行=================
+(void)firstModel{
    
    
}
#pragma mark- =================登录Model=================

//登录成功
+(void)loginSuccessful:(NSDictionary *)dic{
    
    
    [[LocaData shard]setUserID:[DealWithModel dicToString:dic objectForKey:@"uid"]];
    [[LocaData shard]setUserName:[DealWithModel dicToString:dic objectForKey:@"username"]];
    [[LocaData shard]setAvailableFunds:[DealWithModel dicToString:dic objectForKey:@"money"]];
    [[LocaData shard]setInterest:[DealWithModel dicToString:dic objectForKey:@"profit"]];
    [[LocaData shard]setTotalMoney:[DealWithModel dicToString:dic objectForKey:@"draw"]];
    [[LocaData shard]setUserImageUrl:[DealWithModel dicToString:dic objectForKey:@"pic"]];
    [[LocaData shard]setUserNicknameName:[DealWithModel dicToString:dic objectForKey:@"nickname"]];
    [[LocaData shard]setQqToke:[DealWithModel dicToString:dic objectForKey:@"qq_token"]];
    [[LocaData shard]setWeixinToken:[DealWithModel dicToString:dic objectForKey:@"weixin_token"]];
    [[LocaData shard]setWeiboToken:[DealWithModel dicToString:dic objectForKey:@"weibo_token"]];
    [[LocaData shard]setInvitcode:[DealWithModel dicToString:dic objectForKey:@"invit_code"]];
    [[LocaData shard]setUserMoblie:[DealWithModel dicToString:dic objectForKey:@"mobile"]];
    [[LocaData shard]setCertification:[DealWithModel dicToString:dic objectForKey:@"auth_status"]];
    [[LocaData shard]setUserRellyName:[DealWithModel dicToString:dic objectForKey:@"realname"] ];
    
    
    
    [[LocaData shard]setIsLogIn:YES];
    
}
//登录失败－注销
+(void)loginFailure{
    [[LocaData shard]setUserID:@""];
    [[LocaData shard]setUserName:@""];
    [[LocaData shard]setAvailableFunds:@""];
    [[LocaData shard]setInterest:@""];
    [[LocaData shard]setTotalMoney:@""];
    [[LocaData shard]setUserImageUrl:@""];
    [[LocaData shard]setUserNicknameName:@""];
    [[LocaData shard]setQqToke:@""];
    [[LocaData shard]setWeixinToken:@""];
    [[LocaData shard]setWeiboToken:@""];
    [[LocaData shard]setInvitcode:@""];
    [[LocaData shard]setUserMoblie:@""];
    [[LocaData shard]setCertification:@""];
    [[LocaData shard]setUserRellyName:@""];
    [[LocaData shard]setLoginPassWord:@""];
    [[LocaData shard]setSignature:@""];
    [[LocaData shard]setIsLogIn:NO];
    [[LocaData shard] setIsRefreshData:YES];
}
//列表
+(NSArray*)getHomeList:(NSDictionary*)dic{
    NSMutableArray *dataArray=[[NSMutableArray alloc]init];
    
    NSArray *aa=[DealWithModel dicToArray:dic objectForKey:@"list"];
    
    for (int i=0; i<aa.count; i++) {
        NSDictionary *dd=[aa objectAtIndex:i];
        WParametersModel *model=[[WParametersModel alloc]init];
        model.cell_type=@"HomePageCell";
        model.cell_title=@"任务";
        model.cell_height=ScreenWidth/2;
        
        model.task_id=[DealWithModel dicToString:dd objectForKey:@"id"];
        model.task_ad_name=[DealWithModel dicToString:dd objectForKey:@"ad_name"];
        model.task_collection=[DealWithModel dicToString:dd objectForKey:@"collection"];
        model.task_content=[DealWithModel dicToString:dd objectForKey:@"content"];
        model.task_num=[DealWithModel dicToString:dd objectForKey:@"num"];
        model.task_pic=[DealWithModel dicToString:dd objectForKey:@"pic"];
        model.task_surplus=[DealWithModel dicToString:dd objectForKey:@"surplus"];
        model.task_title=[DealWithModel dicToString:dd objectForKey:@"title"];
        model.task_latitude=[DealWithModel dicToString:dd objectForKey:@"x"];
        model.task_longitude=[DealWithModel dicToString:dd objectForKey:@"y"];
        model.task_distance=[DealWithModel dicToString:dd objectForKey:@"m"];
        model.task_status=[DealWithModel dicToString:dd objectForKey:@"status"];
        model.task_starttime=[DealWithModel dicToString:dd objectForKey:@"start_time"];
        
        [dataArray addObject:model];
        
    }
    
    return dataArray;
}
+(NSArray*)getTaskList:(NSDictionary*)dic
              withType:(NSUInteger)type
           andForBlock:(void (^)(NSUInteger i))ForBlock{
    NSMutableArray *dataArray=[[NSMutableArray alloc]init];
    
    NSArray *aa=[DealWithModel dicToArray:dic objectForKey:@"list"];
    for (NSUInteger i=0; i<aa.count; i++) {
        NSDictionary *dd=[aa objectAtIndex:i];
        WParametersModel *model=[[WParametersModel alloc]init];
        model.cell_type=@"TaskViewCell";
        model.task_id=[DealWithModel dicToString:dd objectForKey:@"id"];
        model.task_collection=[DealWithModel dicToString:dd objectForKey:@"collection"];
        model.task_content=[DealWithModel dicToString:dd objectForKey:@"content"];
        model.task_num=[DealWithModel dicToString:dd objectForKey:@"num"];
        model.task_pic=[DealWithModel dicToString:dd objectForKey:@"pic2"];
        model.task_surplus=[DealWithModel dicToString:dd objectForKey:@"surplus"];
        model.task_title=[DealWithModel dicToString:dd objectForKey:@"title"];
        model.task_addtime=[DealWithModel dicToString:dd objectForKey:@"addtime"];
        model.task_detail_id=[DealWithModel dicToString:dd objectForKey:@"detail_id"];
        model.task_dotime=[DealWithModel dicToString:dd objectForKey:@"dotime"];
        model.task_money=[DealWithModel dicToString:dd objectForKey:@"money"];
        model.task_status=[DealWithModel dicToString:dd objectForKey:@"status"];
        
        model.cell_userInteractionEnabled=YES;
        model.cell_height=0.365*ScreenWidth*0.755+38;
        
        model.task_type =[NSString stringWithFormat:@"%lu",(unsigned long)type];
        
        if (type==2) {
            model.task_isEditor=NO;
            model.cell_state=NO;
            model.task_taskstatus=[DealWithModel dicToString:dd objectForKey:@"task_status"];
            
        }
        [dataArray addObject:model];
        if (ForBlock) {
            ForBlock(i);
        }
    }
    
    return dataArray;
}
#pragma mark  保存数据
//+(void)updateDtaCar:(UseModel*)obj isAdd:(BOOL)yes isLoginPassWord:(BOOL)isLoginPassWord{
//    UseModel *carModel;
//    if (!obj) {
//        //==============第一次创建数据==============
//        UseModel *carModel=[[UseModel alloc]init];
//        carModel.hostID=[[LocaData shard].userID longLongValue];
//        carModel.user_name=[LocaData shard].userName;
//        carModel.user_imageUrl=[LocaData shard].userImageUrl;
//        carModel.user_loginName=[LocaData shard].loginName;
//        if (isLoginPassWord) {
//            carModel.user_loginPassWord=[LocaData shard].loginPassWord;
//        }
//        
//        [UserModel insert:carModel
//                 resBlock:^(BOOL res) {
//                     if (res) {
//                         dispatch_async(dispatch_get_main_queue(), ^{
//                             //                               [Methods showMBProgressfiul:@"数据本地保存成功!"];
//                             
//                         });
//                         
//                     }else{
//                         dispatch_async(dispatch_get_main_queue(), ^{
//                             [Methods showMBProgressfiul:@"数据本地保存失败!"];
//                             
//                         });
//                         
//                     }
//                 }];
//        
//    }else{
//        //==============数据存在做处理==============
//        
//        carModel=obj;
//        carModel.user_name=[LocalData shard].userName;
//        carModel.user_imageUrl=[LocalData shard].userImageUrl;
//        carModel.user_loginName=[LocalData shard].loginName;
//        carModel.user_loginPassWord=[LocalData shard].loginPassWord;
//        //如果数量在 就更新
//        [UserModel delete:carModel.hostID
//                 resBlock:^(BOOL res) {
//                     if (res) {
//                         dispatch_async(dispatch_get_main_queue(), ^{
//                             [UserModel insert:carModel
//                                      resBlock:^(BOOL res) {
//                                          if (res) {
//                                              dispatch_async(dispatch_get_main_queue(), ^{
//                                                  //                               [Methods showMBProgressfiul:@"数据本地保存成功!"];
//                                                  
//                                              });
//                                              
//                                          }else{
//                                              dispatch_async(dispatch_get_main_queue(), ^{
//                                                  [Methods showMBProgressfiul:@"数据本地保存失败!"];
//                                                  
//                                              });
//                                              
//                                          }
//                                      }];
//                         });
//                         
//                     }else{
//                         dispatch_async(dispatch_get_main_queue(), ^{
//                             [Methods showMBProgressfiul:@"数据本地保存失败!"];
//                             
//                         });
//                         
//                     }
//                 }];
//        
//        
//        
//        
//    }
//    
//}

@end
