//
//  SearchTableView.h
//  HYJKDoctor
//
//  Created by 刘朝涛 on 16/6/5.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SearchOrderModel;

@interface SearchTableView : UITableView<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, copy) void(^searchTableViewBlock)(SearchOrderModel *model);    //代码块

@end
