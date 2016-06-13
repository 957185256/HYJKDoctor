//
//  UISetUp.m
//  ICome
//
//  Created by xjkj on 15/2/5.
//  Copyright (c) 2015年 xjkj. All rights reserved.
//

#import "UISetUp.h"
#import "UIImage+Color.h"
#import "Methods.h"
@implementation UISetUp
#pragma mark- =======================默认设置=======================
+(void)defaultNav{
    //导航栏
    [UIApplication sharedApplication].statusBarHidden = NO;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    [[UINavigationBar appearance] setBarTintColor:BaseColor];//导航背景颜色
    [[UINavigationBar appearance] setTintColor:RGB(0, 0, 0, 1)];//导航按钮文字颜色
    
    
    NSDictionary *dic=@{NSForegroundColorAttributeName : [UIColor blackColor],
                        NSFontAttributeName:QuickFont(20)};
    //中间文字颜色
    [[UINavigationBar appearance]setTitleTextAttributes:dic];
    
    //导航图片背景
    //UIImage *bgImage=[[UIImage imageNamed:@"tabbar_background_os7.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    //[[UINavigationBar appearance] setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
    
    //全局 设置 tintColor
    [[UITextField appearance] setTintColor:[UIColor blackColor]];
    [[UITextView appearance] setTintColor:[UIColor blackColor]];
    [[UIAlertView appearance]setTintColor:[UIColor blackColor]];
    [[UIActionSheet appearance]setTintColor:[UIColor blackColor]];
}
#pragma mark- =======================底色导航栏=======================
+(void)setUpNavHome:(UIViewController*)vc{
    vc.navigationController.navigationBar.barTintColor=RGB(255, 255, 255, 1);
    vc.navigationController.navigationBar.tintColor=RGB(0, 0, 0, 1);
    NSDictionary *textAttributes=@{NSForegroundColorAttributeName :RGB(0, 0, 0, 1),
                                   NSFontAttributeName:QuickFont(18)};
    vc.navigationController.navigationBar.titleTextAttributes=textAttributes;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    UIImage *image = [Methods imageWithColor:BaseColor];
    
    
    if ([[UINavigationBar class] respondsToSelector:@selector(appearance)]) {
        [vc.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    }
    
    if ([vc.navigationController.navigationBar respondsToSelector:@selector(shadowImage)]) {
        [vc.navigationController.navigationBar setShadowImage:[UIImage imageWithColor:[UIColor clearColor]]];
    }
    
}
#pragma mark- =======================白色导航栏=======================
+(void)setUpNavWrite:(UIViewController*)vc{
    
    vc.navigationController.navigationBar.barTintColor=RGB(255, 255, 255, 1);
    vc.navigationController.navigationBar.tintColor=RGB(0, 0, 0, 1);
    NSDictionary *textAttributes=@{NSForegroundColorAttributeName :RGB(0, 0, 0, 1),
                                   NSFontAttributeName:QuickFont(18)};
    vc.navigationController.navigationBar.titleTextAttributes=textAttributes;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
    UIImage *image=[Methods imageWithColor:RGB(255, 255, 255, 1)];
    
    
    if ([[UINavigationBar class] respondsToSelector:@selector(appearance)]) {
        [vc.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    }
    
    if ([vc.navigationController.navigationBar respondsToSelector:@selector(shadowImage)]) {
        [vc.navigationController.navigationBar setShadowImage:[UIImage imageWithColor:RGB(210, 210, 210, 1)]];
    }
    
}
#pragma mark- =======================底色导航栏=======================
+(void)setUpNavBase:(UIViewController*)vc{
    
    vc.navigationController.navigationBar.barTintColor=BaseColor;
    vc.navigationController.navigationBar.tintColor=RGB(255, 255, 255, 1);
    NSDictionary *textAttributes=@{NSForegroundColorAttributeName :RGB(0, 0, 0, 1),
                                   NSFontAttributeName:QuickFont(18)};
    vc.navigationController.navigationBar.titleTextAttributes=textAttributes;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
    UIImage *image=[Methods imageWithColor:BaseColor];
    if ([[UINavigationBar class] respondsToSelector:@selector(appearance)]) {
        [vc.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    }
    
    if ([vc.navigationController.navigationBar respondsToSelector:@selector(shadowImage)]) {
        [vc.navigationController.navigationBar setShadowImage:image];
    }
}

+(void)setUpNavTransparent:(UIViewController*)vc andAlpha:(float)alpha{
    
    vc.navigationController.navigationBar.barTintColor=RGB(255, 255, 255, 1);
    vc.navigationController.navigationBar.tintColor=RGB(255, 255, 255, 1);
    NSDictionary *textAttributes=@{NSForegroundColorAttributeName :RGB(255, 255, 255, 1),
                                   NSFontAttributeName:QuickFont(18)};
    vc.navigationController.navigationBar.titleTextAttributes=textAttributes;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
    
    UIImage *image=[UIImage imageWithColor:RGB(255,207,0,alpha)];
    
    
    if ([[UINavigationBar class] respondsToSelector:@selector(appearance)]) {
        [vc.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    }
    
    if ([vc.navigationController.navigationBar respondsToSelector:@selector(shadowImage)]) {
        [vc.navigationController.navigationBar setShadowImage:image];
    }
}
+(void)setUpNavTransparent:(UIViewController*)vc{
    
    vc.navigationController.navigationBar.barTintColor=RGB(255, 255, 255, 1);
    vc.navigationController.navigationBar.tintColor=BaseColor;
    NSDictionary *textAttributes=@{NSForegroundColorAttributeName :RGB(255, 255, 255, 1),
                                   NSFontAttributeName:QuickFont(18)};
    vc.navigationController.navigationBar.titleTextAttributes=textAttributes;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
    UIImage *image=[Methods imageWithColor:RGB(255, 255, 255, 0)];
    
    
    if ([[UINavigationBar class] respondsToSelector:@selector(appearance)]) {
        [vc.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    }
    
    if ([vc.navigationController.navigationBar respondsToSelector:@selector(shadowImage)]) {
        [vc.navigationController.navigationBar setShadowImage:image];
    }
    
}
#pragma mark- =======================航栏=======================
+(void)setUpPersonal:(UIViewController*)vc{
    
    vc.navigationController.navigationBar.barTintColor=RGB(255, 255, 255, 1);
    vc.navigationController.navigationBar.tintColor=RGB(0, 0, 0, 1);
    NSDictionary *textAttributes=@{NSForegroundColorAttributeName :RGB(0, 0, 0, 1),
                                   NSFontAttributeName:QuickFont(18)};
    vc.navigationController.navigationBar.titleTextAttributes=textAttributes;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
    UIImage *image=QuickImage(@"dengru_bg");
    
    
    if ([[UINavigationBar class] respondsToSelector:@selector(appearance)]) {
        [vc.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    }
    
    if ([vc.navigationController.navigationBar respondsToSelector:@selector(shadowImage)]) {
        [vc.navigationController.navigationBar setShadowImage:[UIImage imageWithColor:[UIColor clearColor]]];
    }
    
}

@end
