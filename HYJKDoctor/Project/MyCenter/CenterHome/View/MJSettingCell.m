//
//  MJSettingCell.m
//  00-ItcastLottery
//
//  Created by apple on 14-4-17.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJSettingCell.h"
#import "MJSettingItem.h"
#import "MJSettingSwitchItem.h"
#import "MJSettingArrowItem.h"
#import "MJSettingLabelItem.h"
#import "MJSettingLabelArrowItem.h"
#import "MJSettingLogoutItem.h"
#import "AppDelegate.h"

@interface MJSettingCell()

#pragma mark -箭头
@property (nonatomic, strong) UIImageView *arrowView;

#pragma mark -开关
@property (nonatomic, strong) UISwitch *switchView;

#pragma mark -标签
@property (nonatomic, strong) UILabel *labelView;

#pragma mark -分割线
@property (nonatomic, weak) UIView *divider;

@end

@implementation MJSettingCell
#pragma mark - 构造返回cell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"setting";
    MJSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[MJSettingCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    return cell;
}


#pragma mark  初始化cell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 初始化操作
        
        // 1.初始化背景
        [self setupBg];
        
        // 2.初始化子控件
        [self setupSubviews];
        
        // 3.初始化分割线
        if (!IOSV_OR_LATER(7)) {
            [self setupDivider];
        }
    }
    return self;
}

#pragma mark ---初始化子控件
- (void)setupSubviews
{
    self.textLabel.backgroundColor = [UIColor clearColor];
    self.detailTextLabel.backgroundColor = [UIColor clearColor];
}

#pragma mark ---初始化背景
- (void)setupBg
{
    // 设置普通背景
    UIView *bg = [[UIView alloc] init];
    bg.backgroundColor = [UIColor whiteColor];
    self.backgroundView = bg;
    
    // 设置选中时的背景
    UIView *selectedBg = [[UIView alloc] init];
    selectedBg.backgroundColor = UICOLOR_RGB(237, 233, 218);
    self.selectedBackgroundView = selectedBg;
}

#pragma mark ---初始化分割线
- (void)setupDivider
{
    UIView *divider = [[UIView alloc] init];
    divider.backgroundColor = [UIColor blackColor];
    divider.alpha = 0.2;
    [self.contentView addSubview:divider];
    self.divider = divider;
}

#pragma mark - 监听开关状态改变
- (void)switchStateChange
{
    return;
    /*
    BOOL isOn = self.switchView.isOn;
    //ODGLOG(@"%hhd",isOn);
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:[NSNumber numberWithBool:isOn] forKey:self.item.title];
    [defaults synchronize];

    if (self.item.title!=nil && [self.item.title isEqualToString:DF_GPSTOOGLE_KEY]) {
        //gps定位开关部分－特殊事件
        AppDelegate *appDelegate =[[UIApplication sharedApplication] delegate];
        //开启定位服务-判断程序设置是否有打开gps－打开则开启－否则不开启
        NSNumber *isON= [defaults objectForKey:DF_GPSTOOGLE_KEY];
        
        if ([isON intValue]==1) {
            //判断车牌号是否为空
//             NSString *carno= [defaults objectForKey:DF_CARDNO_KEY];
//            if (carno==nil||[carno isEqualToString:@""]) {
//                //提示车牌号不能为空
//                [self.switchView setOn:!isOn];
//                NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//                [defaults setValue:[NSNumber numberWithBool:!isOn] forKey:self.item.title];
//                [defaults synchronize];
//                [[UIApplication sharedApplication].keyWindow addSubview:[UIView viewWithMessage:@"请先绑定车辆信息"]];
//            }else{
                //开启状态
                [appDelegate openLocation];
                //开启Gps后台上传服务
                [appDelegate postMyGpsLocationService];
//            }
        }else{
            //关闭Gps后台上传服务
            [appDelegate stopPostMyGpsLocationService];
            
         }
    }
     */
}


#pragma mark ---拦截frame的设置
- (void)setFrame:(CGRect)frame
{
    if (!IOSV_OR_LATER(7)) {
        CGFloat padding = 10;
        frame.size.width += padding * 2;
        frame.origin.x = -padding;
    }
    [super setFrame:frame];
}

#pragma mark ---设置子控件的frame
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (IOSV_OR_LATER(7)) return;
    
    // 设置分割线的frame
    CGFloat dividerH = 1;
    CGFloat dividerW = [UIScreen mainScreen].bounds.size.width;
    CGFloat dividerX = 0;
    CGFloat dividerY = self.contentView.frame.size.height - dividerH;
    self.divider.frame = CGRectMake(dividerX, dividerY, dividerW, dividerH);
}

#pragma mark - 设置模型item
- (void)setItem:(MJSettingItem *)item
{
    _item = item;
    
    // 1.设置数据
    [self setupData];
    
    // 2.设置右边的内容
    [self setupRightContent];
}

- (void)setLastRowInSection:(BOOL)lastRowInSection
{
    _lastRowInSection = lastRowInSection;
    
    self.divider.hidden = lastRowInSection;
}

#pragma mark ---设置右边的内容
- (void)setupRightContent
{
    if ([self.item isKindOfClass:[MJSettingArrowItem class]]) { // 箭头
        self.accessoryView = self.arrowView;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    } else if ([self.item isKindOfClass:[MJSettingSwitchItem class]]) { // 开关
        self.accessoryView = self.switchView;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        // 设置开关的状态
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        self.switchView.on = [defaults boolForKey:self.item.title];
        
    } else if ([self.item isKindOfClass:[MJSettingLabelItem class]]) { // 标签
        MJSettingLabelItem *labelItem=(MJSettingLabelItem *)self.item;
        if (labelItem.rightTitle!=nil&&![labelItem.rightTitle isEqualToString:@""]) {
            [self.labelView setText:labelItem.rightTitle];
        }
        self.accessoryView = self.labelView;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        
    }else if([self.item isKindOfClass:[MJSettingLabelArrowItem class]])//带标签和箭头
    {
        MJSettingLabelArrowItem *labelItem=(MJSettingLabelArrowItem *)self.item;
        if (labelItem.rightTitle!=nil&&![labelItem.rightTitle isEqualToString:@""]) {
            [self.labelView setText:labelItem.rightTitle];
        }
        self.accessoryView = self.arrowView;
        //!!! 注意 以后有刷新的时候 看下是否会重复添加
        [self addSubview:self.labelView];
        self.labelView.centerY=self.height/2.;
        self.labelView.right = ScreenWidth-QZMAKEOF6(34);
        
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        
    }else if ([self.item isKindOfClass:[MJSettingLogoutItem class]]) { // 退出登录
//        MJSettingLogoutItem *labelItem=(MJSettingLogoutItem *)self.item;
       
        //!!! 注意 以后有刷新的时候 看下是否会重复添加
        UILabel *lab = [[UILabel alloc] init];
        lab.bounds = CGRectMake(0, 0, 160, 30);
        lab.backgroundColor = [UIColor whiteColor];
        lab.font = fontWithSize(14);
        [lab setText:@"退出登录"];
        [self addSubview:lab];
        lab.centerY=self.height/2.;
        lab.centerX = ScreenWidth/2.;
        lab.textAlignment = NSTextAlignmentCenter;
        lab.textColor = RED_COLOR;
     
        
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        
    }else {
        self.accessoryView = nil;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
}

#pragma mark ---设置数据
- (void)setupData
{
    if (self.item.icon) {
        self.imageView.image = [UIImage imageNamed:self.item.icon];
    }
    self.textLabel.text = self.item.title;
    self.textLabel.textColor = DARK_GRAY_COLOR;
//    self.textLabel.font = fontWithSize(13);
    self.detailTextLabel.text = self.item.subtitle;
}
#pragma mark - 懒加载


#pragma mark ---初始化箭头类型
- (UIImageView *)arrowView
{
    if (_arrowView == nil) {
        _arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CellArrow"]];
    }
    return _arrowView;
}

#pragma mark ---初始化开关类型
- (UISwitch *)switchView
{
    if (_switchView == nil) {
        _switchView = [[UISwitch alloc] init];
        [_switchView addTarget:self action:@selector(switchStateChange) forControlEvents:UIControlEventValueChanged];
    }
    return _switchView;
}
#pragma mark ---初始化标签view
- (UILabel *)labelView
{
    if (_labelView == nil) {
        _labelView = [[UILabel alloc] init];
        _labelView.bounds = CGRectMake(0, 0, 160, 30);
        _labelView.backgroundColor = [UIColor whiteColor];
        _labelView.textAlignment=NSTextAlignmentRight;
        _labelView.textColor = LIGHT_GRAY_COLOR;
        _labelView.font = fontWithSize(12);
    }
    return _labelView;
}

@end
