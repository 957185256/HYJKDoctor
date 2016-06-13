//
//  Methods.m
//  NewWorld
//
//  Created by Sinoservice on 16/3/18.
//  Copyright © 2016年 odg. All rights reserved.
//

#import "Methods.h"
#import <CoreLocation/CoreLocation.h>
#import <CommonCrypto/CommonDigest.h>
#import <sys/types.h>
#import <sys/sysctl.h>

#import "UIAlertView+Fast.h"//系统弹出框快捷方式1
#import "UIActionSheet+Fast.h"//系统弹出框快捷方式2
@implementation Methods
#pragma -mark- =================== 好用方法 =======================
#pragma -mark 延迟几秒执行
+ (void)performBlock:(void(^)())block afterDelay:(NSTimeInterval)delay {
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), block);
}
#pragma -mark 计算经纬度之间的距离
+(double)distanceBetweenOrderByLatitude1:(double)latitude1
withLongitude1:(double)longitude1
andLatitude2:(double)latitude2
withLongitude2:(double)longitude2
{
    CLLocation* curLocation = [[CLLocation alloc]initWithLatitude:latitude1
                                                        longitude:longitude1];
    CLLocation* otherLocation = [[CLLocation alloc]initWithLatitude:latitude2
                                                          longitude:longitude2];
    double distance  = [curLocation distanceFromLocation:otherLocation];
    return distance;
}
//获取plist
+(NSArray *)ArrayWithString:(NSString *)string{
    NSString *plistPath = [[NSBundle mainBundle]pathForResource:string ofType:nil];
    NSArray *array = [[NSArray alloc]initWithContentsOfFile:plistPath];
    return array;
    
}

#pragma -mark 自动布局
+(void)setEdge:(UIView*)superview
view:(UIView*)view
attr:(NSLayoutAttribute)attr
constant:(CGFloat)constant

{
       [superview addConstraint:[NSLayoutConstraint  constraintWithItem:view
                                                           attribute:attr
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:superview
                                                           attribute:attr
                                                          multiplier:1.0
                                                            constant:constant]];
    
    
}

#pragma -mark- =================== 登陆判断 =======================
#pragma -mark md5加密
+(NSString *)md5Digest:(NSString *)digestStr
{
    
    
    const char *cStr = [digestStr UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (int)strlen(cStr), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++)
    {
        [hash appendFormat:@"%02X", result[i]];
    }
    return [hash lowercaseString];
}
#pragma -mark QQ号
+(BOOL)isValidateQQ:(NSString *)qqNum{
    
    NSString *qqRegex = @"^[1-9][0-9]{4,13}$";
    NSPredicate *qqTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",qqRegex];
    return [qqTest evaluateWithObject:qqNum];
}
#pragma -mark 身份证号
+ (BOOL)validateIdentityCard: (NSString *)identityCard
{
    NSString *emailRegex = @"(^\\d{15}$)|(^\\d{17}([0-9]|X)$)";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",emailRegex];
    return [emailTest evaluateWithObject:identityCard];
}
#pragma -mark 判断邮箱
+(BOOL)isValidateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",emailRegex];
    return [emailTest evaluateWithObject:email];
}
#pragma -mark 判断实名
+(BOOL)isValidateName:(NSString *)name{
    NSString *nameRegex = @"^[\u4E00-\u9FA5]*$";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",nameRegex];
    return [nameTest evaluateWithObject:name];
    
}
#pragma -mark 判断用户名
+ (BOOL)isValidateUserName:(NSString *)userName{
    NSString *userNameRegex = @"^[a-zA-Z][a-zA-Z0-9]{5,20}$";
    NSPredicate *userNameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",userNameRegex];
    return [userNameTest evaluateWithObject:userName];
}
#pragma -mark 判断手机号码
+(BOOL)isValidatePhone:(NSString *)phone
{
    NSString *Regex =@"(13[0-9]|14[0-9]|15[0-9]|18[0-9]|17[0-9])\\d{8}";
    NSPredicate *mobileTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Regex];
    return [mobileTest evaluateWithObject:phone];
}
#pragma -mark 判断密码(由数字/大写字母/小写字母/标点符号组成
+(BOOL)isValidatePass:(NSString *)paw{
    if ([paw length] == 0) {
        return NO;
    }
    NSString *regex = @"(?!^[0-9]+$)(?!^[A-z]+$)(?!^[^A-z0-9]+$)^.{8,20}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:paw];
}

#pragma -mark- =================== 字符串 =======================
#pragma -mark 普通字符串转换为十六进制的
+ (NSString *)hexStringFromString:(NSString *)string{
    NSData *myD = [string dataUsingEncoding:NSUTF8StringEncoding];
    Byte *bytes = (Byte *)[myD bytes];
    //下面是Byte 转换为16进制。
    NSString *hexStr=@"";
    for(int i=0;i<[myD length];i++)
        
    {
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff];///16进制数
        
        if([newHexStr length]==1)
            
            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
        
        else
            
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
    }
    return hexStr;
}


#pragma -mark 获得系统时间
+(NSString*)getNowTime{
   
    NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString *  morelocationString=[dateformatter stringFromDate:senddate];
    
    return morelocationString;
}
#pragma -mark 设定时间
+(NSString*)getDate:(NSDate*)date{
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //用[NSDate date]可以获取系统当前时间
    NSString *currentDateStr = [dateFormatter stringFromDate:date];
    //输出格式为：2010-10-27 10:22:13
    
    return currentDateStr;
}
#pragma -mark 获得设备型号
+(NSString *)getCurrentDeviceModel
{
    
    int mib[2];
    size_t len;
    char *machine;
    
    mib[0] = CTL_HW;
    mib[1] = HW_MACHINE;
    sysctl(mib, 2, NULL, &len, NULL, 0);
    machine = malloc(len);
    sysctl(mib, 2, machine, &len, NULL, 0);
    
    NSString *platform = [NSString stringWithCString:machine encoding:NSASCIIStringEncoding];
    free(machine);
    
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G (A1203)";
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G (A1241/A1324)";
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS (A1303/A1325)";
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4 (A1332)";
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4 (A1332)";
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4 (A1349)";
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S (A1387/A1431)";
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5 (A1428)";
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5 (A1429/A1442)";
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c (A1456/A1532)";
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c (A1507/A1516/A1526/A1529)";
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s (A1453/A1533)";
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s (A1457/A1518/A1528/A1530)";
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus (A1522/A1524)";
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6 (A1549/A1586)";
    
    if ([platform isEqualToString:@"iPod1,1"])   return @"iPod Touch 1G (A1213)";
    if ([platform isEqualToString:@"iPod2,1"])   return @"iPod Touch 2G (A1288)";
    if ([platform isEqualToString:@"iPod3,1"])   return @"iPod Touch 3G (A1318)";
    if ([platform isEqualToString:@"iPod4,1"])   return @"iPod Touch 4G (A1367)";
    if ([platform isEqualToString:@"iPod5,1"])   return @"iPod Touch 5G (A1421/A1509)";
    
    if ([platform isEqualToString:@"iPad1,1"])   return @"iPad 1G (A1219/A1337)";
    
    if ([platform isEqualToString:@"iPad2,1"])   return @"iPad 2 (A1395)";
    if ([platform isEqualToString:@"iPad2,2"])   return @"iPad 2 (A1396)";
    if ([platform isEqualToString:@"iPad2,3"])   return @"iPad 2 (A1397)";
    if ([platform isEqualToString:@"iPad2,4"])   return @"iPad 2 (A1395+New Chip)";
    if ([platform isEqualToString:@"iPad2,5"])   return @"iPad Mini 1G (A1432)";
    if ([platform isEqualToString:@"iPad2,6"])   return @"iPad Mini 1G (A1454)";
    if ([platform isEqualToString:@"iPad2,7"])   return @"iPad Mini 1G (A1455)";
    
    if ([platform isEqualToString:@"iPad3,1"])   return @"iPad 3 (A1416)";
    if ([platform isEqualToString:@"iPad3,2"])   return @"iPad 3 (A1403)";
    if ([platform isEqualToString:@"iPad3,3"])   return @"iPad 3 (A1430)";
    if ([platform isEqualToString:@"iPad3,4"])   return @"iPad 4 (A1458)";
    if ([platform isEqualToString:@"iPad3,5"])   return @"iPad 4 (A1459)";
    if ([platform isEqualToString:@"iPad3,6"])   return @"iPad 4 (A1460)";
    
    if ([platform isEqualToString:@"iPad4,1"])   return @"iPad Air (A1474)";
    if ([platform isEqualToString:@"iPad4,2"])   return @"iPad Air (A1475)";
    if ([platform isEqualToString:@"iPad4,3"])   return @"iPad Air (A1476)";
    if ([platform isEqualToString:@"iPad4,4"])   return @"iPad Mini 2G (A1489)";
    if ([platform isEqualToString:@"iPad4,5"])   return @"iPad Mini 2G (A1490)";
    if ([platform isEqualToString:@"iPad4,6"])   return @"iPad Mini 2G (A1491)";
    
    if ([platform isEqualToString:@"i386"])      return @"iPhone Simulator";
    if ([platform isEqualToString:@"x86_64"])    return @"iPhone Simulator";
    
    
    
    
    return platform;
}
#pragma -mark 打印设备信息
+(void)nslogCurrentDevice{
    NSString *platform=[Methods getCurrentDeviceModel];
    UIDevice *device=[UIDevice currentDevice];
    CLog(@"  ");
    CLog(@"======================设备信息======================");
    CLog(@"  ");
    CLog(@"设备所有者的名称----   %@",device.name);
    CLog(@"设备的类别---------   %@",device.model);
    CLog(@"设备的的本地版本----  %@",device.localizedModel);
    CLog(@"设备运行的系统-----    %@",device.systemName);
    CLog(@"当前系统的版本-----    %@",device.systemVersion);
    CLog(@"设备识别码--------    %@",device.identifierForVendor.UUIDString);
    CLog(@"当前设备型号:%@",platform);
    CLog(@"沙盒路径：%@",NSHomeDirectory());
    CLog(@"  ");
    CLog(@"=================================================");
    CLog(@"  ");
}
#pragma -mark 获得程序信息
+(NSString *)programInformation:(NSString*)str{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    //CLog(@"%@",(infoDictionary));
    //  app名称CFBundleDisplayName
    //  app版本CFBundleShortVersionString
    //  app build版本 CFBundleVersion
    NSString *appStr = [infoDictionary objectForKey:str];
    return appStr;
}
+(NSString *)filterHTML:(NSString *)html
{
    NSScanner * scanner = [NSScanner scannerWithString:html];
    NSString * text = nil;
    while([scanner isAtEnd]==NO)
    {
        //找到标签的起始位置
        [scanner scanUpToString:@"<" intoString:nil];
        //找到标签的结束位置
        [scanner scanUpToString:@">" intoString:&text];
        //替换字符
        html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text] withString:@""];
    }
    
    NSString * regEx = @"&nbsp";
    html = [html stringByReplacingOccurrencesOfString:regEx withString:@""];
    return html;
}
#pragma -mark- =================== 清除缓存用到 =======================
#pragma -mark 单个文件的大小
+(long long) fileSizeAtPath:(NSString*) filePath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}
#pragma -mark 遍历文件夹获得文件夹大小，返回多少M
+ (float ) folderSizeAtPath:(NSString*) folderPath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath]) return 0;
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
    NSString* fileName;
    long long folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        folderSize += [Methods fileSizeAtPath:fileAbsolutePath];
    }
    return folderSize/(1024.0*1024.0);
}
#pragma -mark 清除大小
+(float)theCacheSize{
    NSString *cachPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES) objectAtIndex:0];
    return   [Methods folderSizeAtPath:cachPath];
}
#pragma -mark 清除缓存
+(void)clearTheCache{
    //    NSString *homeDir = NSHomeDirectory();
    //    CLog(@"获取Home目录路径%@",homeDir);
    //    // 获取Documents目录路径
    //    NSArray *documents = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //    NSString *docDir = [documents objectAtIndex:0];
    //    CLog(@"获取Documents目录路径%@",docDir);
    //    // 获取Caches目录路径
    //    NSArray *caches = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    //
    //    NSString *cachesDir = [caches objectAtIndex:0];
    //    CLog(@" 获取Caches目录路径%@",cachesDir);
    //    // 获取tmp目录路径
    //    NSString *tmpDir =  NSTemporaryDirectory();
    //    CLog(@" 获取tmp目录路径%@",tmpDir);
    
    //清除缓存
    NSString *cachPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES) objectAtIndex:0];
    CLog(@"缓存文件大小%f",[Methods folderSizeAtPath:cachPath]);
    NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachPath];
    NSLog(@"缓存文件个数 :%lu",(unsigned long)[files count]);
    for (NSString *p in files) {
        NSError *error;
        NSString *path = [cachPath stringByAppendingPathComponent:p];
        if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
            [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
            
        }
    }
    
    
}
#pragma -mark 查看
+(void)takeInform{
    //    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"plistdemo" ofType:@"plist"];
    //    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    //    NSLog(@"%@", data);
    //
    //    //添加一项内容
    //    [data setObject:@"add some content" forKey:@"c_key"];
    
    //获取应用程序沙盒的Documents目录
    //    NSArray *paths=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES)lastObject];
    
    
    //得到完整的文件名
    NSString *filename=@"/Users/xjkj/Desktop/face.plist";
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]initWithCapacity:100];
    
    for (int i=1; i<86; i++)
    {
        NSString *str=[NSString stringWithFormat:@"%d",i];
        if (str.length==1)
        {
            str=[NSString stringWithFormat:@"00%d",i];
        }else
        {
            str=[NSString stringWithFormat:@"0%d",i];
        }
        
        
        NSString *value=[NSString stringWithFormat:@"<%@>",str];
        
        
        
        [dic setObject:str forKey:value];
        
    }
    //输入写入
    [dic writeToFile:filename atomically:YES];
    
    
    //那怎么证明我的数据写入了呢？读出来看看
    NSMutableDictionary *data1 = [[NSMutableDictionary alloc] initWithContentsOfFile:filename];
    NSLog(@"%@", data1);
    
    
}

#pragma -mark- =================== UI弹出框 =======================
#pragma -mark -----showMBProgress 无图片

+(void)showMBProgressfiul:(NSString*)str{
    
    MBProgressHUD  *hud           = [[MBProgressHUD alloc] init];
    hud.color=(__bridge UIColor *)([UIColor grayColor].CGColor);
    hud.removeFromSuperViewOnHide = YES;
    [[UIApplication sharedApplication].keyWindow addSubview:hud];
    hud.mode                      = MBProgressHUDModeText;
    hud.labelColor=BaseColor;
    hud.labelText                 = @"提示";
    hud.detailsLabelText          = str;
    
    [hud show:YES];
    [hud hide:YES afterDelay:2];
}
#pragma -mark -----showMBProgress 带图片
+(void)showMBProgressHint:(NSString*)str{
    
    MBProgressHUD  *hud           = [[MBProgressHUD alloc] init];
    hud.color=(__bridge UIColor *)([UIColor grayColor].CGColor);
    hud.removeFromSuperViewOnHide = YES;
    [[UIApplication sharedApplication].keyWindow addSubview:hud];
    UIImage *markImage            = [UIImage imageNamed:@"icon_sccg.png"];
    UIImageView *imageV           =[[UIImageView alloc] initWithImage:markImage];
    imageV.frame                  =CGRectMake(0, 0, 55, 55);
    hud.customView                =imageV;
    hud.mode                      = MBProgressHUDModeCustomView;
    hud.labelColor=BaseColor;
    hud.labelText                 = str;
    [hud show:YES];
    [hud hide:YES afterDelay:1.5];
}
#pragma -mark showMBProgress
+(void)showMBProgress:(NSString*)str withView:(UIView*)view{
    
    
    [self dismissMBProgressWithView:view];
    
    MBProgressHUD *hud =[[MBProgressHUD alloc] init];
    hud.color =(__bridge UIColor *)([UIColor clearColor].CGColor);
    UIImageView *imageV =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 88, 88)];
    NSArray *aa=@[QuickImage(@"zhen1"),QuickImage(@"zhen2")];
    imageV.contentMode=UIViewContentModeCenter;
    imageV.animationImages=[NSArray arrayWithArray:aa];
    [imageV startAnimating];
    hud.customView                =imageV;
    hud.mode                      = MBProgressHUDModeCustomView;
    [view addSubview:hud];
    hud.labelColor=BaseColor;
    hud.labelText = str;
    hud.dimBackground=YES;
    [hud show:YES];
}
#pragma -mark MBProgressHUD dismiss
+(void)dismissMBProgressWithView:(UIView*)view{
    
    UIView *viewToRemove = nil;
    for (UIView *v in [view subviews])
    {
        if ([v isKindOfClass:[MBProgressHUD class]])
        {
            viewToRemove = v;
            [viewToRemove removeFromSuperview];
        }
    }
    if (viewToRemove != nil)
    {
        MBProgressHUD *HUD = (MBProgressHUD *)viewToRemove;
        
        [HUD hide:YES];
        [HUD removeFromSuperViewOnHide];
        HUD = nil;
    }
    
}
#pragma -mark  自动消失的全屏提示
+(void)showOverlay:(NSString*)str
Options:(TAOverlayOptions)newOptions{
    
    TAOverlayOptions option;
    option=(TAOverlayOptionAutoHide | newOptions|
            TAOverlayOptionOverlaySizeFullScreen| TAOverlayOptionOverlayDismissTap);
    
    //如果需要Item
    [TAOverlay showOverlayWithLabel:str  Options:option];
    
}
#pragma -mark 提示框1
+(void)alertViewWithTitle:(NSString*)title
contentText:(NSString*)contStr
leftButtonTitle:(NSString*)leftstr//nil--0
rightButtonTitle:(NSString*)rightstr//@"sure"--1
finish:(void (^)(NSInteger index))block
{
    UIAlertView *alert;
    alert = [[UIAlertView alloc]initWithTitle:title message:contStr delegate:nil cancelButtonTitle:leftstr otherButtonTitles:rightstr, nil];
    [alert showAlertViewWithCompleteBlock:^(NSInteger buttonIndex) {
        if (block) {
            block(buttonIndex);
        }
    }];
    
}
#pragma -mark 提示框2
+(void)sheetWithTitle:(NSString*)title
oneText:(NSString*)oneText//0
twoText:(NSString*)twoText//1
finish:(void (^)(NSInteger index))block{
    UIActionSheet *sheet;
    sheet=[[UIActionSheet alloc]initWithTitle:title
                                     delegate:nil
                            cancelButtonTitle:@"取消"
                       destructiveButtonTitle:nil
                            otherButtonTitles:oneText,twoText, nil];
    [sheet showActionSheetWithCompleteBlock:^(NSInteger buttonIndex) {
        
        if (block) {
            block(buttonIndex);
        }
    }];
}
#pragma -mark- =================== 图片处理 =======================
#pragma -mark 快速图片拉伸
+(UIImage*)imageName:(NSString*)name
WithCapInsets:(UIEdgeInsets)capInsets
resizingMode:(UIImageResizingMode)resizingMode{
    
    UIImage *image=[[UIImage imageNamed:name]
                    resizableImageWithCapInsets:capInsets
                    resizingMode:resizingMode];
    
    return image;
}
#pragma -mark 颜色图片
+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
#pragma -mark  测试图片
+(NSString *)getImageUrl{
    NSString *str;
    switch (arc4random()%5) {
        case 0:
        {
            str=@"http://b.hiphotos.baidu.com/image/pic/item/e1fe9925bc315c60d5b2e9c08eb1cb13495477fe.jpg";
        }
            break;
        case 1:
        {
            str=@"http://a.hiphotos.baidu.com/image/w%3D230/sign=c5dcc03d38f33a879e6d0719f65d1018/4ec2d5628535e5ddf7f4e6d274c6a7efcf1b62e6.jpg";
        }
            break;
        case 2:
        {
            str=@"http://d.hiphotos.baidu.com/image/w%3D230/sign=25cace6ad309b3deebbfe36bfcbe6cd3/d788d43f8794a4c20e9a8e290cf41bd5ad6e3972.jpg";
        }
            break;
        case 3:
        {
            str=@"http://c.hiphotos.baidu.com/image/w%3D230/sign=d547b2f8b78f8c54e3d3c22c0a292dee/c8177f3e6709c93d0ad97ae19c3df8dcd10054f8.jpg";
        }
            break;
        case 4:
        {
            str=@"http://e.hiphotos.baidu.com/image/w%3D230/sign=583dd10594dda144da096bb182b6d009/95eef01f3a292df5b414d903bf315c6035a873d4.jpg";
        }
            break;
        default:
            break;
    }
    
    
    return str;
}

#pragma -mark- =================== UILabel处理 =======================
#pragma -mark 下划线
+(NSMutableAttributedString*)getLineLabel:(NSString*)str {
    NSUInteger length = [str length];
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:str];
    [attri addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, length)];
    [attri addAttribute:NSStrikethroughColorAttributeName value:[UIColor colorWithRed:158/255.0 green:158/255.0 blue:158/255.0 alpha:1] range:NSMakeRange(0, length)];
    return attri;
    
}
#pragma mark 计算Label大小
+(CGFloat)getSize:(NSString*)str maxW:(int)maxw AndFont:(int)fontSize{
    
    NSDictionary *dic=@{NSFontAttributeName:QuickFont(fontSize) };
    NSStringDrawingOptions option=NSStringDrawingTruncatesLastVisibleLine| NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGFloat height= [str boundingRectWithSize:CGSizeMake(maxw, 10000)
                                      options: option
                                   attributes:dic
                                      context:nil].size.height;
    //CLog(@"%f",height);
    return height;
}
+(NSString *)signatureWithMd5:(NSDictionary *)dic andHost:(NSString *)host
{
    NSMutableDictionary *dd=[[NSMutableDictionary alloc]initWithDictionary:dic];
    NSArray    *aa = [host componentsSeparatedByString:@"/"];
    [dd setObject:[aa objectAtIndex:0] forKey:@"m"];
    [dd setObject:[aa objectAtIndex:1] forKey:@"a"];
    
    NSString *urlString=[[NSString alloc]init];
    NSMutableDictionary *mutableParameters=[NSMutableDictionary dictionary];
    NSArray *arr=[dd allKeys];
    NSMutableArray *mutableArray=[[NSMutableArray alloc]initWithArray:arr];
    
    [mutableArray sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    for ( int i=0;i<mutableArray.count; i++ ) {
        NSString *string=[mutableArray objectAtIndex:i];
        [mutableParameters setObject:[dd objectForKey:string] forKey:string];
        NSString *aa=[NSString stringWithFormat:@"%@=%@",string,[dd objectForKey:string]];
        if ([urlString isEqualToString:@""]) {
            urlString=aa;
        }else{
            urlString =[NSString stringWithFormat:@"%@&%@",urlString,aa];
        }
        if(i==mutableArray.count-1){
            
            urlString =[NSString stringWithFormat:@"%@%@",urlString,AppKey];
        }
    }
    
    NSString *bb=[self md5Digest:urlString];
    return  bb;
}

// 根据iphone6 适配iphone5 和iphone6plus

+(CGFloat )formatSpaceFromIphone6:(CGFloat )space
{
    if ([[UIScreen mainScreen] bounds].size.width==375) {// iphone6
        return space;
        
    }else{//iphone 5 和 6+
        
        CGFloat w1=[[UIScreen mainScreen] bounds].size.width;
        CGFloat w2=375;
        return space * w1/w2;
    }
}



// 根据iphone5 适配iphone6 和iphone6plus
+(CGRect )formatCGRectFromIphone5:(CGRect )rect
{
    if ([[UIScreen mainScreen] bounds].size.width==320) {// iphone4 和iphone5
        return rect;
        
    }else{//iphone 6 和 6+
        
        //按照 320*568 的原始比例来 适配出 375*667（750*1334）  和414*736    621*1104（1242*2208）的点位置
       
        CGFloat w1=[[UIScreen mainScreen] bounds].size.width;
        CGFloat w2=320.;
        
        CGFloat h1=[[UIScreen mainScreen] bounds].size.height;
        CGFloat h2=568.;
        
        CGRect iphone6Rect=CGRectMake(rect.origin.x*w1/w2, rect.origin.y*h1/h2, rect.size.width*w1/w2, rect.size.height*h1/h2);
        return iphone6Rect;
    }
    
}
+(CGSize )formatCGSizeFromIphone5:(CGSize)size
{
    if ([[UIScreen mainScreen] bounds].size.width==320) {// iphone4 和iphone5
        return size;
        
    }else{//iphone 6 和 6+
        
        //按照 320*568 的原始比例来 适配出 375*667（750*1334）  和 414*736   621*1104（1242*2208）的点位置
    
        CGFloat w1=[[UIScreen mainScreen] bounds].size.width;
        CGFloat w2=320.;
        
        CGFloat h1=[[UIScreen mainScreen] bounds].size.height;
        CGFloat h2=568.;
        
        CGSize iphone6Size=CGSizeMake(size.width*w1/w2,size.height*h1/h2);
        return iphone6Size;
    }
    
}
+(CGFloat )formatHEIGHTFromIphone5:(CGFloat )space
{
    if ([[UIScreen mainScreen] bounds].size.width==320) {// iphone4 和iphone5
        return space;
        
    }else{//iphone 6 和 6+
        
        //按照 320*568 的原始比例来 适配出 375*667（750*1334）  和414*736   621*1104（1242*2208）的点位置
       
        
        CGFloat w1=[[UIScreen mainScreen] bounds].size.width;
        CGFloat w2=320.;
        
        return space*w1/w2;
    }
}
#pragma -mark-  ==================系统 名称 版本==================
//app 名称
+(NSString *)getApplicationName
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
}
//app 版本
+ (NSString *)getApplicationVersion
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

//app build版本
+ (NSString *)getApplicationBuildVersion
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

#pragma -mark- ==========================================

+(UIColor *)cutomThemColor
{
    
//    if([[NSUserDefaults standardUserDefaults] objectForKey:DF_customThemeColor_KEY])
//    {
//        NSString *str=[[NSUserDefaults standardUserDefaults] objectForKey:DF_customThemeColor_KEY];
//        return [UIColor colorWithHexString:str];
//    }
    
    return UICOLOR_RGB(82, 198, 117);
}

@end
