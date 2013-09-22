/*
//  CWBinaryHeap.h
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

#import <Foundation/Foundation.h>

/**
 -init should not be used for CWBinaryHeap. If you should use this, then the
 method logs an assertion and calls abort().
 */

@interface CWBinaryHeap : NSObject

/**
 Designated Initializer for CWBinaryHeap
 
 This method iniitalizes the CWBinaryHeap instance. The block passed in to this
 method must accurately compare the objects you intend to store in the heap. 
 The reason for this is that the compare block is used in many operations that
 make this structure efficient. For example when comparing objects this block is
 called to compare objects. So if this block is not accurate the objects added
 to it may not be stored efficiently and methods like -containsObject: may not
 return reliable results.
 
 @param block A block used to compare the contents. Must not be nil.
 @return a newly initialized CWBinaryHeap instance
 */
-(id)initWithSortBlock:(NSComparisonResult (^)(id obj1, id obj2))block;

/**
 Add the object to the binary heap
 
 This method adds the object to the binary heap instance. The object must not be
 nil, otherwise CWAssert will log an assert message and call abort().
 
 @param object The object to be added to the heap. Must not be nil.
 */
-(void)addObject:(id)object;

/**
 Returns the count of objects in the receiver binary heap
 
 This method is a wrapper around CFBinaryHeapGetCount() passing in the internal
 CFBinaryHeap instance.
 
 @return count the number of objects contained in the CWBinaryHeap instance
 */
-(NSUInteger)count;

/**
 Returns an array of all the objects in the receiver
 
 If there are objects contained in the receiver this returns an array containing
 those objects. If the receiver has no objects contained in it then it returns
 an empty array.
 
 @return an array with all the objects in the receiver or an empty array
 */
-(NSArray *)allObjects;

/**
 Returns a BOOL indicating if the object passed in is contained in the receiver
 
 This method is dependent on the block that you passed in -initWithSortBlock:
 being accurate. The internal CFBinaryHeap instance calls a callback method
 which then calls the block you passed in. As long as that block correctly 
 returns NSOrderedSame when object and an instance in the CFBinaryHeap are the 
 same then this method will return YES. Otherwise if the block isn't accurate
 then this method might return incorrect results.
 
 @return a BOOL indicating if the passed in object is contained in the receiver
 */
-(BOOL)containsObject:(id)object;

-(id)removeMinimumValue;

-(void)removeAllObjects;

@end
