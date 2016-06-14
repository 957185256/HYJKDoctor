//
//  OrderDetailsTableView.m
//  HYJKDoctor
//
//  Created by shown on 16/6/14.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import "OrderDetailsTableView.h"
#import "OrderDetailsTableViewCell.h"
#import "OrderDetailsModel.h"

@implementation OrderDetailsTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style])
    {
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.dataSource = self;
        self.delegate = self;
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
    }
    return self;
}

- (void)setModel:(OrderDetailsModel *)model
{
    _model = model;
    [self reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OrderDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OrderDetailsTableViewCell"];
    if (!cell)
    {
        cell = [[OrderDetailsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"OrderDetailsTableViewCell"];
    }

    switch (indexPath.row)
    {
        case 0:
        {
            cell.lab.text = @"姓名";
            cell.value.text = _model.consignee;
        }
            break;
        case 1:
        {
            cell.lab.text = @"手机号";
            cell.value.text = _model.tel;
        }
            break;
        case 2:
        {
            cell.lab.text = @"年龄";
            cell.value.text = _model.age;
        }
            break;
        case 3:
        {
            cell.lab.text = @"体重";
            cell.value.text = _model.weight;
        }
            break;
        case 4:
        {
            cell.lab.text = @"身高";
            cell.value.text = _model.height;
        }
            break;
        case 5:
        {
            cell.lab.text = @"血型";
            cell.value.text = _model.blood_type;
        }
            break;
        case 6:
        {
            cell.lab.text = @"BMI";
            cell.value.text = _model.bmi;
        }
            break;
        default:
            break;
    }
    
    return cell;
}

@end
