//
//  PatentManagerTableView.h
//  HYJKDoctor
//
//  Created by 刘朝涛 on 16/6/8.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PatientCaseModel;

@interface PatentManagerTableView : UITableView<UITableViewDataSource, UITableViewDelegate>


@property (nonatomic,strong) void(^selectBlock)(PatientCaseModel *);

@end
