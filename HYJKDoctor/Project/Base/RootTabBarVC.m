//
//  RootTabBarVC.m
//  JLT
//
//  Created by Sinoservice on 16/3/18.
//  Copyright © 2016年 odg. All rights reserved.
//

#import "RootTabBarVC.h"
#import "UIImage+Color.h"
#import "BaseVC.h"

#import "MessageCenterVC.h"
#import "OrderVC.h"
#import "MyCenterVC.h"

@interface RootTabBarVC ()<UITabBarControllerDelegate,UINavigationControllerDelegate>

@end
#pragma -mark- =====================系统样式=====================
#define NOSelectTheColor  RGB(140,147,155,1)
#define SelectTheColor RGB(60, 190, 188, 1)
#pragma -mark- =====================默认=====================
@implementation RootTabBarVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    //系统设定
    [self makeTabInitializationSystem];
    
    self.tabBar.backgroundColor = DARK_GRAY_COLOR;
    //设置承载页面
    [self setAllViewController];
    [self.childViewControllers enumerateObjectsUsingBlock:^(UIViewController *obj, NSUInteger idx, BOOL *stop) {
        

        switch (idx) {
            case 0:{
//                obj.tabBarItem.title=@"消息中心";
                obj.tabBarItem.image =QuickOriginalImage(@"TarBar_UnSelect_1");
                
                UIImage *image =QuickOriginalImage(@"TarBar_Select_1");
//                image=[image rt_tintedImageWithColor:CustomThemeColor level:0.5f];
                obj.tabBarItem.selectedImage = image;
                
                CGFloat offset=5;
                obj.tabBarItem.imageInsets=UIEdgeInsetsMake(offset, 0, -offset, 0);
            }
                break;
            case 1:{
//                obj.tabBarItem.title=@"预约订单";
                obj.tabBarItem.image =QuickOriginalImage(@"TarBar_UnSelect_2");
                
                
                UIImage *image =QuickOriginalImage(@"TarBar_Select_2");
//                image=[image rt_tintedImageWithColor:CustomThemeColor level:0.5f];
                obj.tabBarItem.selectedImage = image;
                
                CGFloat offset=5;
                obj.tabBarItem.imageInsets=UIEdgeInsetsMake(offset, 0, -offset, 0);
            }
                
                break;
            case 2:{
//                obj.tabBarItem.title=@"我的";
                obj.tabBarItem.image = QuickOriginalImage(@"TarBar_UnSelect_3");
                
                UIImage *image =QuickOriginalImage(@"TarBar_Select_3");
//                image =[image rt_tintedImageWithColor:CustomThemeColor level:0.5f];
                obj.tabBarItem.selectedImage = image;
                //imageInsets 和 titlePositionAdjustment 调整图片和文字的位置
                
                CGFloat offset=5;
                obj.tabBarItem.imageInsets=UIEdgeInsetsMake(offset, 0, -offset, 0);
                }
                
                break;
                
            default:
                break;
        }
    }];
    
    
    
    self.sselectedIndex=0;

//    //监听 颜色变化的通知
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(customColorChange:) name:PUSHMSG_Color_change_KEY object:nil];
//    //监听 消息数目变化
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(msgNumChange:) name:PUSHMSG_JPushNum_change_KEY object:nil];
//    
//    

    
    
}
- (void)selectImagePicker:(UIButton *)button{
    if (!button.selected) {
        self.sselectedIndex=1;
        button.selected=YES;
    }
    
}

-(void)makeTabInitializationSystem{
    
    
    //tabBar字体的颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : NOSelectTheColor,
                                                        NSFontAttributeName:QuickFont(11)}
                                             forState:UIControlStateNormal];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName :CustomThemeColor,
                                                        NSFontAttributeName:QuickFont(11)}
                                             forState:UIControlStateSelected];
    
    //tabar背景
    UIImage *bgImg = [UIImage imageNamed:@"tab_bg"];
    UIColor *color = [[UIColor alloc] initWithPatternImage:bgImg];
    [[UITabBar appearance] setBarTintColor:[UIColor blackColor]];
    [[UITabBar appearance]setBackgroundImage:bgImg];
    
    
    //tabar图片的选中颜色
    [[UITabBar appearance] setTintColor:CustomThemeColor];
    
    
    self.tabBar.barTintColor = color;
    
    [self.tabBar  setShadowImage:[UIImage imageWithColor:[UIColor clearColor]]];
    self.tabBar.backgroundImage =bgImg;//去除黑线
    
    self.tabBar.backgroundColor = WHITE_COLOR;
    
}
#pragma -mark 设置控制器
-(void)setAllViewController{
    
    //--------------------第1页--------------------
    

   
    MessageCenterVC *home =[[MessageCenterVC alloc] init];
    self.oneNav=[[UINavigationController alloc]initWithRootViewController:home];
    //one.navigationController.navigationBarHidden=YES;
    //系统自带返回
    home.navigationController.interactivePopGestureRecognizer.delegate = nil;
    
    
    
    
    
    //--------------------第2页--------------------
    OrderVC * two = [[OrderVC alloc]init];
    self.twoNav=[[UINavigationController alloc]initWithRootViewController:two];

    //系统自带返回
    two.navigationController.interactivePopGestureRecognizer.delegate = nil;
    
    //--------------------第3页--------------------
    MyCenterVC * three = [[MyCenterVC alloc]init];
    self.threeNav=[[UINavigationController alloc]initWithRootViewController:three];
    
    //系统自带返回
    three.navigationController.interactivePopGestureRecognizer.delegate = nil;
    
  
    
    
    
    
    
    NSArray*arry  =@[self.oneNav,self.twoNav,self.threeNav];
    [self setViewControllers:arry animated:NO];
    
    
    self.delegate=self;
    
    
}
#pragma mark - 通知事件

-(void)customColorChange:(id)sender
{
    
    [self makeTabInitializationSystem ];

}

-(void)msgNumChange:(id)sender
{
   
}



@end
