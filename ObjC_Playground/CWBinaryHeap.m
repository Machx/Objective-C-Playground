/*
//  CWBinaryHeap.m
//  ObjC_Playground
//
//  Created by Colin Wheeler on 7/10/13.
//  Copyright (c) 2013 Colin Wheeler. All rights reserved.
//
 
 Copyright (c) 2013, Colin Wheeler
 All rights reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 
 - Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.
 
 - Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation
 and/or other materials provided with the distribution.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "CWBinaryHeap.h"
#import <Zangetsu/CWAssertionMacros.h>
#import "CWLogging.h"

#pragma callbacks

static const void* CWBinaryHeapRetain(CFAllocatorRef allocator, const void *ptr) {
	return CFBridgingRetain((__bridge id)ptr);
}

static void CWBinaryHeapRelease(CFAllocatorRef allocator, const void *ptr) {
	CFBridgingRelease(ptr);
}

static CFStringRef CWBinaryHeapCopyDescription(const void *ptr) {
	NSObject *event = (__bridge NSObject *)ptr;
	CFStringRef description = (__bridge_retained CFStringRef)[event description];
	return description;
}

//static CFComparisonResult CWBinaryHeapCompare(const void *ptr1, const void *ptr2, void *context) {
//	NSObject *obj1 = (__bridge NSObject *)ptr1;
//	NSObject *obj2 = (__bridge NSObject *)ptr2;
//	
//	if ([obj1 respondsToSelector:@selector(compare:)]) {
//		return [(id)obj1 compare:(id)obj2];
//	}
//	
//	CWLogInfo(@"Object does not respond to the -compare message. The benefits of this data structure have been lost.");
//	return kCFCompareEqualTo;
//}

#pragma class extension

@interface CWBinaryHeap ()
@property(nonatomic,assign) CFBinaryHeapRef heap;
@property(nonatomic,copy) NSComparisonResult (^userSortBlock)(id obj1,id obj2);
@end

@implementation CWBinaryHeap

-(id)init {
	CWAssert(0,@"Call -initWithSortBlock: not -init");
	return nil;
}

-(id)initWithSortBlock:(NSComparisonResult (^)(id obj1, id obj2))block {
	//CWAssert(block != nil);
	
	self = [super init];
	if (self == nil) return self;
	
	//block based sort is a work in progress
	_userSortBlock = block;
	
	CFBinaryHeapCallBacks callBacks;
	callBacks.version = 0;
	callBacks.retain = CWBinaryHeapRetain;
	callBacks.release = CWBinaryHeapRelease;
	callBacks.copyDescription = CWBinaryHeapCopyDescription;
	callBacks.compare = CWBinaryHeapCompare;
	
	NSUInteger capacity = 0;
	
	_heap = CFBinaryHeapCreate(kCFAllocatorDefault, capacity, &callBacks, NULL);
	
	return self;
}

-(void)addObject:(id)object {
	CWAssert(object != nil);
	CFBinaryHeapAddValue(self.heap, (__bridge const void *)(object));
}

-(NSUInteger)count {
	return (NSUInteger)CFBinaryHeapGetCount(self.heap);
}

-(NSArray *)allObjects {
	const void **carray = calloc(CFBinaryHeapGetCount(self.heap), sizeof(void *));
	CFBinaryHeapGetValues(self.heap, carray);
	
	NSArray *values = [NSArray arrayWithObjects:(__unsafe_unretained id *)(void *)carray
										  count:CFBinaryHeapGetCount(self.heap)];
	
	free(carray);
	
	return values;
}

-(void)removeAllObjects {
	CFBinaryHeapRemoveAllValues(self.heap);
}

-(void)dealloc {
	CFRelease(_heap);
}

@end
