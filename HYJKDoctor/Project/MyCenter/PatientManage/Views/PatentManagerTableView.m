//
//  PatentManagerTableView.m
//  HYJKDoctor
//
//  Created by 刘朝涛 on 16/6/8.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import "PatentManagerTableView.h"
#import "PatentManagerTableViewCell.h"

@implementation PatentManagerTableView

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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PatentManagerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PatentManagerTableViewCell"];
    if (!cell)
    {
        cell = [[PatentManagerTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PatentManagerTableViewCell"];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self deselectRowAtIndexPath:indexPath animated:YES];
}

@end
