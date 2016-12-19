//
//  NSString+Extension.h
//  LYCategoriesDemo
//
//  Created by artios on 2016/12/6.
//  Copyright © 2016年 artios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Extension)

/**
 *  返回字符串所占用的尺寸
 *
 *  @param font    字体
 *  @param maxSize 最大尺寸
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

/**
 *  给定一个字符串隐藏部分然后重新拼接后返回
 */
-(NSString *)hindPartOfString:(NSString *)string;

- (NSString *) pinyin;
- (NSString *) pinyinInitial;

@end
