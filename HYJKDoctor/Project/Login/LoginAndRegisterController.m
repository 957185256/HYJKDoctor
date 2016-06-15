//
//  LoginAndRegisterController.m
//  HYJKDoctor
//
//  Created by wenzhizheng on 16/6/1.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import "LoginAndRegisterController.h"
#import "AFManager.h"
#import "Account.h"
#import "LoginViewController.h"
#import "RegisterViewController.h"

@implementation LoginAndRegisterController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView *backImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    backImageView.contentMode = UIViewContentModeScaleAspectFit;
    backImageView.image = [UIImage imageNamed:@"login_back_image"];
    [self.view addSubview:backImageView];
    
    UIImageView *logoImageView = [[UIImageView alloc] init];
    logoImageView.image = [UIImage imageNamed:@"login_logo"];
    [self.view addSubview:logoImageView];
    [logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.width.equalTo(@(self.view.width / 4));
        make.height.equalTo(@(self.view.width / 4 * 1.35));
        make.top.equalTo(@(self.view.width / 4));
    }];
    
    UIButton *registerBtn = [[UIButton alloc] init];
    registerBtn.layer.cornerRadius = 2;
    registerBtn.clipsToBounds = YES;
    registerBtn.backgroundColor = CustomThemeColor;
    [registerBtn setTitle:@"申请入驻" forState:UIControlStateNormal];
    [self.view addSubview:registerBtn];
    [registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.top.equalTo(self.view.mas_bottom).offset(-100);
        make.height.equalTo(@(40));
    }];
    [registerBtn addTarget:self action:@selector(registerBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    UIButton *lgoinBtn = [[UIButton alloc] init];
    lgoinBtn.backgroundColor = RGB(132, 212, 180, 0.7);
    lgoinBtn.layer.cornerRadius = 2;
    lgoinBtn.clipsToBounds = YES;
    [lgoinBtn setTitle:@"登陆" forState:UIControlStateNormal];
    [self.view addSubview:lgoinBtn];
    [lgoinBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.top.equalTo(registerBtn.mas_bottom).offset(10);
        make.height.equalTo(@(40));
    }];
    [lgoinBtn addTarget:self action:@selector(lgoinBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES];

}

- (void)registerBtnClick
{
    RegisterViewController *controller = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}
- (void)lgoinBtnClick
{
    LoginViewController *controller = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
