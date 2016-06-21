//
//  PatentManagerVC.m
//  HYJKDoctor
//
//  Created by sqz on 16/5/28.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import "PatentManagerVC.h"
#import "SearchView.h"
#import "PatentManagerTableView.h"
#import "PatientCaseController.h"

@interface PatentManagerVC ()

@property (nonatomic, strong) SearchView *searchView;

@property (nonatomic, strong) PatentManagerTableView *tableView;

@property (nonatomic, strong) NSString *keywords;   //搜索关键字

@end

@implementation PatentManagerVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initView];
}

- (void)initView
{
    [self.view addSubview:self.searchView];
    [self.view addSubview:self.tableView];
}

#pragma mark --- gettetr
- (SearchView *)searchView
{
    if (!_searchView)
    {
        _searchView = [[SearchView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, QZMAKEOF6(51))];
        __weak typeof(self) weakSelf = self;
        _searchView.searchViewBlock = ^(NSString *keywords) {
            _keywords = keywords;
//            [weakSelf getOrderIdlist];
        };
    }
    return _searchView;
}

- (PatentManagerTableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[PatentManagerTableView alloc] initWithFrame:CGRectMake(0, _searchView.bottom, ScreenWidth, ScreenHeight - _searchView.bottom) style:UITableViewStylePlain];
        _tableView.selectBlock = ^(PatientCaseModel *model) {
            [self.navigationController pushViewController:[PatientCaseController controllerWithPatientDataArray:nil caseModel:model] animated:YES];
        };
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
