//
//  CalenderCell.m
//  LCT_Calendar
//
//  Created by shown on 16/1/7.
//  Copyright (c) 2016年 shown. All rights reserved.
//

#import "CalenderCell.h"

@implementation CalenderCell

- (void)awakeFromNib {
    // Initialization code
    self.dayStr.layer.cornerRadius = ScreenWidth/7/2.;
    self.dayStr.layer.masksToBounds = YES;
    self.dayStr.backgroundColor = RGB(247, 247, 247, 1);
    self.backgroundColor = [UIColor clearColor];
}

@end
