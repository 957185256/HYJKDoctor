//
//  MessageCenterVC.m
//  HYJKDoctor
//
//  Created by sqz on 16/5/27.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import "MessageCenterVC.h"
#import "AFManager.h"
#import <MJRefresh.h>

@interface MessageCell : UITableViewCell

+ (instancetype)cellInTableView:(UITableView *)tableView;

@property (nonatomic,strong) NSDictionary *dataDict;

@end

@interface MessageCenterVC () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,weak) UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *dataArray;

@property (nonatomic,strong) NSString *doctor_id;

@end

@implementation MessageCenterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"消息中心";
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    tableView.tableFooterView = [[UIView alloc] init];
    tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    

    tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(reloadData)];
    tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if ([Account getAccount] && ![[Account getAccount].doctor_id isEqualToString:self.doctor_id]) {
        [self.tableView.mj_header beginRefreshing];
        self.doctor_id = [Account getAccount].doctor_id;
    }
}

- (void)endRefresh
{
    [self.tableView.mj_footer endRefreshing];
    [self.tableView.mj_header endRefreshing];
}

- (NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)reloadData
{
    self.tableView.mj_footer.hidden = NO;
    [self loadData:1];
}

- (void)loadMoreData
{
    [self loadData:self.dataArray.count / 10 + 1];
}

- (void)loadData:(NSInteger)page_no
{
    [AFManager postWithPath:@"/doctor/message/list"
                     params:@{@"doctor_id":[Account getAccount].doctor_id,
                              @"pagination":@{@"page":@(page_no),
                                              @"count":@"10"}}
                    succeed:^(NSDictionary *responsedict) {
                        [self endRefresh];
                        
                        if (page_no == 1) {
                            self.dataArray = nil;
                        }
                        
                        NSArray *dataArray = responsedict[@"data"];
                        for (NSDictionary *dict in dataArray) {
                            [self.dataArray addObject:dict];
                        }
                        
                        if ([responsedict[@"paginated"][@"total"] intValue] == self.dataArray.count) {
                            self.tableView.mj_footer.hidden = YES;
                        }
                        
                        [self.tableView reloadData];
    
                    } failed:^(NSError *error) {
                        [self endRefresh];
    
        }];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageCell *cell = [MessageCell cellInTableView:tableView];
    cell.dataDict = self.dataArray[indexPath.section];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 10)];
    header.backgroundColor = tableView.backgroundColor;
    return header;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelected:NO animated:YES];
}

@end


@interface MessageCell ()

//@property (nonatomic,weak) UIImageView *iconView;
//@property (nonatomic,weak) UILabel *titleLabel;
@property (nonatomic,weak) UILabel *contentLabel;
@property (nonatomic,weak) UILabel *timeLabel;
@property (nonatomic,weak) UILabel *typeLabel;

@end


@implementation MessageCell

+ (instancetype)cellInTableView:(UITableView *)tableView
{
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MessageCell"];
    if (cell == nil) {
        cell = [[MessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MessageCell"];
        
//        UIImageView *iconView = [[UIImageView alloc] init];
//        [cell.contentView addSubview:iconView];
//        cell.iconView = iconView;
//        iconView.backgroundColor = [UIColor redColor];
        
//        UILabel *titleLabel = [[UILabel alloc] init];
//        [cell.contentView addSubview:titleLabel];
//        cell.titleLabel = titleLabel;
        
        UILabel *contentLabel = [[UILabel alloc] init];
        contentLabel.numberOfLines = 0;
        [cell.contentView addSubview:contentLabel];
        cell.contentLabel = contentLabel;
        
        
        UILabel *timeLabel = [[UILabel alloc] init];
        timeLabel.font = fontWithSize(13);
        [cell.contentView addSubview:timeLabel];
        cell.timeLabel = timeLabel;
        
        UILabel *typeLabel = [[UILabel alloc] init];
        typeLabel.font = fontWithSize(13);
        [cell.contentView addSubview:typeLabel];
        cell.typeLabel = typeLabel;
        typeLabel.textAlignment = NSTextAlignmentRight;
        
    }
    
    return cell;
}

- (void)setDataDict:(NSDictionary *)dataDict
{
    _dataDict = dataDict;
    
    self.contentLabel.text = [NSString stringWithFormat:@"【%@】 %@",dataDict[@"title"],dataDict[@"content"]];
    self.timeLabel.text = dataDict[@"time"];
    self.typeLabel.text = dataDict[@"type_name"];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
//    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self);
//        make.top.equalTo(self);
//        make.width.equalTo(@(30));
//        make.height.equalTo(@(30));
//    }];
    
//    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.iconView.mas_right);
//        make.right.equalTo(self);
//        make.top.equalTo(self);
//        make.height.equalTo(@(self.height / 4));
//    }];
    
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-10);
        make.top.equalTo(self);
        make.height.equalTo(@(self.height / 4 * 3));
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.width.equalTo(@(self.width / 2));
        make.top.equalTo(self.contentLabel.mas_bottom);
        make.bottom.equalTo(self);
    }];
    
    [self.typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.timeLabel.mas_right);
        make.right.equalTo(self).offset(-10);
        make.top.equalTo(self.timeLabel);
        make.height.equalTo(self.timeLabel);
    }];
}

@end
