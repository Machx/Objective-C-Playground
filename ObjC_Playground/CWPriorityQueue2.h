//
//  CWPriorityQueue.h
//  ObjC_Playground
//
//  Created by Colin Wheeler on 11/23/13.
//  Copyright (c) 2013 Colin Wheeler. All rights reserved.
//

#import "CWBinaryHeap.h"

@interface CWPriorityQueue2 : NSObject

-(void)enqueue:(id)obj withPriority:(NSNumber *)priority;
-(id)dequeue;

@end
