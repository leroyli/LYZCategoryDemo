//
//  NSArray+LYZ.m
//  LYCategoriesDemo
//
//  Created by artios on 2016/12/6.
//  Copyright © 2016年 artios. All rights reserved.
//

#import "NSArray+LYZ.h"
#import <objc/runtime.h>

@implementation NSArray (LYZ)

/**
 * 判断
 */
+(void)load {
    Method fromMethod = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(objectAtIndex:));
    Method toMethod = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(em_objectAtIndex:));
    method_exchangeImplementations(fromMethod, toMethod);
}

- (void)em_objectAtIndex:(NSUInteger)index {
    if (self.count - 1 < index) {
        @try {
            return [self em_objectAtIndex:index];
        }
        @catch (NSException *exception) {
//            NSLog(@"-------- %s Crash Because Method %s -------\n",class_getName(self.class),__func__);
//            NSLog(@"%@", [exception callStackSymbols]);
        }
        @finally {
            
        }
    }else {
        return [self em_objectAtIndex:index];
    }
}

- (id)objectAtIndexCheck:(NSUInteger)index {
    if (index < self.count) {
        return self[index];
    } else {
        //数组越界了就返回nil
        return nil;
    }
}
/**
 *  [self isKindOfClass:[NSArray class]]
 */
- (BOOL)isAClass {
    return [self isKindOfClass:[NSArray class]];
}

/**
 *  数组 转为 JsonStr
 */
- (NSString *)jsonStr {
    return [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:self options:0 error:NULL] encoding:NSUTF8StringEncoding];
}
/**
 *  合并成用，逗号隔开的字符创
 */
- (NSString *)combinStr {
    return [self componentsJoinedByString:@","];
}

/**
 *  请接收返回的数组 按 字段 给数组排序
 */
- (NSArray *)sortbyKey:(NSString *)key asc:(BOOL)ascend {
    return [self sortedArrayUsingDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:key ascending:ascend]]];
}

#pragma mark 数组比较
- (BOOL)compareIgnoreObjectOrderWithArray:(NSArray *)array {
    NSSet *set1 = [NSSet setWithArray:self];
    NSSet *set2 = [NSSet setWithArray:array];
    return [set1 isEqualToSet:set2];
}

/**
 *  数组计算交集
 */
- (NSArray *)arrayForIntersectionWithOtherArray:(NSArray *)otherArray {
    NSMutableArray *intersectionArray = [NSMutableArray array];
    if (self.count == 0) return nil;
    if (otherArray == nil) return nil;
    //遍历
    for (id obj in self) {
        if (![otherArray containsObject:obj]) continue;
        //添加
        [intersectionArray addObject:obj];
    }
    
    return intersectionArray;
}

/**
 *  数据计算差集
 */
- (NSArray *)arrayForMinusWithOtherArray:(NSArray *)otherArray {
    if (self == nil) return nil;
    if (otherArray == nil) return self;
    NSMutableArray *minusArray = [NSMutableArray arrayWithArray:self];
    //遍历
    for (id obj in otherArray) {
        if (![self containsObject:obj]) continue;
        //添加
        [minusArray removeObject:obj];
    }
    return minusArray;
}


@end
