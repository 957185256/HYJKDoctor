//
//  SearchFooterView.h
//  HYJKDoctor
//
//  Created by 刘朝涛 on 16/6/5.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchFooterView : UIView

@property (nonatomic, strong) UIButton *cleanBtn;   //

@property (nonatomic, copy) void(^footBlock)();

@end
