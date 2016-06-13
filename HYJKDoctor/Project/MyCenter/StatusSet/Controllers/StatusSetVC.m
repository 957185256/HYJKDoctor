//
//  StatusSetVC.m
//  HYJKDoctor
//
//  Created by sqz on 16/5/28.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import "StatusSetVC.h"
#import "CalendarHeadView.h"
#import "StatusSetTableView.h"

@interface StatusSetVC ()

@property (nonatomic, strong) CalendarHeadView *headView;

@property (nonatomic, strong) StatusSetTableView *tableView;

@end

@implementation StatusSetVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initView];
}

- (void)initView
{
    [self.view addSubview:self.tableView];
}

- (StatusSetTableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[StatusSetTableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
        _tableView.tableHeaderView = self.headView;
    }
    return _tableView;
}

- (CalendarHeadView *)headView {
    if (_headView == nil) {
        _headView = [[CalendarHeadView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
//        _headView.delegate = self;
    }
    return _headView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
