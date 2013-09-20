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

describe(@"-count", ^{
	it(@"should have correct count", ^{
		CWBinaryHeap *heap = [[CWBinaryHeap alloc] initWithSortBlock:^NSComparisonResult(id obj1, id obj2) {
			return NSOrderedSame;
		}];
		
		expect(heap.count == 0).to.beTruthy();
		
		[heap addObject:@"hello"];
		
		expect(heap.count == 1).to.beTruthy();
	});
});

describe(@"-removeMinimumValue:", ^{
	it(@"should remove the minimum Value & return it", ^{
		CWBinaryHeap *heap = [[CWBinaryHeap alloc] initWithSortBlock:^NSComparisonResult(id obj1, id obj2) {
			return [obj1 compare:obj2];
		}];
		
		[heap addObject:@1];
		[heap addObject:@2];
		[heap addObject:@3];
		[heap addObject:@4];
		[heap addObject:@5];
		
		expect(heap.count == 5).to.beTruthy();
		
		id minimum = [heap removeMinimumValue];
		
		expect(minimum).notTo.beNil();
		expect(minimum).to.equal(@1);
		expect(heap.count == 4).to.beTruthy();
	});
});

describe(@"-containsObject:(id)object", ^{
	it(@"should correctly report back if it contains an object", ^{
		CWBinaryHeap *heap = [[CWBinaryHeap alloc] initWithSortBlock:^NSComparisonResult(id obj1, id obj2) {
			return [obj1 compare:obj2];
		}];
		
		expect([heap containsObject:@4]).to.beFalsy();
		
		[heap addObject:@4];
		
		expect([heap containsObject:@4]).to.beTruthy();
	});
});

SpecEnd
