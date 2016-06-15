//
//  UIView+Extend.h
//  LY
//
//  Created by ly1992 on 15/4/21.
//  Copyright (c) 2015年 ly1992. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView(Message)

/**
 *  初始化带有提示信息UIView
 *
 *  @param msg 提示信息
 *
 *  @return UIView
 */
+ (UIView *)viewWithMessage:(NSString *)msg;


/**
 *  初始化带有提示信息UIView2
 *
 *  @param msg 提示信息-底部
 *
 *  @return UIView
 */
+ (UIView *)BottomviewWithMessage:(NSString *)msg;

@end



@interface UIView (Extend)
/**
 *常用属性参数
 **/
@property (nonatomic) CGFloat left;

@property (nonatomic) CGFloat top;

@property (nonatomic) CGFloat right;

@property (nonatomic) CGFloat bottom;

@property (nonatomic) CGFloat width;

@property (nonatomic) CGFloat height;

@property (nonatomic) CGFloat centerX;

@property (nonatomic) CGFloat centerY;

@property (nonatomic) CGPoint origin;

@property (nonatomic) CGSize size;
/**
 * Return the x coordinate on the screen.
 */
@property (nonatomic, readonly) CGFloat screenX;

/**
 * Return the y coordinate on the screen.
 */
@property (nonatomic, readonly) CGFloat screenY;

/**
 * Return the x coordinate on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGFloat screenViewX;

/**
 * Return the y coordinate on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGFloat screenViewY;

/**
 * Return the view frame on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGRect screenFrame;



- (id)initWithView:(UIView *)aView;

-(void)removeAllSubviews;

//返回视图控制器
-(UIViewController*)viewController;



//设置圆角
-(void)qzSetCornerRadius:(float)radius;

//设置边宽
-(void)qzSetBorderWidth:(float)width;

//设置边色
-(void)qzSetBorderColor:(UIColor *)color;

#pragma mark 加载nibView
+ (id)loadFromXIB;
+ (id)loadFromXIBName:(NSString *)xibName;




-(id)findViewParentWithClass:(Class)clazz;

- (void)debug;
- (void)debug:(BOOL)enable;

- (void)fuckBlur;
+ (id)bolang;
+ (id)bolangForWindow;


@end


// 无网络 或者无数据
@interface UIView (nodata)


@property (nonatomic,strong) void(^nodataBlock)();

- (void)setNodataViewWithImageName:(NSString *)imageName;

- (void)removeNodataView;

@end


