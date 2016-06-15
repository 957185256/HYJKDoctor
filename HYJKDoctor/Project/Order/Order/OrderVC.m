//
//  OrderVC.m
//  HYJKDoctor
//
//  Created by sqz on 16/5/27.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import "OrderVC.h"
#import "TitleSwitch.h"
#import "AFManager.h"
#import "OrderCell.h"

@interface OrderVC () <TitleSwitchDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,weak) UIView *contentView;
@property (nonatomic,weak) UITableView *tableView1;
@property (nonatomic,weak) UITableView *tableView2;

@property (nonatomic,strong) NSMutableArray *dataArray1;
@property (nonatomic,strong) NSMutableArray *dataArray2;

@end

@implementation OrderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    TitleSwitch *titleSwitch = [TitleSwitch switchWithleftTitle:@"未处理" rightTitle:@"待诊" frame:CGRectMake(0, 0, ScreenWidth / 2, 25)];
    self.navigationItem.titleView = titleSwitch;
    titleSwitch.delegate = self;
    
    UIView *contentView = [[UIView alloc] init];
    contentView.frame = CGRectMake(0, 0, self.view.width * 2, self.view.height);
    [self.view addSubview:contentView];
    self.contentView = contentView;
    
    UITableView *tableView1 = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView1 = tableView1;
    [contentView addSubview:tableView1];
    tableView1.tableFooterView = [[UIView alloc] init];
    tableView1.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    UITableView *tableView2 = [[UITableView alloc] init];
    self.tableView2 = tableView2;
    tableView2.frame = CGRectMake(self.view.width, IOSV_OR_LATER(7)?64:44, self.view.width, self.view.height);
    [contentView addSubview:tableView2];
    tableView2.tableFooterView = [[UIView alloc] init];
    tableView2.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    self.tableView1.tag = 1000;
    self.tableView1.delegate = self;
    self.tableView1.dataSource = self;
    
    self.tableView2.tag = 2000;
    self.tableView2.delegate = self;
    self.tableView2.dataSource = self;
    
    tableView1.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(reloadData1)];
    tableView1.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData1)];
    
    
    tableView2.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(reloadData2)];
    tableView2.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData2)];
    
    [self.tableView1.mj_header beginRefreshing];
    [self.tableView2.mj_header beginRefreshing];
    
}

- (void)endRefresh1
{
    [self.tableView1.mj_footer endRefreshing];
    [self.tableView1.mj_header endRefreshing];
}

- (void)endRefresh2
{
    [self.tableView2.mj_footer endRefreshing];
    [self.tableView2.mj_header endRefreshing];
}

- (NSMutableArray *)dataArray1
{
    if (_dataArray1 == nil) {
        _dataArray1 = [NSMutableArray array];
    }
    return _dataArray1;
}

- (NSMutableArray *)dataArray2
{
    if (_dataArray2 == nil) {
        _dataArray2 = [NSMutableArray array];
    }
    return _dataArray2;
}

- (void)reloadData1
{
    self.tableView1.mj_footer.hidden = NO;
    [self loadData1:1];
}

- (void)reloadData2
{
    self.tableView2.mj_footer.hidden = NO;
    [self loadData2:1];
}

- (void)loadMoreData1
{
    [self loadData1:self.dataArray1.count / 10 + 1];
}

- (void)loadMoreData2
{
    [self loadData2:self.dataArray2.count / 10 + 1];
}

- (void)loadData1:(NSInteger)page_no
{
    [AFManager postWithPath:@"/doctor/order_list" params:@{@"doctor_id":[Account getAccount].doctor_id,@"type":@"todo"} succeed:^(NSDictionary *responsedict) {
        [self endRefresh1];
        
        if (page_no == 1) {
            self.dataArray1 = nil;
        }
        
        NSArray *dataArray = responsedict[@"data"];
        for (NSDictionary *dict in dataArray) {
            [self.dataArray1 addObject:dict];
        }
        
        if ([responsedict[@"paginated"][@"total"] intValue] == self.dataArray1.count) {
            self.tableView1.mj_footer.hidden = YES;
        }
        
        [self.tableView1 reloadData];
        
        if (self.dataArray1.count == 0) {
            [self.tableView1 setNodataViewWithImageName:@"no_order_data"];
            self.tableView1.scrollEnabled = NO;
            self.tableView1.nodataBlock = ^(){
                self.tableView1.scrollEnabled = YES;
                [self.tableView1.mj_header beginRefreshing];
            };
        }
        
        
        
    } failed:^(NSError *error) {
        [self endRefresh1];
        
    }];
    
}

- (void)loadData2:(NSInteger)page_no
{
    [AFManager postWithPath:@"/doctor/order_list" params:@{@"doctor_id":[Account getAccount].doctor_id,@"type":@"doing"} succeed:^(NSDictionary *responsedict) {
        [self endRefresh2];
        
        if (page_no == 1) {
            self.dataArray2 = nil;
        }
        
        NSArray *dataArray = responsedict[@"data"];
        for (NSDictionary *dict in dataArray) {
            [self.dataArray2 addObject:dict];
        }
        
        if ([responsedict[@"paginated"][@"total"] intValue] == self.dataArray2.count) {
            self.tableView2.mj_footer.hidden = YES;
        }
        
        [self.tableView2 reloadData];
        
        
        if (self.dataArray2.count == 0) {
            [self.tableView2 setNodataViewWithImageName:@"no_order_data"];
            self.tableView2.scrollEnabled = NO;
            self.tableView2.nodataBlock = ^(){
                self.tableView2.scrollEnabled = YES;
                [self.tableView2.mj_header beginRefreshing];
            };
        }
        
    } failed:^(NSError *error) {
        [self endRefresh2];
        
    }];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    
    return tableView.tag == 1000?self.dataArray1.count:self.dataArray2.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 10)];
    header.backgroundColor = tableView.backgroundColor;
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 135;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OrderCell *cell = [OrderCell cellInTableView:tableView];
    NSDictionary *dataDict = tableView.tag == 1000?self.dataArray1[indexPath.section]:self.dataArray2[indexPath.section];
    cell.dataDict = dataDict;
    
    __block typeof(cell) blockCell = cell;
    cell.refuseBlock = ^(){
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        [AFManager postWithPath:@"/doctor/set_order/refuse" params:@{@"doctor_id":[Account getAccount].doctor_id,@"order_id":blockCell.dataDict[@"order_case_info"][@"order_id"]} succeed:^(NSDictionary *responsedict) {
            
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            if ([AFManager isRequsetSucceed:responsedict]) {
                [Methods showToast:@"操作成功" inSuperview:self.view];
                
                if (tableView.tag == 1000) {
                    [self.dataArray1 removeObject:dataDict];
                    [self.tableView1 reloadData];
                } else {
                    [self.dataArray2 removeObject:dataDict];
                    [self.tableView2 reloadData];
                }
            }
            
        } failed:^(NSError *error) {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        }];
    };
    
    cell.agreeBlock = ^(){
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        [AFManager postWithPath:@"/doctor/set_order/accept" params:@{@"doctor_id":[Account getAccount].doctor_id,@"order_id":blockCell.dataDict[@"order_case_info"][@"order_id"]} succeed:^(NSDictionary *responsedict) {
            
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            if ([AFManager isRequsetSucceed:responsedict]) {
                [Methods showToast:@"操作成功" inSuperview:self.view];
            }
            
        } failed:^(NSError *error) {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        }];
    };
    
    return cell;
}

- (void)titleSwitch:(TitleSwitch *)titleSwitch changeValue:(TitleSwitchValue)value
{
    if (value == TitleSwitchValueLeft) {
        [UIView animateWithDuration:0.3 animations:^{
            self.contentView.frame = CGRectMake(0, 0, self.view.width * 2, self.view.height);
        }];
    }
    
    
    if (value == TitleSwitchValueRight) {
        [UIView animateWithDuration:0.3 animations:^{
            self.contentView.frame = CGRectMake(-self.view.width, 0, self.view.width * 2, self.view.height);
        }];
    }
}

@end
