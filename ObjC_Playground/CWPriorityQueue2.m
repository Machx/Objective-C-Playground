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
    NSArray *values = [self.heap allObjects];
    __block BOOL contains = NO;
    [values enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        id storedObject = objc_getAssociatedObject(obj, kCWPriorityQueue2ObjKey);
        if ([storedObject isEqual:object]) {
            contains = YES;
            *stop = YES;
        }
    }];
    return contains;
}

@end
