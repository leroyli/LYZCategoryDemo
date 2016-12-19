//
//  NSMutableArray+LYZ.m
//  LYCategoriesDemo
//
//  Created by artios on 2016/12/6.
//  Copyright © 2016年 artios. All rights reserved.
//

#import "NSMutableArray+LYZ.h"
#import <objc/runtime.h>

@implementation NSMutableArray (LYZ)

+(void)load {
    Method fromMethod = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(objectAtIndex:));
    Method toMethod = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(em_objectAtIndex:));
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


@end
