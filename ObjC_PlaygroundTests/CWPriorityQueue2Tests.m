//
//  CWPriorityQueue2Tests.m
//  ObjC_Playground
//
//  Created by Colin Wheeler on 11/24/13.
//  Copyright (c) 2013 Colin Wheeler. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CWPriorityQueue2.h"

SpecBegin(CWPriorityQueue2)

it(@"should dequeue objects in order", ^{
    CWPriorityQueue2 *queue = [[CWPriorityQueue2 alloc] init];
    
    [queue enqueue:@45 withPriority:@45];
    [queue enqueue:@54 withPriority:@54];
    [queue enqueue:@22 withPriority:@22];
    [queue enqueue:@31 withPriority:@31];
    [queue enqueue:@90 withPriority:@90];
    [queue enqueue:@10 withPriority:@10];
    
    expect([queue dequeue]).to.equal(@10);
    expect([queue dequeue]).to.equal(@22);
    expect([queue dequeue]).to.equal(@31);
    expect([queue dequeue]).to.equal(@45);
    expect([queue dequeue]).to.equal(@54);
    expect([queue dequeue]).to.equal(@90);
});

it(@"should correctly report if an object is contained in the queue", ^{
    CWPriorityQueue2 *queue = [[CWPriorityQueue2 alloc] init];
    
    [queue enqueue:@45 withPriority:@45];
    [queue enqueue:@54 withPriority:@54];
    [queue enqueue:@22 withPriority:@22];
    [queue enqueue:@31 withPriority:@31];
    [queue enqueue:@90 withPriority:@90];
    [queue enqueue:@10 withPriority:@10];
    
    expect([queue containsObject:@31]).to.beTruthy();
    expect([queue containsObject:@99]).to.beFalsy();
});

it(@"should return nil from dequeue with 0 objects", ^{
    CWPriorityQueue2 *queue = [[CWPriorityQueue2 alloc] init];
    
    expect([queue dequeue]).to.beNil();
});

SpecEnd
