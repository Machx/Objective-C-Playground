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

@interface CWBinaryHeap : NSObject

//designated initializer
//
-(id)initWithSortBlock:(NSComparisonResult (^)(id obj1, id obj2))block;
//-(id)initWithSortBlock:(NSComparisonResult (^)(const void *ptr1, const void *ptr2, void *context))block;

//objects added here must respond to -compare: if not using -initWithSortBlock:
//otherwise this data structure treats all objects as having the same value
//therefore any benefits of the data structure are lost as a result
-(void)addObject:(id)object;

-(NSUInteger)count;

-(NSArray *)allObjects;

-(void)removeAllObjects;

@end
