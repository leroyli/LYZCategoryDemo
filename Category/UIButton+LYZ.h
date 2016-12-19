//
//  UIButton+LYZ.h
//  LYCategoriesDemo
//
//  Created by artios on 2016/12/8.
//  Copyright © 2016年 artios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (LYZ)


/*根据键值绑定数据*/
-(void)bindData:(NSString *)key Value:(id)value;
/*根据键值获取绑定的数据*/
-(id)getData:(NSString *)key;
/*移除数据绑定*/
-(void)removeData;

/* backgroundimage*/
+(instancetype)ButtonWithFrame:(CGRect)frame Normal:(UIImage *)normal Select:(UIImage *)select Title:(NSString *)title;

/*setimage*/
+(instancetype)ButtonimageWithFrame:(CGRect)frame Normal:(UIImage *)normal Select:(UIImage *)select Title:(NSString *)title;

+(instancetype)ButtonLeftIconAndRightTtitleWithFrame:(CGRect)frame LeftIcon:(UIImage *)iconImage  BGColor:(UIColor*)bgcolor Title:(NSString *)title TitleColor:(UIColor*)textcolor;

+(instancetype)ButtonLeftTtitleAndRightIconTtitleWithFrame:(CGRect)frame RightIcon:(UIImage *)iconImage  BGColor:(UIColor*)bgcolor Title:(NSString *)title TitleColor:(UIColor*)textcolor;


/*虚线边框的UIButton*/
+(instancetype)dashedLineButtonWithFrame:(CGRect)frame Title:(NSString *)title Title:(UIColor *)MainColor;




/*-------------------------------------------------------------*/

/* 防止button重复点击，设置间隔 */
@property (nonatomic, assign) NSTimeInterval mm_acceptEventInterval;

@end
