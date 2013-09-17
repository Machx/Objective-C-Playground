//
//  CWBinaryHeapTests.m
//  ObjC_Playground
//
//  Created by Colin Wheeler on 7/12/13.
//  Copyright (c) 2013 Colin Wheeler. All rights reserved.
//

#import "CWBinaryHeapTests.h"
#import "CWBinaryHeap.h"

SpecBegin(CWBinaryHeap)

it(@"should have correct count", ^{
	CWBinaryHeap *heap = [[CWBinaryHeap alloc] initWithSortBlock:^NSComparisonResult(id obj1, id obj2) {
		return NSOrderedSame;
	}];
	
	expect(heap.count == 0).to.beTruthy();
	
	[heap addObject:@"hello"];
	
	expect(heap.count == 1).to.beTruthy();
});

it(@"should sort", ^{
	CWBinaryHeap *heap = [[CWBinaryHeap alloc] initWithSortBlock:^NSComparisonResult(id obj1, id obj2) {
		NSLog(@"called with 1: %@ and 2: %@",obj1,obj2);
		return [obj1 compare:obj2];
	}];
	
	[heap addObject:@1];
	[heap addObject:@2];
	[heap addObject:@3];
	[heap addObject:@4];
	[heap addObject:@5];
	
	
});

SpecEnd
