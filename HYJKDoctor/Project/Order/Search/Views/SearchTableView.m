//
//  SearchTableView.m
//  HYJKDoctor
//
//  Created by 刘朝涛 on 16/6/5.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import "SearchTableView.h"
#import "SearchTableViewCell.h"
#import "SearchOrderModel.h"

@implementation SearchTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style])
    {
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}

- (void)setDataArr:(NSMutableArray *)dataArr
{
    _dataArr = dataArr;
    [self reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SearchTableViewCell"];
    if (!cell)
    {
        cell = [[SearchTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SearchTableViewCell"];
    }
    
    SearchOrderModel *model = _dataArr[indexPath.row];
    
    cell.nameLab.text = model.consignee;
    
    cell.timeLab.text = model.order_time;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self deselectRowAtIndexPath:indexPath animated:YES];
}

@end
