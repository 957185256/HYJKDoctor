//
//  OrderDetailsVC.m
//  HYJKDoctor
//
//  Created by shown on 16/6/14.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import "OrderDetailsVC.h"
#import "OrderDetailsHeadView.h"
#import "OrderDetailsTableView.h"
#import "OrderDetailsModel.h"
#import "OrderDetailsFootView.h"

@interface OrderDetailsVC ()

@property (nonatomic, strong) OrderDetailsHeadView *headView;

@property (nonatomic, strong) OrderDetailsTableView *tableView;

@property (nonatomic, strong) OrderDetailsFootView *footView;

@end

@implementation OrderDetailsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"详情";
    [self initView];
}


- (void)initView
{
    [self.view addSubview:self.tableView];
    [self initData];
}

- (void)initData
{
    [self getOrderDetails];
}

#pragma mark --- 网络请求
- (void)getOrderDetails
{
    Account *account = [Account getAccount];
    NSDictionary *dict = account.session;
    NSDictionary *params = @{@"doctor_id":[NSString stringWithFormat:@"%@",dict[@"doctor_id"]],
                             @"order_sn":[NSString stringWithFormat:@"%@",@"2016061297780"]};
    
    [OrderDetailsModel postOrderDetail:params Succeed:^(id obj) {
        [_headView initDataWith:obj];
        _tableView.model = obj;
        [self endRefresh];
    } Failed:^(id error) {
        [self endRefresh];
    }];
}

#pragma mark --- 刷新
- (void)downRefresh
{
    [self getOrderDetails];
}

- (void)endRefresh
{
    [_tableView.mj_header endRefreshing];
}

#pragma mark --- getter

- (OrderDetailsTableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[OrderDetailsTableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)  style:UITableViewStylePlain];
        _tableView.tableHeaderView = self.headView;
        _tableView.tableFooterView = self.footView;
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(downRefresh)];
    }
    return _tableView;
}

- (OrderDetailsHeadView *)headView
{
    if (!_headView)
    {
        _headView = [[OrderDetailsHeadView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, QZMAKEOF6(272))];
    }
    return _headView;
}

- (OrderDetailsFootView *)footView
{
    if (!_footView)
    {
        _footView = [[OrderDetailsFootView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, QZMAKEOF6(70))];
    }
    return _footView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
