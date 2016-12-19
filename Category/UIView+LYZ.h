//
//  UIView+LYZ.h
//  LYCategoriesDemo
//
//  Created by artios on 2016/12/6.
//  Copyright © 2016年 artios. All rights reserved.
//

#import <UIKit/UIKit.h>

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

@end
