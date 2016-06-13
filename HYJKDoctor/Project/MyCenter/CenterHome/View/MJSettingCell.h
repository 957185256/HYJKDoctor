//
//  MJSettingCell.h
//  设置tableView的cell
//  Created by apple on 14-4-17.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MJSettingItem;

@interface MJSettingCell : UITableViewCell
#pragma mark -设置模型setting
@property (nonatomic, strong) MJSettingItem *item;
#pragma mark -是否是最后一个sectoin
@property (nonatomic, assign, getter = isLastRowInSection) BOOL lastRowInSection;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
