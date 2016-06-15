//
//  TitleSwitch.m
//  HYJKDoctor
//
//  Created by wenzhizheng on 16/6/10.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import "TitleSwitch.h"

@interface TitleSwitch ()

@property (nonatomic,weak) UILabel *hiddenLeftLabel;
@property (nonatomic,weak) UILabel *hiddenRightLabel;
@property (nonatomic,weak) UIView *changeView;


@end

@implementation TitleSwitch

+ (instancetype)switchWithleftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle frame:(CGRect)frame
{
    TitleSwitch *titleSwitch = [[self alloc] initWithFrame:frame];
    titleSwitch.clipsToBounds = YES;
    titleSwitch.backgroundColor = [UIColor whiteColor];
    titleSwitch.layer.cornerRadius = frame.size.height / 2;
    
    UILabel *leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, titleSwitch.width / 2, titleSwitch.height)];
    leftLabel.textAlignment = NSTextAlignmentCenter;
    leftLabel.text = leftTitle;
    leftLabel.textColor = CustomThemeColor;
    [titleSwitch addSubview:leftLabel];
    leftLabel.font = fontWithSize(12);
    
    
    UILabel *rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(titleSwitch.width / 2, 0, titleSwitch.width / 2, titleSwitch.height)];
    rightLabel.text = rightTitle;
    rightLabel.textAlignment = NSTextAlignmentCenter;
    rightLabel.textColor = CustomThemeColor;
    [titleSwitch addSubview:rightLabel];
    rightLabel.font = fontWithSize(12);
    
    
    UIView *changeView = [[UIView alloc] init];
    [titleSwitch addSubview:changeView];
    titleSwitch.changeView = changeView;
    changeView.backgroundColor = CustomThemeColor;
    changeView.frame = CGRectMake(2, 2, frame.size.width / 2 - 2, frame.size.height - 4);
    changeView.layer.cornerRadius = (frame.size.height - 4 )  / 2;
    changeView.clipsToBounds = YES;
    
    UILabel *hiddenLeftLabel = [[UILabel alloc] initWithFrame:CGRectMake( -2, -2, leftLabel.width, titleSwitch.height)];
    [changeView addSubview:hiddenLeftLabel];
    hiddenLeftLabel.text = leftTitle;
    hiddenLeftLabel.textColor = [UIColor whiteColor];
    titleSwitch.hiddenLeftLabel = hiddenLeftLabel;
    hiddenLeftLabel.textAlignment = NSTextAlignmentCenter;
    hiddenLeftLabel.font = fontWithSize(12);
    
    
    UILabel *hiddenRightLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width / 2 -2, -2, rightLabel.width, titleSwitch.height)];
    [changeView addSubview:hiddenRightLabel];
    hiddenRightLabel.text = rightTitle;
    hiddenRightLabel.textColor = [UIColor whiteColor];
    titleSwitch.hiddenRightLabel = hiddenRightLabel;
    hiddenRightLabel.textAlignment = NSTextAlignmentCenter;
    hiddenRightLabel.font = fontWithSize(12);
    
    [titleSwitch addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:titleSwitch action:@selector(tapOnTitleSwitch)]];
    
    return titleSwitch;
}

- (void)tapOnTitleSwitch
{
    self.userInteractionEnabled = NO;
    if (self.changeView.frame.origin.x < 10) {
        [UIView animateWithDuration:0.3 animations:^{
            self.changeView.frame = CGRectOffset(self.changeView.frame, self.changeView.width , 0);
            self.hiddenLeftLabel.frame = CGRectOffset(self.hiddenLeftLabel.frame, -self.hiddenLeftLabel.width, 0);
            self.hiddenRightLabel.frame = CGRectOffset(self.hiddenRightLabel.frame, -self.hiddenRightLabel.width, 0);
        } completion:^(BOOL finished) {
            self.userInteractionEnabled = YES;
        }];
        
        if ([self.delegate respondsToSelector:@selector(titleSwitch:changeValue:)]) {
            [self.delegate titleSwitch:self changeValue:TitleSwitchValueRight];
        }
    } else {
        [UIView animateWithDuration:0.3 animations:^{
            self.changeView.frame = CGRectOffset(self.changeView.frame, -self.changeView.width , 0);
            self.hiddenLeftLabel.frame = CGRectOffset(self.hiddenLeftLabel.frame, self.hiddenLeftLabel.width, 0);
            self.hiddenRightLabel.frame = CGRectOffset(self.hiddenRightLabel.frame, self.hiddenRightLabel.width, 0);
        } completion:^(BOOL finished) {
            self.userInteractionEnabled = YES;
        }];
        
        
        if ([self.delegate respondsToSelector:@selector(titleSwitch:changeValue:)]) {
            [self.delegate titleSwitch:self changeValue:TitleSwitchValueLeft];
        }
    }
}


@end
