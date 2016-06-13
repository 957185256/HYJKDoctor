//
//  RootTabBarVC.h
//  JLT
//
//  Created by Sinoservice on 16/3/18.
//  Copyright © 2016年 odg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootTabBarVC : UITabBarController
@property(strong, nonatomic)UINavigationController *oneNav;
@property(strong, nonatomic)UINavigationController *twoNav;
@property(strong, nonatomic)UINavigationController *threeNav;
@property(strong, nonatomic)UINavigationController *fourNav;
@property(strong, nonatomic)UINavigationController *fiveNav;

@property(strong,nonatomic)UIButton    *homeBnt;
@property(strong,nonatomic)UIImageView *homeImageV;
@property(strong,nonatomic)UILabel     *homeLab;

@property(nonatomic,assign) NSUInteger  sselectedIndex;

-(void)customColorChange:(id)sender;
@end
