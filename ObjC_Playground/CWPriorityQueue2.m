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

//@interface CWPriorityQueue2Node : NSObject
//@property(strong) id containedValue;
//@property(strong) NSNumber *priority;
//@end

//@implementation CWPriorityQueue2Node
//
//@end

void *kCWPriorityQueue2ObjKey = &kCWPriorityQueue2ObjKey;

@interface CWPriorityQueue2 ()
@property(strong) CWBinaryHeap *heap;
@end

@implementation CWPriorityQueue2

-(instancetype)init {
    self = [super init];
    if(!self) return self;
    
    _heap = [[CWBinaryHeap alloc] initWithSortBlock:^NSComparisonResult(id obj1, id obj2) {
        //CWPriorityQueue2Node *node1 = (CWPriorityQueue2Node *)obj1;
        //CWPriorityQueue2Node *node2 = (CWPriorityQueue2Node *)obj2;
        NSNumber *obj1Priority = objc_getAssociatedObject(obj1, kCWPriorityQueue2ObjKey);
        NSNumber *obj2Priority = objc_getAssociatedObject(obj2, kCWPriorityQueue2ObjKey);
        return [obj1Priority compare:obj2Priority];
    }];
    
    return self;
}

-(void)enqueue:(id)obj withPriority:(NSNumber *)priority {
    //CWPriorityQueue2Node *node = [CWPriorityQueue2Node new];
    //node.containedValue = obj;
    //node.priority = priority;
    //[self.heap addObject:node];
    objc_setAssociatedObject(obj, kCWPriorityQueue2ObjKey, priority, OBJC_ASSOCIATION_RETAIN);
    [self.heap addObject:obj];
}

-(id)dequeue {
    //CWPriorityQueue2Node *node = [self.heap removeMinimumValue];
    //return node.containedValue;
    id dequeued = [self.heap removeMinimumValue];
    objc_setAssociatedObject(dequeued, kCWPriorityQueue2ObjKey, nil, OBJC_ASSOCIATION_RETAIN);
    return dequeued;
}

@end
