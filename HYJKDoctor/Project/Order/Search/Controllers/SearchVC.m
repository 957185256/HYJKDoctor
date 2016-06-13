//
//  SearchVC.m
//  HYJKDoctor
//
//  Created by 刘朝涛 on 16/6/5.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import "SearchVC.h"
#import "SearchView.h"
#import "SearchTableView.h"
#import "SearchFooterView.h"
#import "SearchModel.h"

@interface SearchVC ()
{
    NSString *_page;
    NSString *_keywords;
}
@property (nonatomic, strong) SearchView *searchView;

@property (nonatomic, strong) SearchTableView *tableView;

@property (nonatomic, strong) SearchFooterView *searchFootView;

@end

@implementation SearchVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"搜索";
    
    [self initView];
}

- (void)initView
{
    _page = @"1";
    _keywords = @"";
    
    [self.view addSubview:self.searchView];
    [self.view addSubview:self.tableView];
    
    [self initData];
}

- (void)initData
{
    NSMutableArray *arr = [CTCache getCache:@"searchData"];
    if (arr.count > 0)
    {
        _tableView.dataArr = arr;
        _searchFootView.cleanBtn.hidden = NO;
    }
}

#pragma mark --- 网络请求
- (void)getOrderIdlist
{
    NSDictionary *params = @{@"doctor_id":@"9",
                             @"pagination":@{@"page":_page,
                                             @"count":@"100"},
                             @"keywords":_keywords};
    [self showLoadingView];
    [SearchModel getOrderList:params Succeed:^(id obj) {
        if ([obj count] > 0)
        {
            _tableView.dataArr = obj;
            [CTCache setCache:obj FileName:@"searchData"];
            _searchFootView.cleanBtn.hidden = NO;
        }
        [self stopLoadingView];
    } Fail:^(id error) {
        [self stopLoadingView];
    }];
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
            [weakSelf getOrderIdlist];
        };
    }
    return _searchView;
}

- (SearchTableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[SearchTableView alloc] initWithFrame:CGRectMake(0, _searchView.bottom, ScreenWidth, ScreenHeight - _searchView.bottom) style:UITableViewStylePlain];
        _tableView.tableFooterView = self.searchFootView;
    }
    return _tableView;
}

- (SearchFooterView *)searchFootView
{
    if (!_searchFootView)
    {
        _searchFootView = [[SearchFooterView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 44)];
        __weak typeof(self) weakSelf = self;
        _searchFootView.footBlock = ^() {
            weakSelf.tableView.dataArr = nil;
            weakSelf.searchFootView.cleanBtn.hidden = YES;
            [CTCache setCache:nil FileName:@"searchData"];
        };
    }
    return _searchFootView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
