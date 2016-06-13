//
//  LoginAndRegisterController.m
//  HYJKDoctor
//
//  Created by wenzhizheng on 16/6/1.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import "LoginAndRegisterController.h"
#import "Account.h"

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
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [AFManager postWithPath:@"/doctor/signin" params:@{@"name":@"18288888888",@"password":@"18288888888"} succeed:^(NSDictionary *responsedict) {
        Account *account = [[Account alloc] init];
        account.name = @"18288888888";
        account.password = @"18288888888";
        account.session = responsedict[@"data"][@"session"];
        [account save];
        [self dismissViewControllerAnimated:YES completion:nil];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    } failed:^(NSError *error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
    
}

@end
