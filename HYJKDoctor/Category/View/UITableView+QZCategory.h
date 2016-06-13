//
//  UITableView+QZCategory.h
//  sexduoduo
//
//  Created by showm on 15/9/14.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (QZCategory)

//使分割线从左边开始
-(void)setLineZero;

//设置separatorStyle为UITableViewCellSeparatorStyleNone
-(void)setSepratorStyleNone;

//通过在footView加根线的方式 清理没哟数据时 显示分割线的问题
-(void)clearDefaultLineByAddFootLine;

-(void)clearDefaultLineByAddFootLineWithLineColor:(UIColor *)lineColor;

@end