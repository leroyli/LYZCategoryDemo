//
//  UIView+LYZ.m
//  LYCategoriesDemo
//
//  Created by artios on 2016/12/6.
//  Copyright © 2016年 artios. All rights reserved.
//

#import "UIView+LYZ.h"
#import <objc/runtime.h>

const char *hjw_leftBorderKey = "hjw_leftBorderKey";
const char *hjw_rightBorderKey = "hjw_rightBorderKey";
const char *hjw_topBorderKey = "hjw_topBorderKey";
const char *hjw_bottomBorderKey = "hjw_bottomBorderKey";

CGPoint CGRectGetCenter(CGRect rect) {
    CGPoint pt;
    pt.x = CGRectGetMidX(rect);
    pt.y = CGRectGetMidY(rect);
    return pt;
}

CGRect CGRectMoveToCenter(CGRect rect, CGPoint center) {
    CGRect newrect = CGRectZero;
    newrect.origin.x = center.x - CGRectGetMidX(rect);
    newrect.origin.y = center.y - CGRectGetMidY(rect);
    newrect.size = rect.size;
    return newrect;
}

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

//加阴影
- (void)addShadow {
    self.layer.shadowOffset = CGSizeMake(0, 2);
    self.layer.shadowOpacity = 0.24;
    self.layer.shadowPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, self.height - 2, self.width == 320 ? [UIScreen mainScreen].bounds.size.width : self.width, 2)].CGPath;
}

//变圆
- (UIView *)roundV {
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = self.width / 2;
    return self;
}

static char kActionHandlerTapBlockKey;
static char kActionHandlerTapGestureKey;
static char kActionHandlerLongPressBlockKey;
static char kActionHandlerLongPressGestureKey;

//单点击手势
- (void)tapGesture:(GestureActionBlock)block {
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &kActionHandlerTapGestureKey);
    if (!gesture) {
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleActionForTapGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &kActionHandlerTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &kActionHandlerTapBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)handleActionForTapGesture:(UITapGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateRecognized) {
        GestureActionBlock block = objc_getAssociatedObject(self, &kActionHandlerTapBlockKey);
        if (block) {
            block(gesture);
        }
    }
}

//长按手势
- (void)longPressGestrue:(GestureActionBlock)block {
    self.userInteractionEnabled = YES;
    UILongPressGestureRecognizer *gesture = objc_getAssociatedObject(self, &kActionHandlerLongPressGestureKey);
    if (!gesture) {
        gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleActionForLongPressGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &kActionHandlerLongPressGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &kActionHandlerLongPressBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)handleActionForLongPressGesture:(UITapGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        GestureActionBlock block = objc_getAssociatedObject(self, &kActionHandlerLongPressBlockKey);
        if (block) {
            block(gesture);
        }
    }
}

/** 移除对应的view */
- (void)removeClassView:(Class)classV {
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:classV]) {
            [view removeFromSuperview];
        }
    }
}

/** 添加边框:四边 */
- (void)border:(UIColor *)color width:(CGFloat)width CornerRadius:(CGFloat)radius {
    if (radius == 0) {
        [self border:color width:width];
    } else {
        CALayer *layer = self.layer;
        if (color != nil) {
            layer.borderColor = color.CGColor;
        }
        layer.cornerRadius = radius;
        layer.masksToBounds = YES;
        layer.borderWidth = width;
    }
}
/** 四边变圆 */
- (void)borderRoundCornerRadius:(CGFloat)radius {
    CALayer *layer = self.layer;
    
    layer.cornerRadius = radius;
    layer.masksToBounds = YES;
}
//添加边框
- (void)border:(UIColor *)color width:(CGFloat)width;
{
    CALayer *layer = self.layer;
    if (color != nil) {
        layer.borderColor = color.CGColor;
    }
    layer.cornerRadius = 4;
    layer.masksToBounds = YES;
    layer.borderWidth = width;
}

- (void)borderRound {
    CALayer *layer = self.layer;
    layer.cornerRadius = 4;
    layer.masksToBounds = YES;
}

- (void)hjw_setCornerWithType:(HJWCorner)cornerType cornerRadius:(CGFloat)radius
{
    UIBezierPath *maskPath;
    switch (cornerType) {
        case HJWCornerTop:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight)
                                                   cornerRadii:CGSizeMake(radius, radius)];
        }
            break;
        case HJWCornerLeft:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerBottomLeft)
                                                   cornerRadii:CGSizeMake(radius, radius)];
        }
            break;
        case HJWCornerBottom:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerBottomRight)
                                                   cornerRadii:CGSizeMake(radius, radius)];
        }
            break;
        case HJWCornerRight:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopRight | UIRectCornerBottomRight)
                                                   cornerRadii:CGSizeMake(radius, radius)];
            
        }
            break;
        case HJWCornerAll:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:radius];
        }
            break;
            
        default:
            break;
    }
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)hjw_setBorders:(HJWBorder)Borders color:(UIColor *)color width:(CGFloat)width
{
    if((Borders & HJWBorderLeft) == HJWBorderLeft)
    {
        [self hjw_showBorderViewWithKey:hjw_leftBorderKey frame:CGRectMake(0, 0, width, self.frame.size.height) color:color];
    }
    if((Borders & HJWBorderRight) == HJWBorderRight)
    {
        [self hjw_showBorderViewWithKey:hjw_rightBorderKey frame:CGRectMake(self.frame.size.width - width, 0, width, self.frame.size.height) color:color];
    }
    if((Borders & HJWBorderTop) == HJWBorderTop)
    {
        [self hjw_showBorderViewWithKey:hjw_topBorderKey frame:CGRectMake(0, 0, self.frame.size.width, width) color:color];
    }
    if((Borders & HJWBorderBottom) == HJWBorderBottom)
    {
        [self hjw_showBorderViewWithKey:hjw_bottomBorderKey frame:CGRectMake(0, self.frame.size.height - width, self.frame.size.width, width) color:color];
    }
}

#pragma mark - pravite methods
- (void)hjw_showBorderViewWithKey:(const void *)key frame:(CGRect)frame color:(UIColor *)color
{
    UIView *border = objc_getAssociatedObject(self, key);
    if (border) {
        border.frame = frame;
        border.backgroundColor = color;
        border.hidden = NO;
    }else{
        UIView *newBorder = [[UIView alloc] initWithFrame:frame];
        newBorder.backgroundColor = color;
        [self addSubview:newBorder];
        objc_setAssociatedObject(self, key, newBorder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}


@end
