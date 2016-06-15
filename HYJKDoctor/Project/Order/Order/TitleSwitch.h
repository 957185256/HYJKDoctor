//
//  TitleSwitch.h
//  HYJKDoctor
//
//  Created by wenzhizheng on 16/6/10.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    TitleSwitchValueLeft = 0,
    TitleSwitchValueRight
}TitleSwitchValue;

@class TitleSwitch;

@protocol TitleSwitchDelegate <NSObject>

- (void)titleSwitch:(TitleSwitch *)titleSwitch changeValue:(TitleSwitchValue)value;

@end

@interface TitleSwitch : UIView

@property (nonatomic,weak) id<TitleSwitchDelegate> delegate;


+ (instancetype)switchWithleftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle frame:(CGRect)frame;

@end
