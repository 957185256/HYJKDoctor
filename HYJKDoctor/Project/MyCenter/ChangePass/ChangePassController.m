//
//  ChangePassController.m
//  HYJKDoctor
//
//  Created by wenzhizheng on 16/6/21.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import "ChangePassController.h"

@interface ChangePassController ()

@property (nonatomic,weak) UITextField *oldPassField;
@property (nonatomic,weak) UITextField *theNewPassField;
@property (nonatomic,weak) UITextField *confirmPassField;

@end

@implementation ChangePassController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"修改密码";
    
    UITextField *oldPassField = [[UITextField alloc] initWithFrame:CGRectMake(10, 64, self.view.width - 20, 40)];
    self.oldPassField = oldPassField;
    oldPassField.secureTextEntry = YES;
    oldPassField.placeholder = @"请输入旧密码";
    [self.view addSubview:oldPassField];
    
    
    
    UITextField *newPassField = [[UITextField alloc] initWithFrame:CGRectMake(10, oldPassField.bottom, self.view.width - 20, 40)];
    self.theNewPassField = newPassField;
    newPassField.secureTextEntry = YES;
    newPassField.placeholder = @"请输入6-12位新密码";
    [self.view addSubview:newPassField];
    
    
    
    UITextField *confirmPassField = [[UITextField alloc] initWithFrame:CGRectMake(10, newPassField.bottom, self.view.width - 20, 40)];
    self.confirmPassField = confirmPassField;
    confirmPassField.secureTextEntry = YES;
    confirmPassField.placeholder = @"请确认新密码";
    [self.view addSubview:confirmPassField];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10, confirmPassField.bottom, self.view.width - 20, 40)];
    [self.view addSubview:btn];
    [btn setTitle:@"确认修改" forState:UIControlStateNormal];
    btn.backgroundColor = CustomThemeColor;
    [btn addTarget:self action:@selector(changePass) forControlEvents:UIControlEventTouchUpInside];
}

- (void)changePass
{
    if (self.oldPassField.text.length < 1) {
        [Methods showToast:@"请输入旧密码" inSuperview:self.view];
        return;
    }
    
    if (self.theNewPassField.text.length < 6 || self.theNewPassField.text.length > 12) {
        [Methods showToast:@"请输入6-12位新密码" inSuperview:self.view];
        return;
    }
    
    if (![self.theNewPassField.text isEqualToString:self.confirmPassField.text]) {
        [Methods showToast:@"俩次输入密码不一致" inSuperview:self.view];
        return;
    }
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [AFManager postWithPath:@"/doctor/editdoctor"
                     params:@{@"doctor_id":[Account getAccount].doctor_id,
                              @"editdoctor":@{@"oldpassword":self.oldPassField.text,
                                              @"newpassword":self.theNewPassField.text,
                                              @"repassword":self.confirmPassField.text}} succeed:^(NSDictionary *responsedict) {
                                                  [MBProgressHUD hideHUDForView:self.view animated:YES];
                                                  if ([AFManager isRequsetSucceed:responsedict]) {
                                                      [Methods showToast:@"修改成功" inSuperview:[UIApplication sharedApplication].keyWindow];
                                                      [self.navigationController popViewControllerAnimated:YES];
                                                  }
                                              } failed:^(NSError *error) {
                                                  [MBProgressHUD hideHUDForView:self.view animated:YES];
                                              }];
}

@end
