//
//  UIView+Extend.m
//  LY
//
//  Created by ly1992 on 15/4/21.
//  Copyright (c) 2015年 ly1992. All rights reserved.
//

#import "UIView+Extend.h"

@implementation UIView(Message)

//提示信息
+ (UIView *)viewWithMessage:(NSString *)msg{
    
    CGFloat screen_width = [UIScreen mainScreen].bounds.size.width;
    CGFloat screen_height = [UIScreen mainScreen].bounds.size.height;
    
    UIView *view = [[UIView alloc] init];
    
    CGPoint center = CGPointMake(screen_width / 2, screen_height / 2);
    CGSize msgSize = CGSizeZero;
    //chris  计算字符串长宽的方法
    msgSize = [msg sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20.0f]}];

    view.center = center;
    view.bounds = CGRectMake(0, 0, msgSize.width, 44.0f);
    view.backgroundColor = [UIColor blackColor];
    view.layer.cornerRadius = 5.0f;
    view.alpha = 0.8;
    
    UILabel *msgLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, msgSize.width, 44.0f)];
    msgLabel.text = msg;
    msgLabel.textAlignment = NSTextAlignmentCenter;
    msgLabel.textColor = [UIColor whiteColor];
    msgLabel.alpha = 1.0f;
    
    [view addSubview:msgLabel];
    
    
    //如果文字太长的话 多行显示
    if(msgSize.width> screen_width - 20)
    {
        CGRect rect = [msg boundingRectWithSize:CGSizeMake(screen_width-20, MAXFLOAT)
                                        options:NSStringDrawingUsesLineFragmentOrigin
                                     attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20.0f]}
                                        context:nil];
        
        view.center = center;
        view.bounds = CGRectMake(0, 0, screen_width-20, rect.size.height +10);
        
        msgLabel.width = view.width ;
        msgLabel.height =view.height ;
        
        msgLabel.numberOfLines=0;
    }

    
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [UIView transitionWithView:view duration:1 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            
            view.hidden = YES;
            
        } completion:^(BOOL finished) {
            [view removeFromSuperview];
        }];
    });
    
    return view;
}

//提示信息2
+ (UIView *)BottomviewWithMessage:(NSString *)msg{
    
    CGFloat screen_width = [UIScreen mainScreen].bounds.size.width;
    CGFloat screen_height = [UIScreen mainScreen].bounds.size.height;
    
    UIView *view = [[UIView alloc] init];
    
    CGPoint center = CGPointMake(screen_width / 2, screen_height -80);
    CGSize msgSize = CGSizeZero;
    msgSize = [msg sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20.0f]}];
    
    view.center = center;
    view.bounds = CGRectMake(0, 0, msgSize.width, 44.0f);
    
    view.backgroundColor = [UIColor blackColor];
    view.layer.cornerRadius = 5.0f;
    view.alpha = 0.8;
    
    UILabel *msgLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, msgSize.width, 44.0f)];
    msgLabel.text = msg;
    msgLabel.textAlignment = NSTextAlignmentCenter;
    msgLabel.textColor = [UIColor whiteColor];
    msgLabel.font = [UIFont systemFontOfSize:12];
    msgLabel.alpha = 1.0f;
    
    [view addSubview:msgLabel];
    
    
    //如果文字太长的话 多行显示
    if(msgSize.width> screen_width - 20)
    {
        CGRect rect = [msg boundingRectWithSize:CGSizeMake(screen_width-20, MAXFLOAT)
                                        options:NSStringDrawingUsesLineFragmentOrigin
                                     attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20.0f]}
                                        context:nil];
        
        view.center = center;
        view.bounds = CGRectMake(0, 0, screen_width-20, rect.size.height +10);
        
        msgLabel.width = view.width ;
        msgLabel.height =view.height ;
        
        msgLabel.numberOfLines=0;
    }
    
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [UIView transitionWithView:view duration:1 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            
            view.hidden = YES;
            
        } completion:^(BOOL finished) {
            [view removeFromSuperview];
        }];
    });
    
    return view;
}

@end


@implementation UIView (Extend)
/*--------------------------------------------------------------------*/
- (CGFloat)left {
    return self.frame.origin.x;
}
- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
/*--------------------------------------------------------------------*/
- (CGFloat)top {
    return self.frame.origin.y;
}
- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
/*--------------------------------------------------------------------*/
- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}
- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}
/*--------------------------------------------------------------------*/
- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}
- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}
/*--------------------------------------------------------------------*/
- (CGFloat)centerX {
    return self.center.x;
}
- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}
/*--------------------------------------------------------------------*/
- (CGFloat)centerY {
    return self.center.y;
}
- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}
/*--------------------------------------------------------------------*/
- (CGFloat)width {
    return self.frame.size.width;
}
- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
/*--------------------------------------------------------------------*/

- (CGFloat)height {
    return self.frame.size.height;
}
- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
/*--------------------------------------------------------------------*/
-(CGSize)size
{
    return self.frame.size;
}
-(void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
/*--------------------------------------------------------------------*/

-(CGPoint)origin
{
    return self.frame.origin;
}
-(void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}
/*--------------------------------------------------------------------*/

- (CGFloat)screenX {
    CGFloat x = 0;
    for (UIView *view = self; view; view = view.superview) {
        x += view.left;
    }
    return x;
}
/*--------------------------------------------------------------------*/
- (CGFloat)screenY {
    CGFloat y = 0;
    for (UIView *view = self; view; view = view.superview) {
        y += view.top;
    }
    return y;
}
/*--------------------------------------------------------------------*/
- (CGFloat)screenViewX {
    CGFloat x = 0;
    for (UIView *view = self; view; view = view.superview) {
        x += view.left;
        
        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView *scrollView = (UIScrollView *)view;
            x -= scrollView.contentOffset.x;
        }
    }
    return x;
}
/*--------------------------------------------------------------------*/
- (CGFloat)screenViewY {
    CGFloat y = 0;
    for (UIView *view = self; view; view = view.superview) {
        y += view.top;
        
        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView *scrollView = (UIScrollView *)view;
            y -= scrollView.contentOffset.y;
        }
    }
    return y;
}
/*--------------------------------------------------------------------*/
- (CGRect)screenFrame {
    return CGRectMake(self.screenViewX, self.screenViewY, self.width, self.height);
}

/*--------------------------------------------------------------------*/

-(void)removeAllSubviews
{
    NSArray* array = self.subviews;
    for (UIView* subview in array) {
        [subview removeFromSuperview];
    }
}

- (UIViewController *)viewController {
    for (UIView *next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

//设置圆角
-(void)qzSetCornerRadius:(float)radius
{
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;//切
}

//设置边宽
-(void)qzSetBorderWidth:(float)width
{
    self.layer.borderWidth = width;
}

//设置边色
-(void)qzSetBorderColor:(UIColor *)color
{
    self.layer.borderColor = color.CGColor;
}

/**
 *  设置圆角矩形
 */
-(void)setViewCornerRadius:(CGFloat)cornerRadius{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = cornerRadius;
    self.contentMode = UIViewContentModeScaleAspectFill;
}

#pragma mark 加载nibView
+ (id)loadFromXIB
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}

+ (id)loadFromXIBName:(NSString *)xibName
{
    return [[[NSBundle mainBundle] loadNibNamed:xibName owner:nil options:nil] lastObject];
}




-(id)findViewParentWithClass:(Class)clazz
{
    UIView* view = self.superview;
    while([view isKindOfClass:clazz]==NO) {
        view = view.superview;
    }
    return view;
}

- (void)debug
{
#if TARGET_IPHONE_SIMULATOR
    self.layer.borderColor = [UIColor colorWithRed:((CGFloat) (abs(arc4random() % 256)) / 255) green:((CGFloat) (abs(arc4random() % 256)) / 255) blue:((CGFloat) (abs(arc4random() % 256)) / 255) alpha:1.0].CGColor;
    self.layer.borderWidth = 1.0f;
#endif
}

- (void)debug:(BOOL)enable
{
#if TARGET_IPHONE_SIMULATOR
    if (enable) {
        [self debug];
    } else {
        self.layer.borderColor = [UIColor clearColor].CGColor;
        self.layer.borderWidth = 0.0f;
    }
#endif
}
- (void)fuckBlur
{
    CGRect newRect;
    newRect.origin.x = roundf(self.origin.x);
    newRect.origin.y = roundf(self.origin.y);
    newRect.size.width = roundf(self.size.width);
    newRect.size.height = roundf(self.size.height);
    self.frame = newRect;
}


- (id)initWithView:(UIView *)aView
{
    UIView *newView = [self initWithFrame:aView.bounds];
    newView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    return newView;
}


+ (id)bolang
{
    UIImageView *bolang = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 480, 6)];
    bolang.contentMode = UIViewContentModeTop;
    bolang.image = [UIImage imageNamed:@"all_windowline"];
    return bolang;
}

+ (id)bolangForWindow
{
    UIImageView *bolang = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 540, 6)];
    bolang.contentMode = UIViewContentModeTop;
    bolang.image = [UIImage imageNamed:@"all_windowline"];
    return bolang;
}
@end 
