//
//  UILabel+LYZ.m
//  LYCategoriesDemo
//
//  Created by artios on 2016/12/8.
//  Copyright © 2016年 artios. All rights reserved.
//

#import "UILabel+LYZ.h"

@implementation UILabel (LYZ)

+(instancetype)LabelWithFrame:(CGRect)frame text:(NSString*)textString color:(UIColor*)textColor font:(float)textfont
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.font = [UIFont systemFontOfSize:textfont];
    label.textColor = textColor;
    label.text = textString;
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}

+(instancetype)leftLabelWithFrame:(CGRect)frame text:(NSString*)textString color:(UIColor*)textColor font:(float)textfont
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.textColor = textColor;
    label.text = textString;
    label.font = [UIFont systemFontOfSize:textfont];
    label.textAlignment = NSTextAlignmentLeft;
    return label;
}

+(instancetype)RightLabelWithFrame:(CGRect)frame text:(NSString*)textString color:(UIColor*)textColor font:(float)textfont
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.textColor = textColor;
    label.text = textString;
    label.font = [UIFont systemFontOfSize:textfont];
    label.textAlignment = NSTextAlignmentRight;
    return label;
}


+(instancetype)RightLabelFontWithFrame:(CGRect)frame text:(NSString*)textString color:(UIColor*)textColor fontName:(UIFont*)textfont
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.textColor = textColor;
    label.text = textString;
    label.font = textfont;
    label.textAlignment = NSTextAlignmentRight;
    return label;
}
+(instancetype)LabelFontWithFrame:(CGRect)frame ali:(NSTextAlignment)aligment text:(NSString*)textString color:(UIColor*)textColor fontName:(UIFont*)textfont
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.textColor = textColor;
    label.text = textString;
    label.font = textfont;
    label.textAlignment = aligment;
    return label;
}


+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont *)font
{
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    label.text = title;
    label.font = font;
    label.numberOfLines = 0;
    [label sizeToFit];
    CGFloat height = label.frame.size.height;
    return height;
}

+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 1000, 0)];
    label.text = title;
    label.font = font;
    [label sizeToFit];
    return label.frame.size.width;
}


@end
