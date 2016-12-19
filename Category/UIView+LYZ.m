//
//  UIView+LYZ.m
//  LYCategoriesDemo
//
//  Created by artios on 2016/12/6.
//  Copyright © 2016年 artios. All rights reserved.
//

#import "UIView+LYZ.h"
#import <objc/runtime.h>

@implementation UIView (LYZ)

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)left
{
    return self.frame.origin.x;
}

- (CGFloat)right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)top
{
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

-(void)bindData:(NSString *)key Value:(id)value
{
    //    关联的对象
    objc_setAssociatedObject(self, [key cStringUsingEncoding:30], value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

-(id)getData:(NSString *)key
{
    return objc_getAssociatedObject(self, [key cStringUsingEncoding:30]);
    
}

+(instancetype)ViewWithFrame:(CGRect)frame :(UIColor*)bcolor
{
    UIView *view=[[UIView alloc]initWithFrame:frame];
    [view setBackgroundColor:bcolor];
    return view;
}
/*初始化横线方法*/
+(instancetype)lineViewWithx:(float)linex y:(float)liney wight:(float)wight :(UIColor*)linecolor
{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(linex, liney, wight, 0.5)];
    [view setBackgroundColor:linecolor];
    return view;
}
/*初始化竖线方法*/
+(instancetype)lineViewWithx:(float)linex y:(float)liney height:(float)lineheight :(UIColor*)linecolor
{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(linex, liney, 0.5, lineheight)];
    [view setBackgroundColor:linecolor];
    return view;
}

+(void)startShake:(UIView*)shakeView
{
    static NSString * const kAFViewShakerAnimationKey = @"kAFViewShakerAnimationKey";
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    CGFloat currentTx =10;
//    animation.delegate = self;
    animation.duration = 0.5;
    animation.values = @[ @(currentTx), @(currentTx + 5), @(currentTx-8), @(currentTx + 8), @(currentTx -5), @(currentTx + 5), @(currentTx) ];
    animation.keyTimes = @[ @(0), @(0.225), @(0.425), @(0.6), @(0.75), @(0.875), @(1) ];
    //  4.通常来讲,通过使用 times 这个字段,来给每帧动画指定一个时间。如果你没有指定这些,核心动画就
    //    会通过你在 values 这个字段指定的值分割出时间段。
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [shakeView.layer addAnimation:animation forKey:kAFViewShakerAnimationKey];
}


@end
