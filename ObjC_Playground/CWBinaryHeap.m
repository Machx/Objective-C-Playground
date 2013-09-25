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

#pragma class extension

@interface CWBinaryHeap ()
@property(nonatomic,assign) CFBinaryHeapRef heap;
@property(nonatomic,copy) NSComparisonResult (^userSortBlock)(id obj1,id obj2);
@end

#pragma Node

@interface CWBinaryHeapNode : NSObject
@property(strong) id data;
@property(weak) CWBinaryHeap *parent;
+(instancetype)nodeWithData:(id)data;
@end

@implementation CWBinaryHeapNode

- (id)init {
    self = [super init];
    if (!self) return nil;
	
	_data = nil;
	_parent = nil;
	
    return self;
}

+(instancetype)nodeWithData:(id)data {
	CWAssert(data != nil);
	CWBinaryHeapNode *node = [self new];
	node.data = data;
	return node;
}

-(NSString *)debugDescription {
	return [NSString stringWithFormat:@"%@: (Value: %@\nParent: %@",
			self.class,
			self.data,
			self.parent];
}

-(BOOL)isEqual:(id)object {
	if ([object isMemberOfClass:[self class]]) {
		CWBinaryHeapNode *node = (CWBinaryHeapNode *)object;
		//TODO: also should compare parent pointer
		return [self.data isEqual:node.data];
	}
	return NO;
}

@end

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

static CFComparisonResult CWBinaryHeapCompare(const void *ptr1, const void *ptr2, void *context) {
	CWBinaryHeapNode *obj1 = (__bridge CWBinaryHeapNode *)ptr1;
	CWBinaryHeapNode *obj2 = (__bridge CWBinaryHeapNode *)ptr2;
	
	if (obj1.parent.userSortBlock) {
		return obj1.parent.userSortBlock(obj1.data,obj2.data);
	}
	
	if ([obj1.data respondsToSelector:@selector(compare:)]) {
		return [(id)obj1.data compare:(id)obj2.data];
	}
	
	CWLogInfo(@"No sort block present...calling abort()");
	CWAssert(0);
	
	return kCFCompareEqualTo;
}

@implementation CWBinaryHeap

-(id)init {
	CWAssert(0,@"Call -initWithSortBlock: not -init");
	return nil;
}

-(id)initWithSortBlock:(NSComparisonResult (^)(id obj1, id obj2))block {
	CWAssert(block != nil);
	
	self = [super init];
	if (!self) return self;
	
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

-(BOOL)isEqual:(id)object {
	if ([object isMemberOfClass:[self class]]) {
		CWBinaryHeap *otherHeap = (CWBinaryHeap *)object;
		return (CFHash(self.heap) == CFHash(otherHeap.heap));
	}
	return NO;
}

-(NSUInteger)hash {
	//have to be careful here since CFIndex is signed and NSUInteger is unsigned
	//take the best route we can and return a typecast value if the value is
	//greater than 0, otherwise we just bail and return 0 rather than returning
	//a negative number which will get clobbered in the conversion processess
	CFIndex hash = CFHash(self.heap);
	if (hash > 0) return (NSUInteger)hash;
	return 0;
}

-(void)addObject:(id)object {
	CWAssert(object != nil);
	CWBinaryHeapNode *node = [CWBinaryHeapNode nodeWithData:object];
	node.parent = self;
	CFBinaryHeapAddValue(self.heap, (__bridge const void *)(node));
}

-(NSInteger)count {
	return (NSInteger)CFBinaryHeapGetCount(self.heap);
}

-(NSArray *)allObjects {
	CFIndex count = CFBinaryHeapGetCount(self.heap);
	
	if (count == 0) return [NSArray array];
	
	const void **carray = calloc(count, sizeof(void *));
	CFBinaryHeapGetValues(self.heap, carray);
	
	NSArray *values = [NSArray arrayWithObjects:(__unsafe_unretained id *)(void *)carray
										  count:count];
	
	free(carray);
	
	NSMutableArray *extractedValues = [NSMutableArray array];
	
	for (CWBinaryHeapNode *node in values) {
		[extractedValues addObject:node.data];
	}
	
	return extractedValues;
}

-(id)removeMinimumValue {
	const void **value = calloc(1, sizeof(void *));
	if (CFBinaryHeapGetMinimumIfPresent(self.heap, value)) {
		NSArray *extracted = [NSArray arrayWithObjects:(__unsafe_unretained id *)(void *)value
												 count:1];
		CWBinaryHeapNode *node = extracted[0];
		free(value);
		CFBinaryHeapRemoveMinimumValue(self.heap);
		return node.data;
	}
	CWLogInfo(@"%@: No minimum value present",[self class]);
	free(value);
	return nil;
}

-(BOOL)containsObject:(id)object {
	CWBinaryHeapNode *node = [CWBinaryHeapNode nodeWithData:object];
	return CFBinaryHeapContainsValue(self.heap, (__bridge const void *)(node));
}

-(void)removeAllObjects {
	CFBinaryHeapRemoveAllValues(self.heap);
}

-(void)dealloc {
	CFRelease(_heap); _heap = NULL;
}

@end
