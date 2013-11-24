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
    
    [queue enqueue:@45];
    [queue enqueue:@54];
    [queue enqueue:@22];
    [queue enqueue:@31];
    [queue enqueue:@90];
    [queue enqueue:@10];
    
    expect([queue dequeue]).to.equal(@10);
    expect([queue dequeue]).to.equal(@22);
    expect([queue dequeue]).to.equal(@31);
    expect([queue dequeue]).to.equal(@45);
    expect([queue dequeue]).to.equal(@54);
    expect([queue dequeue]).to.equal(@90);
});

SpecEnd