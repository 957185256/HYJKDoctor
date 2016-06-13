//
//  BaseVC.h
//  JLT
//
//  Created by Sinoservice on 16/3/18.
//  Copyright © 2016年 odg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh/MJRefresh.h>
@interface BaseVC : UIViewController
{
    NSInteger currentPage;
    NSInteger totalPage;
    
    NSString *pageSize;
    
}

//导航栏基本UI+事件
@property (strong, nonatomic)  UIButton *leftButton;
@property (strong, nonatomic)  UIButton *rightButton;
-(void)touchRightBnt:(UIButton *)sender;
-(void)touchLeftBnt:(UIButton *)sender;

//AF请求
@property(strong ,nonatomic)NSMutableArray *afNetArray;//保存请求数据
-(void)cancelRequset;//取消当前请求




//基本数据
@property(assign,nonatomic)BOOL isCurrentPage;//是否当前页面



//进度条
@property (strong, nonatomic)UIActivityIndicatorView *activity;
//加载中图片
@property(strong ,nonatomic)UIImageView *loadImageV;
//没有数据的图片
@property(strong ,nonatomic)UIImageView *nodataImageV;

//提示信息View
@property(nonatomic,weak)UIView *tipMsgView;
#pragma mark -显示加载等待界面  time秒后消失
-(void)showLoadingViewWithTime:(NSInteger)time;

#pragma mark -黑色提示框 自动消失
-(void)showHDAlertWithString:(NSString *)message;

#pragma mark -开始加载  需要手动关闭
-(void)showLoadingView;

#pragma mark -关闭加载
-(void)stopLoadingView;

#pragma mark -延迟调用
- (void)performBlock:(void(^)())block afterDelay:(NSTimeInterval)delay;

#pragma mark -显示提示信息view
- (void)showTipMsg:(NSString *)msg;

#pragma mark - 进度框加载部分
//显示菊花框
-(void)showTip : (NSString *)msg;
//隐藏菊花框
-(void)hidenTip;


//键盘事件
-(void)addKeyNotification;
@property(copy,nonatomic)void(^keyCome)(void);
@property(copy,nonatomic)void(^keyHide)(void);



@end
