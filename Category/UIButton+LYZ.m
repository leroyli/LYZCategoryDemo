//
//  UIButton+LYZ.m
//  LYCategoriesDemo
//
//  Created by artios on 2016/12/8.
//  Copyright © 2016年 artios. All rights reserved.
//

#import "UIButton+LYZ.h"
#import <objc/runtime.h>

@interface UIButton ()

@property (nonatomic, assign) NSTimeInterval mm_acceptEventTime;

@end

@implementation UIButton (LYZ)

-(void)bindData:(NSString *)key Value:(id)value
{
    objc_setAssociatedObject(self, [key cStringUsingEncoding:30], value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}
-(id)getData:(NSString *)key
{
    return objc_getAssociatedObject(self, [key cStringUsingEncoding:30]);
    
}
-(void)removeData
{
    objc_removeAssociatedObjects(self);
}
/*虚线边框的UIButton*/
+(instancetype)dashedLineButtonWithFrame:(CGRect)frame Title:(NSString *)title Title:(UIColor *)MainColor
{
    
    UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:frame];
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:MainColor forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont fontWithName:@"" size:13];
        //        button.layer.cornerRadius = frame.size.height/2;
    }
    //虚线
    CAShapeLayer *  border = [CAShapeLayer layer];
    border.strokeColor = MainColor.CGColor;
    border.fillColor = nil;
    //长方形路径
    //border.path = [UIBezierPath bezierPathWithRect:button.layer.bounds].CGPath;
    //    border.path = [UIBezierPath bezierPathWithRoundedRect:button.layer.bounds cornerRadius:frame.size.height/2].CGPath;
    border.path = [UIBezierPath bezierPathWithRoundedRect:button.layer.bounds cornerRadius:5].CGPath;
    border.frame = button.bounds;
    border.lineWidth = 1.f;
    border.lineCap = @"square";
    border.lineDashPattern = @[@4, @2];
    [button.layer addSublayer:border];
    return button;
    
}



+(instancetype)ButtonWithFrame:(CGRect)frame Normal:(UIImage *)normal Select:(UIImage *)select Title:(NSString *)title
{
    UIButton *bt=[UIButton buttonWithType:UIButtonTypeCustom];
    [bt setFrame:frame];
    if (title) {
        [bt setTitle:title forState:UIControlStateNormal];
        [bt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        bt.titleLabel.font = [UIFont systemFontOfSize:10.0f];
    }
    if (normal) {
        [bt setImage:normal forState:UIControlStateNormal];
    }
    if (select) {
        [bt setImage:select forState:UIControlStateSelected];
        [bt setImage:select forState:UIControlStateHighlighted];
    }
    return bt;
}

+(instancetype)ButtonimageWithFrame:(CGRect)frame Normal:(UIImage *)normal Select:(UIImage *)select Title:(NSString *)title
{
    UIButton *bt=[UIButton buttonWithType:UIButtonTypeCustom];
    [bt setFrame:frame];
    if (title) {
        [bt setTitle:title forState:UIControlStateNormal];
        [bt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        bt.titleLabel.font = [UIFont fontWithName:@"" size:13];
    }
    if (normal) {
        [bt setImage:normal forState:UIControlStateNormal];
    }
    if (select) {
        [bt setImage:select forState:UIControlStateSelected];
        [bt setImage:select forState:UIControlStateHighlighted];
    }
    return bt;
    
    
}

+(instancetype)ButtonLeftTtitleAndRightIconTtitleWithFrame:(CGRect)frame RightIcon:(UIImage *)iconImage  BGColor:(UIColor*)bgcolor Title:(NSString *)title TitleColor:(UIColor*)textcolor
{
    UIButton *bt=[UIButton buttonWithType:UIButtonTypeCustom];
    [bt setFrame:frame];
    bt.backgroundColor = bgcolor;
    bt.layer.cornerRadius = 1;
    if (title) {
        [bt setTitle:title forState:UIControlStateNormal];
        [bt setTitleColor:textcolor forState:UIControlStateNormal];
        bt.titleLabel.font = [UIFont fontWithName:@"" size:12];
        [bt setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    }
    if (iconImage) {
        [bt setImage:iconImage forState:UIControlStateNormal];
        [bt setImage:iconImage forState:UIControlStateSelected];
        [bt setImage:iconImage forState:UIControlStateHighlighted];
        [bt setImageEdgeInsets:UIEdgeInsetsMake(5, 5, 5, 25)];
    }
    
    return bt;
}
+(instancetype)ButtonLeftIconAndRightTtitleWithFrame:(CGRect)frame LeftIcon:(UIImage *)iconImage  BGColor:(UIColor*)bgcolor Title:(NSString *)title TitleColor:(UIColor*)textcolor
{
    UIButton *bt=[UIButton buttonWithType:UIButtonTypeCustom];
    [bt setFrame:frame];
    bt.backgroundColor = bgcolor;
    bt.layer.cornerRadius = 3;
    if (title) {
        [bt setTitle:title forState:UIControlStateNormal];
        [bt setTitleColor:textcolor forState:UIControlStateNormal];
        bt.titleLabel.font = [UIFont fontWithName:@"" size:12];
        [bt setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    }
    if (iconImage) {
        [bt setImage:iconImage forState:UIControlStateNormal];
        [bt setImage:iconImage forState:UIControlStateSelected];
        [bt setImage:iconImage forState:UIControlStateHighlighted];
        [bt setImageEdgeInsets:UIEdgeInsetsMake(5, 5, 5, 25)];
    }
    
    return bt;
}

-(CGRect)convertSameSize:(CGSize)imagesize
{
    if (imagesize.width>imagesize.height) {
        float x = (imagesize.width-imagesize.height)/2;
        return CGRectMake(x, 0, imagesize.height, imagesize.height);
    }
    float y=(imagesize.height-imagesize.width)/2;
    return CGRectMake(0, y, imagesize.width, imagesize.width);
}


/*-------------------------------------------------------*/


static const char *UIButton_acceptEventInterval = "UIButton_acceptEventInterval";
static const char *UIButton_acceptEventTime     = "UIButton_acceptEventTime";


- (NSTimeInterval )mm_acceptEventInterval{
    return [objc_getAssociatedObject(self, UIButton_acceptEventInterval) doubleValue];
}

- (void)setMm_acceptEventInterval:(NSTimeInterval)mm_acceptEventInterval{
    objc_setAssociatedObject(self, UIButton_acceptEventInterval, @(mm_acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval )mm_acceptEventTime{
    return [objc_getAssociatedObject(self, UIButton_acceptEventTime) doubleValue];
}

- (void)setMm_acceptEventTime:(NSTimeInterval)mm_acceptEventTime{
    objc_setAssociatedObject(self, UIButton_acceptEventTime, @(mm_acceptEventTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


+ (void)load{
    //获取这两个方法
    Method systemMethod = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    SEL sysSEL = @selector(sendAction:to:forEvent:);
    
    Method myMethod = class_getInstanceMethod(self, @selector(mm_sendAction:to:forEvent:));
    SEL mySEL = @selector(mm_sendAction:to:forEvent:);
    
    //添加方法进去
    BOOL didAddMethod = class_addMethod(self, sysSEL, method_getImplementation(myMethod), method_getTypeEncoding(myMethod));
    
    //如果方法已经存在了
    if (didAddMethod) {
        class_replaceMethod(self, mySEL, method_getImplementation(systemMethod), method_getTypeEncoding(systemMethod));
    }else{
        method_exchangeImplementations(systemMethod, myMethod);
        
    }
    
    //----------------以上主要是实现两个方法的互换,load是gcd的只shareinstance，果断保证执行一次
    
}

- (void)mm_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    if (NSDate.date.timeIntervalSince1970 - self.mm_acceptEventTime < self.mm_acceptEventInterval) {
        return;
    }
    
    if (self.mm_acceptEventInterval > 0) {
        self.mm_acceptEventTime = NSDate.date.timeIntervalSince1970;
    }
    
    [self mm_sendAction:action to:target forEvent:event];
}


@end
