//
//  CWPriorityQueue.m
//  ObjC_Playground
//
//  Created by Colin Wheeler on 11/23/13.
//  Copyright (c) 2013 Colin Wheeler. All rights reserved.
//

#import "CWPriorityQueue2.h"
#import "CWBinaryHeap.h"

@interface CWPriorityQueue2 ()
@property(strong) CWBinaryHeap *heap;
@end

@implementation CWPriorityQueue2

-(instancetype)init {
    self = [super init];
    
    _heap = [[CWBinaryHeap alloc] initWithSortBlock:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2];
    }];
    
    return self;
}

@end
