//
//  NSArray+LYZ.h
//  LYCategoriesDemo
//
//  Created by artios on 2016/12/6.
//  Copyright © 2016年 artios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (LYZ)

/**
 *  检查是否越界和NSNull如果是返回nil
 */
- (id)objectAtIndexCheck:(NSUInteger)index;

#pragma mark -
/**
 *  是否真是数组 [self isKindOfClass:[NSArray class]]
 */
@property (nonatomic, assign, readonly) BOOL isAClass;
/**
 *  数组 转为 JsonStr
 */
@property (nonatomic, copy, readonly) NSString *jsonStr;
/**
 *  合并成用，逗号隔开的字符创
 */
@property (nonatomic, copy, readonly) NSString *combinStr;
/**
 *  请接收返回的数组 按 字段 给数组排序
 */
- (NSArray *)sortbyKey:(NSString *)key asc:(BOOL)ascend;

/**
 *  数组比较
 */
- (BOOL)compareIgnoreObjectOrderWithArray:(NSArray *)array;

/**
 *  数组计算交集
 */
- (NSArray *)arrayForIntersectionWithOtherArray:(NSArray *)otherArray;

/**
 *  数据计算差集
 */
- (NSArray *)arrayForMinusWithOtherArray:(NSArray *)otherArray;


@end
