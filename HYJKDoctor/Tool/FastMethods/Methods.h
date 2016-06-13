//
//  Methods.h
//  NewWorld
//
//  Created by Sinoservice on 16/3/18.
//  Copyright © 2016年 odg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MBProgressHUD.h>
#import <TAOverlay.h>
//#import "FastToolBar.h"
@interface Methods : NSObject
#pragma -mark- =================== 好用方法 =======================
//延迟几秒执行的方法
+ (void)performBlock:(void(^)())block
          afterDelay:(NSTimeInterval)delay;
//计算经纬度之间的距离
+(double)distanceBetweenOrderByLatitude1:(double)latitude1
                          withLongitude1:(double)longitude1
                            andLatitude2:(double)latitude2
                          withLongitude2:(double)longitude2;
//获取plist
+(NSArray *)ArrayWithString:(NSString *)string;

//自动布局
+(void)setEdge:(UIView*)superview
          view:(UIView*)view
          attr:(NSLayoutAttribute)attr
      constant:(CGFloat)constant;
#pragma -mark- =================== 登陆判断 =======================
//md5加密
+(NSString *)md5Digest:(NSString *)digestStr;
//判断邮箱
+(BOOL)isValidateEmail:(NSString *)email;
//判断实名
+(BOOL)isValidateName:(NSString *)name;
//判断用户名
+ (BOOL)isValidateUserName:(NSString *)userName;
//判断手机号码
+(BOOL)isValidatePhone:(NSString *)phone;
//判断密码
+(BOOL)isValidatePass:(NSString *)paw;
//判断省份证号
+ (BOOL)validateIdentityCard: (NSString *)identityCard;
//判断QQ号
+(BOOL)isValidateQQ:(NSString *)qqNum;


#pragma -mark- =================== 字符串 =======================
//普通字符串转换为十六进制的。
+ (NSString *)hexStringFromString:(NSString *)string;
//得到当前时间
+(NSString*)getNowTime;
//把时间转化为2012-12-13
+(NSString*)getDate:(NSDate*)date;
//获得设备信息
+(NSString *)getCurrentDeviceModel;
//打印设备信息
+(void )nslogCurrentDevice;
//获得程序信息
+(NSString *)programInformation:(NSString*)str;
//转HEML5
+(NSString *)filterHTML:(NSString *)html;
#pragma -mark- =================== 清除缓存用到 =======================
//单个文件的大小
+(long long) fileSizeAtPath:(NSString*) filePath;
//遍历文件夹获得文件夹大小，返回多少M
+ (float ) folderSizeAtPath:(NSString*) folderPath;
//缓存大小
+(float)theCacheSize;
//清除缓存
+(void)clearTheCache;
//查看沙盒信息
+(void)takeInform;

#pragma -mark- =================== UI弹出框 =======================
+(void)showMBProgressfiul:(NSString*)str;
+(void)showMBProgressHint:(NSString*)str;
//黑色加载进度条
+(void)showMBProgress:(NSString*)str
             withView:(UIView*)view;
//黑色加载进度条 dismiss
+(void)dismissMBProgressWithView:(UIView*)view;
//自动消失的全屏提示
+(void)showOverlay:(NSString*)str
           Options:(TAOverlayOptions)newOptions;



//弹出提示框1
+(void)alertViewWithTitle:(NSString*)title
              contentText:(NSString*)contStr
          leftButtonTitle:(NSString*)leftstr
         rightButtonTitle:(NSString*)rightstr
                   finish:(void (^)(NSInteger index))block;

//弹出提示框2
+(void)sheetWithTitle:(NSString*)title
              oneText:(NSString*)oneText
              twoText:(NSString*)twoText
               finish:(void (^)(NSInteger index))block;


#pragma -mark- =================== UIImage用到 =======================
//快速图片拉伸
+(UIImage*)imageName:(NSString*)name
       WithCapInsets:(UIEdgeInsets)capInsets
        resizingMode:(UIImageResizingMode)resizingMode;
//获得颜色图片
+ (UIImage *)imageWithColor:(UIColor *)color;
//测试图片地址
+(NSString*)getImageUrl;


#pragma -mark- =================== UILabel用到 =======================
+(NSMutableAttributedString*)getLineLabel:(NSString*)str;
+(CGFloat)getSize:(NSString*)str maxW:(int)maxw AndFont:(int)fontSize;
#pragma -mark 签名
+(NSString *)signatureWithMd5:(NSDictionary *)dic andHost:(NSString *)host;


#pragma -mark- =================== Frame用到 =======================
// 根据iphone6 适配iphone5 和iphone6plus

+(CGFloat )formatSpaceFromIphone6:(CGFloat )space;


// 根据iphone5 适配iphone6 和iphone6plus
+(CGRect )formatCGRectFromIphone5:(CGRect )rect;
+(CGSize )formatCGSizeFromIphone5:(CGSize)size;
+(CGFloat )formatHEIGHTFromIphone5:(CGFloat )height;
#pragma -mark- ==================系统 名称 版本==================
+(NSString *)getApplicationName;//app名称
+(NSString *)getApplicationVersion;//app版本
+ (NSString *)getApplicationBuildVersion;//app build版本

#pragma -mark- ==========================================
+(UIColor *)cutomThemColor;

@end
