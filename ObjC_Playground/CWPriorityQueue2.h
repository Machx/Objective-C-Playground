//
//  CWPriorityQueue.h
//  ObjC_Playground
//
//  Created by Colin Wheeler on 11/23/13.
//  Copyright (c) 2013 Colin Wheeler. All rights reserved.
//

#import "CWBinaryHeap.h"

@interface CWPriorityQueue2 : NSObject

/**
 Enqueues the object with a given priority
 
 @param obj the item to the added to the queue
 @priority a NSNumber representing the priority. 0 is highest priority
 */
-(void)enqueue:(id)obj withPriority:(NSNumber *)priority;

/**
 Removes the item with the highest priority from the queue
 
 If multiple items all have the highest priority then this will return one of
 the high priority items.
 
 @return an item off the queue with the highest priority or nil
 */
-(id)dequeue;

@end
