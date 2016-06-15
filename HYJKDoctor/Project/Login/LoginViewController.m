//
//  LoginViewController.m
//  HYJKDoctor
//
//  Created by wenzhizheng on 16/6/9.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import "LoginViewController.h"
#import "AFManager.h"
#import "TelTools.h"

@interface LoginViewController ()

@property (nonatomic,strong) UITextField *accountField;
@property (nonatomic,strong) UITextField *passwordField;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.title = @"登录";
    
    UIImageView *logoImageView = [[UIImageView alloc] init];
    logoImageView.image = [UIImage imageNamed:@"login_icon"];
    [self.view addSubview:logoImageView];
    [logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.width.equalTo(@(self.view.width / 4));
        make.height.equalTo(@(self.view.width / 4 * 1.4));
        make.top.equalTo(@(self.view.width / 4));
    }];
    
    UITextField *accountField = [[UITextField alloc] init];
    accountField.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:accountField];
    [accountField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.top.equalTo(logoImageView.mas_bottom).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(@(50));
    }];
    accountField.placeholder = @"电子邮箱/手机";
    self.accountField = accountField;
    
    
    UITextField *passwordField = [[UITextField alloc] init];
    passwordField.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:passwordField];
    [passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.top.equalTo(accountField.mas_bottom).offset(1);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(@(50));
    }];
    passwordField.placeholder = @"密码";
    passwordField.secureTextEntry = YES;
    self.passwordField = passwordField;
    
    accountField.leftViewMode = UITextFieldViewModeAlways;
    passwordField.leftViewMode = UITextFieldViewModeAlways;
    accountField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 50)];
    passwordField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 50)];
    
    UIButton *forgetBtn = [[UIButton alloc] init];
    [self.view addSubview:forgetBtn];
    [forgetBtn setTitle:@"忘记密码,点击拨打客户电话" forState:UIControlStateNormal];
    [forgetBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    forgetBtn.titleLabel.font = fontWithSize(12);
    forgetBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    [forgetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(forgetBtn.titleLabel.font.pointSize * forgetBtn.titleLabel.text.length));
        make.right.equalTo(passwordField);
        make.top.equalTo(passwordField.mas_bottom);
        make.height.equalTo(@(30));
    }];
    [forgetBtn addTarget:self action:@selector(forgetPassword) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *loginBtn = [[UIButton alloc] init];
    [self.view addSubview:loginBtn];
    loginBtn.backgroundColor = CustomThemeColor;
    [loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(passwordField);
        make.right.equalTo(passwordField);
        make.top.equalTo(forgetBtn.mas_bottom);
        make.height.equalTo(@(40));
    }];
    [loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
}

- (void)forgetPassword
{
    [TelTools callNumber:@"10086" inView:self.view];
}
- (void)login
{
    if (self.accountField.text.length  < 1) {
        [Methods showToast:@"请输入手机号" inSuperview:self.view];
        return;
    }
    
    if (self.passwordField.text.length  < 1) {
        [Methods showToast:@"请输入密码" inSuperview:self.view];
        return;
    }
    
    // 登陆
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [AFManager postWithPath:@"/doctor/signin" params:@{@"name":self.accountField.text,@"password":self.passwordField.text} succeed:^(NSDictionary *responsedict) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        if ([AFManager isRequsetSucceed:responsedict]) {
            Account *account = [[Account alloc] init];
            account.name = self.accountField.text;
            account.password = self.passwordField.text;
            account.session = responsedict[@"data"][@"session"];
            [account save];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    } failed:^(NSError *error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
}



@end
