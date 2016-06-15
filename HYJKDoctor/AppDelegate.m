//
//  AppDelegate.m
//  HYJKDoctor
//
//  Created by sqz on 16/5/26.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import "AppDelegate.h"

#import "Account.h"
#import "LoginAndRegisterController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = NO;//这个属性要是设置为YES的话则会影响UIAlertView接受事件
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    if (IOSV_OR_LATER(8)) {
        manager.enableAutoToolbar = YES;//是否显示键盘工具栏
    }else{
        manager.enableAutoToolbar = NO;//是否显示键盘工具栏(ios7以下会报错设置no不会)
    }
    
    self.rootTab=[[RootTabBarVC alloc]init];
    [UIApplication sharedApplication].keyWindow.rootViewController = appDelegate.rootTab;
    
    //   如果本地获取不到账户信息 来到注册登录界面
    Account *account = [Account getAccount];
    if (!account) {
        LoginAndRegisterController *controller = [[LoginAndRegisterController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] init];
        [nav pushViewController:controller animated:NO];
        [self.rootTab presentViewController:nav animated:YES completion:nil];
    }
    

    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
