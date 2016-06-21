//
//  MyCenterVC.m
//  HYJKDoctor
//
//  Created by sqz on 16/5/27.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import "MyCenterVC.h"
#import "MineHeaderView.h"

#import "MJSettingArrowItem.h"
#import "MJSettingSwitchItem.h"
#import "MJSettingGroup.h"
#import "MJSettingLabelItem.h"
#import "MJSettingLabelArrowItem.h"
#import "MJSettingLogoutItem.h"

#import "FeedBackVC.h"
#import "StatusSetVC.h"
#import "PatentManagerVC.h"
#import "SystemSetVC.h"

#import "TelTools.h"
@interface MyCenterVC ()
@property (nonatomic, strong)MineHeaderView *headerView;

@end

@implementation MyCenterVC
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
}

-(void)viewDidDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    
    [super viewDidDisappear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 该界面没有继承BaseVC 所以一些导航栏的基础设置 在这设置一下
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
    temporaryBarButtonItem.title =@"返回";
    self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
    [self.navigationController.navigationBar setBarTintColor:CustomThemeColor];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    //==================
    
    self.view.backgroundColor = WHITE_COLOR;
    self.tableView.backgroundColor = GRAY_COLOR_BG;
    
    
    self.tableView.tableHeaderView = self.headerView;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.tableView clearDefaultLineByAddFootLineWithLineColor:CLEAR_COLOR];
    
    NSLog(@"%@",NSStringFromCGRect(self.tableView.frame));
    // 2.添加数据
    [self setupGroup0];
    [self setupGroup1];
    

    
}

/**
 *  第0组数据
 */
- (void)setupGroup0
{
    //  AppDelegate *appDelegate =[[UIApplication sharedApplication] delegate];
  
    MJSettingItem *iphoneItem = [MJSettingArrowItem itemWithIcon:@"MyCenter_咨询电话" title:@"服务电话" destVcClass:nil];
    iphoneItem.option = ^
    {
        NSLog(@"服务电话");
        //!!! 在此处写打电话的代码
        [TelTools callNumber:@"4009655525" inView:self.view];
       
    };
    
    MJSettingItem *feedBackItem = [MJSettingArrowItem itemWithIcon:@"MyCenter_意见反馈" title:@"意见反馈" destVcClass:[FeedBackVC class]];
    
    
    
    MJSettingGroup *group = [[MJSettingGroup alloc] init];
    group.items = @[iphoneItem,feedBackItem];
    group.header=@"";
    [self.data addObject:group];
    
    
}

/**
 *  第1组数据
 */
- (void)setupGroup1
{
    
    MJSettingItem *stateSetItem = [MJSettingArrowItem itemWithIcon:@"MyCenter_设置" title:@"状态设置" destVcClass:[StatusSetVC class]];
    MJSettingItem *manageItem = [MJSettingArrowItem itemWithIcon:@"MyCenter_设置" title:@"患者管理" destVcClass:[PatentManagerVC class]];
    
     MJSettingItem *setItem = [MJSettingArrowItem itemWithIcon:@"MyCenter_设置" title:@"设置" destVcClass:[SystemSetVC class]];
        
    
    MJSettingGroup *group = [[MJSettingGroup alloc] init];
    group.items = @[stateSetItem,manageItem,setItem];
    group.header=@"";
    [self.data addObject:group];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Getter Setter
-(MineHeaderView *)headerView
{
    if (_headerView==nil) {
        _headerView = [[MineHeaderView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 160)];
    }
    return _headerView;
}


@end
