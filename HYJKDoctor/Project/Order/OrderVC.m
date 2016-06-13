//
//  OrderVC.m
//  HYJKDoctor
//
//  Created by sqz on 16/5/27.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import "OrderVC.h"
#import "SearchVC.h"

@interface OrderVC ()

@end

@implementation OrderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"宏医健康";
    [self.rightButton setTitle:@"搜索" forState:UIControlStateNormal];
}

- (void)touchRightBnt:(UIButton *)sender
{
    SearchVC *searchVC = [[SearchVC alloc] init];
    [self.navigationController pushViewController:searchVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
