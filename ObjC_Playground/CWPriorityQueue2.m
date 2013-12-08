//
//  CWPriorityQueue.m
//  ObjC_Playground
//
//  Created by Colin Wheeler on 11/23/13.
//  Copyright (c) 2013 Colin Wheeler. All rights reserved.
//

#import "CWPriorityQueue2.h"
#import "CWBinaryHeap.h"
#import <Zangetsu/CWAssertionMacros.h>
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
        if (obj1Priority && obj2Priority) {
            return [obj1Priority compare:obj2Priority];
        }
        return [obj1 compare:obj2];
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
    id dequeuedValue = objc_getAssociatedObject(dequeued, kCWPriorityQueue2ObjKey);
    objc_setAssociatedObject(dequeued, kCWPriorityQueue2ObjKey, nil, OBJC_ASSOCIATION_RETAIN);
    return dequeuedValue;
}

-(BOOL)containsObject:(id)object {
    /* 
     This is really inefficient and shoudl probably
     be scrapped, due to the potential downsides it has. 
     This method basically allocates memory for all the 
     objects contained in the receiver into a new array
     then searches that array for the object and throws
     the allocated array away when done.
     */
    return [[self.heap allObjects] containsObject:object];
}

@end
