//
//  OrderCell.h
//  HYJKDoctor
//
//  Created by wenzhizheng on 16/6/14.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderCell : UITableViewCell

+ (instancetype)cellInTableView:(UITableView *)tableView;

@property (nonatomic,strong) NSDictionary *dataDict;

@property (nonatomic,strong) void(^refuseBlock)();
@property (nonatomic,strong) void(^agreeBlock)();

@end


