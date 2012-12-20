//
//  CWPriorityQueueTests.m
//  ObjC_Playground
//
//  Created by Colin Wheeler on 12/19/12.
//  Copyright (c) 2012 Colin Wheeler. All rights reserved.
//

#import "CWPriorityQueueTests.h"
#import "CWPriorityQueue.h"

@implementation CWPriorityQueueTests

-(void)testBasicPushAndPop
{
	CWPriorityQueue *queue = [CWPriorityQueue new];
	
	[queue addItem:@"1" withPriority:1];
	[queue addItem:@"5" withPriority:5];
	[queue addItem:@"3" withPriority:3];
	
	STAssertTrue([@"1" isEqualToString:[queue pop]], nil);
	STAssertTrue([@"3" isEqualToString:[queue pop]], nil);
	STAssertTrue([@"5" isEqualToString:[queue pop]], nil);
}

@end
