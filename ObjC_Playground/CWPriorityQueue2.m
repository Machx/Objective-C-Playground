//
//  CWPriorityQueue.m
//  ObjC_Playground
//
//  Created by Colin Wheeler on 11/23/13.
//  Copyright (c) 2013 Colin Wheeler. All rights reserved.
//

#import "CWPriorityQueue2.h"
#import "CWBinaryHeap.h"

@interface CWPriorityQueue2Node : NSObject
@property(strong) id containedValue;
@property(strong) NSNumber *priority;
@end

@implementation CWPriorityQueue2Node

@end

@interface CWPriorityQueue2 ()
@property(strong) CWBinaryHeap *heap;
@end

@implementation CWPriorityQueue2

-(instancetype)init {
    self = [super init];
    if(!self) return self;
    
    _heap = [[CWBinaryHeap alloc] initWithSortBlock:^NSComparisonResult(id obj1, id obj2) {
        CWPriorityQueue2Node *node1 = (CWPriorityQueue2Node *)obj1;
        CWPriorityQueue2Node *node2 = (CWPriorityQueue2Node *)obj2;
        return [node1.priority compare:node2.priority];
    }];
    
    return self;
}

-(void)enqueue:(id)obj withPriority:(NSNumber *)priority {
    CWPriorityQueue2Node *node = [CWPriorityQueue2Node new];
    node.containedValue = obj;
    node.priority = priority;
    [self.heap addObject:node];
}

-(id)dequeue {
    CWPriorityQueue2Node *node = [self.heap removeMinimumValue];
    return node.containedValue;
}

@end
