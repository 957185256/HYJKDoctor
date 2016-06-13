//
//  SearchView.h
//  HYJKDoctor
//  搜索界面
//  Created by 刘朝涛 on 16/6/5.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchView : UIView

@property (nonatomic, strong) UIButton *searchBtn;

@property (nonatomic, strong) UITextField *searchF; //搜索输入框

@property (nonatomic, copy) void(^(searchViewBlock))(NSString *keyworks);

@end
