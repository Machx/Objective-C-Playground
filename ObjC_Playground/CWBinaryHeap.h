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

-(NSArray *)allObjects;

-(BOOL)containsObject:(id)object;

-(id)removeMinimumValue;

-(void)removeAllObjects;

@end
