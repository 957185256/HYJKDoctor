//
//  OrderDetailsTableView.h
//  HYJKDoctor
//
//  Created by shown on 16/6/14.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import <UIKit/UIKit.h>
@class OrderDetailsModel;

@interface OrderDetailsTableView : UITableView<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) OrderDetailsModel *model;

@end
