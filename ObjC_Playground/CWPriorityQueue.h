//
//  CWPriorityQueue.h
//  ObjC_Playground
//
//  Created by Colin Wheeler on 12/18/12.
//  Copyright (c) 2012 Colin Wheeler. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 experimental priority queue implementation
 */

@interface CWPriorityQueue : NSObject

-(void)addItem:(id)item //lower the # higher the priority
  withPriority:(NSUInteger)priority;

-(id)dequeue;

-(NSSet *)allObjectsOfPriority:(NSUInteger)priority;

@end
