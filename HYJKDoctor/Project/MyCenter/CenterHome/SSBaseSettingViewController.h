//
//  MJBaseSettingViewController.h
//  设置基类控制器
//
//  Created by apple on 14-4-17.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSBaseSettingViewController : UITableViewController
@property (nonatomic, strong) NSMutableArray *data;

-(void)reflash;

@end
