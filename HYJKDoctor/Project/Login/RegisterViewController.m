//
//  RegisterViewController.m
//  HYJKDoctor
//
//  Created by wenzhizheng on 16/6/9.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import "RegisterViewController.h"
#import "UIAlertController+extend.h"
#import "PhotoTools.h"
#import "AFManager.h"

@interface RegisterViewController () <UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic,strong) NSArray *titleArray;


@property (nonatomic,strong) UIImage *photo;   // 头像
@property (nonatomic,strong) UIImage *license;   // 执照
@property (nonatomic,strong) NSString *fullname;   // 姓名
@property (nonatomic,strong) NSString *hospital;   // 医院
@property (nonatomic,strong) NSString *department;   // 科室
@property (nonatomic,strong) NSString *idcard;   // 身份证
@property (nonatomic,strong) NSString *mobile;   // 手机
@property (nonatomic,strong) NSString *yzm;   // 验证码
@property (nonatomic,strong) NSString *setpass;   // 密码

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"申请入驻";
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height - 50)];
    tableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    tableView.dataSource = self;
    tableView.delegate = self;
    
    
    UIButton *submitBtn = [[UIButton alloc] init];
    [self.view addSubview:submitBtn];
    [submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.top.equalTo(self.view.mas_bottom).offset(- 50);
        make.height.equalTo(@(40));
    }];
    submitBtn.backgroundColor = CustomThemeColor;
    [submitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [submitBtn addTarget:self action:@selector(submitBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)submitBtnClick
{
    if (!self.photo) {
        [Methods showToast:@"请选择头像" inSuperview:self.view];
        return;
    }
    if (self.fullname.length < 1) {
        [Methods showToast:@"填写姓名" inSuperview:self.view];
        return;
    }
    if (self.hospital.length < 1) {
        [Methods showToast:@"请填写医院" inSuperview:self.view];
        return;
    }
    if (self.department.length < 1) {
        [Methods showToast:@"请填写科室" inSuperview:self.view];
        return;
    }
    if (self.idcard.length < 1) {
        [Methods showToast:@"请填写身份证号" inSuperview:self.view];
        return;
    }
    if (!self.license) {
        [Methods showToast:@"请选择医生执照" inSuperview:self.view];
        return;
    }
    if (self.mobile.length < 1) {
        [Methods showToast:@"请填写手机号码" inSuperview:self.view];
        return;
    }
    if (self.yzm.length < 1) {
        [Methods showToast:@"请填写验证码" inSuperview:self.view];
        return;
    }
    if (self.setpass.length < 1) {
        [Methods showToast:@"请设置密码" inSuperview:self.view];
        return;
    }
    
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [AFManager postWithPath:@"/doctor/application/done"
                     params:@{@"photo":[self base64strFromeImage:self.photo],
                              @"fullname":self.fullname,
                              @"hospital":self.hospital,
                              @"department":self.department,
                              @"idcard":self.idcard,
                              @"license":[self base64strFromeImage:self.license],
                              @"mobile":self.mobile,
                              @"yzm":self.yzm,
                              @"setpass":self.setpass} succeed:^(NSDictionary *responsedict) {
                                  [MBProgressHUD hideHUDForView:self.view animated:YES];
                                  if ([AFManager isRequsetSucceed:responsedict]) {
                                      [Methods showToast:@"入驻成功" inSuperview:self.view];
                                  }
                                  
                              } failed:^(NSError *error) {
                                  
                                  [MBProgressHUD hideHUDForView:self.view animated:YES];
                              }];
}


- (NSString *)base64strFromeImage:(UIImage *)image
{
    NSData *data=UIImageJPEGRepresentation(image , 0.4);
    return [data base64Encoding];
}

- (NSArray *)titleArray
{
    if ( _titleArray == nil) {
//        _titleArray = @[@"头像",@"姓名",@"医院",@"科室",@"身份证",@"医生执照证",@"医生职称证",@"输入您的手机号码",@"输入验证码",@"设置您的登录密码"];
        _titleArray = @[@"头像",@"姓名",@"医院",@"科室",@"身份证",@"医生执照证",@"输入您的手机号码",@"输入验证码",@"设置您的登录密码"];
    }
    return  _titleArray;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 80;
    }
    if (indexPath.row == 5) {
        return 60;
    }
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        cell.textLabel.text = self.titleArray[indexPath.row];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.textColor = [UIColor grayColor];
        
        
        UIImageView *imageView = [[UIImageView alloc] init];
        [cell.contentView addSubview:imageView];
        imageView.clipsToBounds = YES;
        imageView.tag = 1000;
    }
    
    
    switch (indexPath.row) {
        case 0: {
            UIImageView *imageView = [cell.contentView viewWithTag:1000];
            imageView.frame = CGRectMake(self.view.width - 100, 10, 60, 60);
            imageView.layer.cornerRadius = 30;
            imageView.image = self.photo;
            cell.detailTextLabel.text = nil;
            break;
        }
        case 5: {
            UIImageView *imageView = [cell.contentView viewWithTag:1000];
            imageView.frame = CGRectMake(self.view.width - 100, 10, 60, 40);
            imageView.layer.cornerRadius = 0;
            imageView.image = self.license;
            cell.detailTextLabel.text = nil;
            break;
        }
        case 1: {
            UIImageView *imageView = [cell.contentView viewWithTag:1000];
            imageView.image = nil;
            cell.detailTextLabel.text = self.fullname;
            break;
        }
        case 2: {
            UIImageView *imageView = [cell.contentView viewWithTag:1000];
            imageView.image = nil;
            cell.detailTextLabel.text = self.hospital;;
            break;
        }
        case 3: {
            UIImageView *imageView = [cell.contentView viewWithTag:1000];
            imageView.image = nil;
            cell.detailTextLabel.text = self.department;;
            break;
        }
        case 4: {
            UIImageView *imageView = [cell.contentView viewWithTag:1000];
            imageView.image = nil;
            cell.detailTextLabel.text = self.idcard;;
            break;
        }
        case 6: {
            UIImageView *imageView = [cell.contentView viewWithTag:1000];
            imageView.image = nil;
            cell.detailTextLabel.text = self.mobile;;
            break;
        }
        case 7: {
            UIImageView *imageView = [cell.contentView viewWithTag:1000];
            imageView.image = nil;
            cell.detailTextLabel.text = self.yzm;;
            break;
        }
        case 8: {
            UIImageView *imageView = [cell.contentView viewWithTag:1000];
            imageView.image = nil;
            cell.detailTextLabel.text = self.setpass.length > 0?@"已填写":nil;
            break;
        }
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selected = NO;
    
    
    if (indexPath.row == 0) { // 头像
        [PhotoTools showIomagePickInController:self didChooseImage:^(UIImage *image) {
            self.photo = image;
            [tableView reloadData];
        }];
        return;
    }
    
    if (indexPath.row == 5) { // 执照
        [PhotoTools showIomagePickInController:self didChooseImage:^(UIImage *image) {
            self.license = image;
            [tableView reloadData];
        }];
        return;
    }
    
    BOOL secureTextEntry = indexPath.row == 8 ? YES:NO;
    [UIAlertController alertInputWithTitle:cell.textLabel.text placeholder:cell.detailTextLabel.text secureTextEntry:secureTextEntry inController:self didInput:^(NSString *content) {
        
        switch (indexPath.row) {
            case 1: {
                self.fullname = content;
                break;
            }
            case 2: {
                self.hospital = content;
                break;
            }
            case 3: {
                self.department = content;
                break;
            }
            case 4: {
                if ([Methods validateIdentityCard:content]) {
                    self.idcard = content;
                } else {
                    [Methods showToast:@"请输入正确的身份证号" inSuperview:self.view];
                }
                break;
            }
            case 6: {
                if ([Methods isValidatePhone:content]) {
                    self.mobile = content;
                    [Methods showToast:@"验证码正在发送至您的手机" inSuperview:self.view];
                    [AFManager postWithPath:@"/sendmsg/sendyzm" params:@{@"mobile":self.mobile} succeed:nil failed:nil];
                } else {
                    [Methods showToast:@"请输入正确的手机号" inSuperview:self.view];
                }
                break;
            }
            case 7: {
                self.yzm = content;
                break;
            }
            case 8: {
                self.setpass = content;
                break;
            }
        }
        [self.tableView reloadData];
    }];
    
}



@end
