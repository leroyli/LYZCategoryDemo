//
//  UIView+LYZ.h
//  LYCategoriesDemo
//
//  Created by artios on 2016/12/6.
//  Copyright © 2016年 artios. All rights reserved.
//

#import <UIKit/UIKit.h>

CGPoint CGRectGetCenter(CGRect rect);
CGRect CGRectMoveToCenter(CGRect rect, CGPoint center);

/**
 *  边框类型设置 可多选
 */
typedef NS_OPTIONS(NSUInteger, HJWBorder) {
    HJWBorderLeft   = 1 << 0,
    HJWBorderRight  = 1 << 1,
    HJWBorderTop    = 1 << 2,
    HJWBorderBottom = 1 << 3,
    HJWBorderAll    = ~0UL
};

/**
 *  圆角类型设置
 */
typedef NS_OPTIONS(NSUInteger, HJWCorner) {
    HJWCornerLeft,
    HJWCornerRight,
    HJWCornerTop,
    HJWCornerBottom,
    HJWCornerAll,
};

@interface UIView (LYZ)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat top;

typedef void (^GestureActionBlock)(UIGestureRecognizer *ges);
/** 单点击手势 */
- (void)tapGesture:(GestureActionBlock)block;
/** 长按手势 */
- (void)longPressGestrue:(GestureActionBlock)block;

/*根据键值绑定数据*/
-(void)bindData:(NSString *)key Value:(id)value;
/*根据键值获取绑定的数据*/
-(id)getData:(NSString *)key;
/*初始化UIview方法*/
+(instancetype)ViewWithFrame:(CGRect)frame :(UIColor*)bcolor;
/*初始化横线方法*/
+(instancetype)lineViewWithx:(float)linex y:(float)liney wight:(float)wight :(UIColor*)linecolor;
/*初始化竖线方法*/
+(instancetype)lineViewWithx:(float)linex y:(float)liney height:(float)lineheight :(UIColor*)linecolor;

//视图图层摇晃震动动画
+(void)startShake:(UIView*)shakeView;

/** 变圆 */
- (UIView *)roundV;

- (void)addShadow;

/** 移除对应的view */
- (void)removeClassView:(Class)classV;

/** 添加边框:四边 */
- (void)border:(UIColor *)color width:(CGFloat)width CornerRadius:(CGFloat)radius;
/** 添加边框:四边 默认4*/
- (void)border:(UIColor *)color width:(CGFloat)width;
/** 四边变圆 */
- (void)borderRoundCornerRadius:(CGFloat)radius;
/** 四边变圆 默认4*/
- (void)borderRound;

/** 利用mask设置圆角 */
- (void)hjw_setCornerWithType:(HJWCorner)cornerType cornerRadius:(CGFloat)radius;
/** 边框 设置好frame再设置边框 */
- (void)hjw_setBorders:(HJWBorder)Borders color:(UIColor*) color width:(CGFloat) width;


@end
