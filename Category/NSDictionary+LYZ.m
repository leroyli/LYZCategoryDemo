//
//  NSDictionary+LYZ.m
//  LYCategoriesDemo
//
//  Created by artios on 2016/12/6.
//  Copyright © 2016年 artios. All rights reserved.
//

#import "NSDictionary+LYZ.h"
#import <objc/runtime.h>

@implementation NSDictionary (LYZ)

+ (void)load {
    // 交换方法
    Method fromMethod = class_getInstanceMethod(objc_getClass("__NSDictionaryI"), @selector(setObject:forKey:));
    Method toMethod = class_getInstanceMethod(objc_getClass("__NSDictionaryI"), @selector(em_setObject:forKey:));
    method_exchangeImplementations(fromMethod, toMethod);
}

- (void)em_setObject:(id)emObject forKey:(NSString *)key {
    if (emObject == nil) {
        @try {
            [self em_setObject:emObject forKey:key];
        }
        @catch (NSException *exception) {
//            NSLog(@"---------- %s Crash Because Method %s  ----------\n", class_getName(self.class), __func__);
//            NSLog(@"%@", [exception callStackSymbols]);
            emObject = [NSString stringWithFormat:@""];
            [self em_setObject:emObject forKey:key];
        }
        @finally {}
    }else {
        [self em_setObject:emObject forKey:key];
    }
}

//字典 转为 JsonStr
- (NSString *)jsonStr {
    return [[NSString alloc] initWithData:
            [NSJSONSerialization dataWithJSONObject:self
                                            options:0
                                              error:NULL]
                                 encoding:NSUTF8StringEncoding];
}


@end
