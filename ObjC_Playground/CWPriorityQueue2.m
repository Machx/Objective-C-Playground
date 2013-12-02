//
//  CWPriorityQueue.m
//  ObjC_Playground
//
//  Created by Colin Wheeler on 11/23/13.
//  Copyright (c) 2013 Colin Wheeler. All rights reserved.
//

#import "CWPriorityQueue2.h"
#import "CWBinaryHeap.h"
#import <objc/runtime.h>

void *kCWPriorityQueue2ObjKey = &kCWPriorityQueue2ObjKey;

@interface CWPriorityQueue2 ()
@property(strong) CWBinaryHeap *heap;
@end

@implementation CWPriorityQueue2

-(instancetype)init {
    self = [super init];
    if(!self) return self;
    
    _heap = [[CWBinaryHeap alloc] initWithSortBlock:^NSComparisonResult(id obj1, id obj2) {
        NSNumber *obj1Priority = objc_getAssociatedObject(obj1, kCWPriorityQueue2ObjKey);
        NSNumber *obj2Priority = objc_getAssociatedObject(obj2, kCWPriorityQueue2ObjKey);
        return [obj1Priority compare:obj2Priority];
    }];
    
    return self;
}

-(void)enqueue:(id)obj withPriority:(NSNumber *)priority {
    objc_setAssociatedObject(obj, kCWPriorityQueue2ObjKey, priority, OBJC_ASSOCIATION_RETAIN);
    [self.heap addObject:obj];
}

-(id)dequeue {
    id dequeued = [self.heap removeMinimumValue];
    objc_setAssociatedObject(dequeued, kCWPriorityQueue2ObjKey, nil, OBJC_ASSOCIATION_RETAIN);
    return dequeued;
}

-(BOOL)containsObject:(id)object {
    return [self.heap containsObject:object];
}

@end
