//
//  UILabel+LYZ.h
//  LYCategoriesDemo
//
//  Created by artios on 2016/12/8.
//  Copyright © 2016年 artios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LYZ)

+(instancetype)LabelWithFrame:(CGRect)frame text:(NSString*)textString color:(UIColor*)textColor font:(float)textfont;
+(instancetype)leftLabelWithFrame:(CGRect)frame text:(NSString*)textString color:(UIColor*)textColor font:(float)textfont;
+(instancetype)RightLabelWithFrame:(CGRect)frame text:(NSString*)textString color:(UIColor*)textColor font:(float)textfont;

+(instancetype)RightLabelFontWithFrame:(CGRect)frame text:(NSString*)textString color:(UIColor*)textColor fontName:(UIFont*)textfont;
+(instancetype)LabelFontWithFrame:(CGRect)frame ali:(NSTextAlignment)aligment text:(NSString*)textString color:(UIColor*)textColor fontName:(UIFont*)textfont;


+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont*)font;

+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font;


@end
