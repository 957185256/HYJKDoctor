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
#import "UIAlertController+extend.h"
#import "LoginViewController.h"
#import "ChangePassController.h"


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
    item.option = ^{
        UIViewController *controller = [[UIViewController alloc] init];
        UITextView *textView = [[UITextView alloc] initWithFrame:controller.view.bounds];
        [controller.view addSubview:textView];
        textView.text = @"1.现行法律缺乏认定互联网医疗行为责任的机制，发生医疗事故后，是互联网平台，还是平台预约医生或医疗机构承担责任都没有明确的法律规定。因此，应在平台的显著位置声明免责条款如下：“弘医健康管理平台为医患交流、对接渠道，医生在医疗机构之外仅提供健康咨询服务，医生基于患者自述病情所提供的建议仅供参考，不能作为诊断和治疗的直接依据；患者在医疗机构就诊产生的问题和纠纷，本平台不承担责任。”\n2.在平台运营过程中，应明确平台仅提供健康咨询、导诊和医患对接服务，严禁出现诊断治疗等类似的字眼。在平台宣传、推广过程中，根据《医疗广告管理办法》第5条规定：“非医疗机构不得发布医疗广告”，应避免使用使人产生平台直接提供医疗服务的误解。";
        controller.title = @"免责条款";
        textView.font = fontWithSize(15);
        [self.navigationController pushViewController:controller animated:YES];

    };
    
    MJSettingItem *item1 = [MJSettingArrowItem itemWithIcon:nil title:@"医生协议" destVcClass:nil];
    item1.option = ^{
        UIViewController *controller = [[UIViewController alloc] init];
        UITextView *textView = [[UITextView alloc] initWithFrame:controller.view.bounds];
        [controller.view addSubview:textView];
        textView.text = @"医生协议医生协议医生协议医生协议医生协议医生协议医生协议医生协议医生协议医生协议医生协议医生协议医生协议医生协议医生协议医生协议医生协议医生协议医生协议医生协议医生协议医生协议医生协议医生协议医生协议医生协议医生协议医生协议医生协议医生协议医生协议医生协议医生协议医生协议医生协议医生协议医生协议医生协议医生协议医生协议医生协议医生协议医生协议";
        controller.title = @"医生协议";
        textView.font = fontWithSize(15);
        [self.navigationController pushViewController:controller animated:YES];
    };
    
    
    MJSettingItem *item2 = [MJSettingArrowItem itemWithIcon:nil title:@"关于宏医健康" destVcClass:nil];
    MJSettingItem *item3 = [MJSettingArrowItem itemWithIcon:nil title:@"去评分" destVcClass:nil];
    MJSettingItem *item4 = [MJSettingArrowItem itemWithIcon:nil title:@"修改密码" destVcClass:nil];
    item4.option = ^{
        [self.navigationController pushViewController:[[ChangePassController alloc] init] animated:YES];
    };



    
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
        [UIAlertController alertWithtitle:@"确定要退出吗?" inController:self handler:^{
            [Account quit];
            [self presentViewController:[[LoginViewController alloc] init] animated:YES completion:^{
                [self.navigationController popToRootViewControllerAnimated:NO];
            }];
        }];

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
