//
//  StatusSetTableView.m
//  HYJKDoctor
//
//  Created by 刘朝涛 on 16/6/8.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import "StatusSetTableView.h"

@interface StatusSetTableView ()
{
    NSInteger index;    //选中的row
}

@end

@implementation StatusSetTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style])
    {
        self.delegate = self;
        self.dataSource = self;
        index = -1;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StatusSetTableViewCell"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"StatusSetTableViewCell"];
        cell.textLabel.font = fontWithSize(QZMAKEOF6(14));
    }
    switch (indexPath.row)
    {
        case 0:
        {
            cell.textLabel.text = @"可预约";
        }
            break;
        case 1:
        {
            cell.textLabel.text = @"已预约满";
        }
            break;
        case 2:
        {
            cell.textLabel.text = @"私事";
        }
            break;
        case 3:
        {
            cell.textLabel.text = @"紧急事项";
        }
            break;
            
        default:
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (index == -1)
    {
        cell.textLabel.textColor = CustomThemeColor;
        index = indexPath.row;
    }
    else if (index != indexPath.row)
    {
        cell.textLabel.textColor = CustomThemeColor;
        NSIndexPath *tempIndexpath = [NSIndexPath indexPathForRow:index inSection:indexPath.section];
        UITableViewCell *indexCell = [tableView cellForRowAtIndexPath:tempIndexpath];
        indexCell.textLabel.textColor = BLACK_COLOR;
        index = indexPath.row;
    }
}

@end
