//
//  CWPriorityQueue.m
//  ObjC_Playground
//
//  Created by Colin Wheeler on 11/23/13.
//  Copyright (c) 2013 Colin Wheeler. All rights reserved.
//

#import "CWPriorityQueue2.h"
#import "CWBinaryHeap.h"
//#import <Zangetsu/CWAssertionMacros.h>
#import <objc/runtime.h>

#define CWAssert(expression, ...) \
do { \
    if(!(expression)) { \
        NSLog(@"Assertion Failure '%s' in %s on line %s:%d. %@", #expression, __func__, __FILE__, __LINE__, [NSString stringWithFormat: @"" __VA_ARGS__]); \
        abort(); \
    } \
} while(0)

void *kCWPriorityQueue2ObjKey = &kCWPriorityQueue2ObjKey;

@interface CWPriorityQueue2 ()
@property(strong) CWBinaryHeap *heap;
@end

@implementation CWPriorityQueue2

-(instancetype)init {
    self = [super init];
    if(!self) return self;
    
    _heap = [[CWBinaryHeap alloc] initWithSortBlock:^NSComparisonResult(id obj1, id obj2) {
        return [(NSNumber *)obj1 compare:(NSNumber *)obj2];
    }];
    
    return self;
}

-(void)enqueue:(id)obj withPriority:(NSNumber *)priority {
    CWAssert(obj != nil);
    CWAssert(priority != nil);
    //set the object as an associated object on the NSNumber (priority) object
    objc_setAssociatedObject(priority, kCWPriorityQueue2ObjKey, obj, OBJC_ASSOCIATION_RETAIN);
    [self.heap addObject:priority];
}

-(id)dequeue {
    id dequeued = [self.heap removeMinimumValue];
    if (dequeued) {
        id dequeuedValue = objc_getAssociatedObject(dequeued, kCWPriorityQueue2ObjKey);
        objc_setAssociatedObject(dequeued, kCWPriorityQueue2ObjKey, nil, OBJC_ASSOCIATION_RETAIN);
        return dequeuedValue;
    }
    return nil;
}

@end
