//
//  SystemSetVC.m
//  HYJKDoctor
//
//  Created by sqz on 16/5/28.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import "SystemSetVC.h"
#import "MJSettingArrowItem.h"
#import "MJSettingSwitchItem.h"
#import "MJSettingLabelItem.h"
#import "MJSettingGroup.h"
#import "MJSettingLogoutItem.h"
@interface SystemSetVC ()

@end

@implementation SystemSetVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = GRAY_COLOR_BG;
    [self.tableView clearDefaultLineByAddFootLineWithLineColor:CLEAR_COLOR];
    
    [self setupGroup0];
    [self setupGroup1];
}

- (void)setupGroup0
{
    
    MJSettingItem *item = [MJSettingArrowItem itemWithIcon:nil title:@"免费条款" destVcClass:nil];
//    help.option = ^{
//
//    };
    
    MJSettingItem *item1 = [MJSettingArrowItem itemWithIcon:nil title:@"医生协议" destVcClass:nil];
    MJSettingItem *item2 = [MJSettingArrowItem itemWithIcon:nil title:@"关于宏医健康" destVcClass:nil];
    MJSettingItem *item3 = [MJSettingArrowItem itemWithIcon:nil title:@"去评分" destVcClass:nil];
    MJSettingItem *item4 = [MJSettingArrowItem itemWithIcon:nil title:@"修改密码" destVcClass:nil];



    
    MJSettingGroup *group = [[MJSettingGroup alloc] init];
    group.items = @[item,item1,item2,item3,item4];
    //    group.header=@"常规设置";
    [self.data addObject:group];
    
}

- (void)setupGroup1
{
    
    
    MJSettingItem *logoutItem = [MJSettingLogoutItem itemWithTitle:nil];
    logoutItem.option = ^
    {
        NSLog(@"退出登录");
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"确定要退出登录吗？" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定退出", nil];
        alert.tag = 1000;
        [alert show];
    };
    
    MJSettingGroup *group = [[MJSettingGroup alloc] init];
    group.items = @[logoutItem];
    group.header=@"";
    [self.data addObject:group];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
