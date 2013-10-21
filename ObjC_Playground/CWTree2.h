/*
//  CWTree2.h
//  ObjC_Playground
//
//  Created by Colin Wheeler on 8/11/13.
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
 CWTree2 
 
 CWTree2 is an experiment to wrap an objective-c class around CFTreeRef to
 support containing Objective-C objects and enable features like block based
 enumeration.
 */

/**
 Appends a given CFTreeRef with a new CFTreeRef child containing object
 
 @param root the CFTreeRef you whish to append with a child. Must not be NULL.
 @param object the object with which to append to root. Must not be nil.
 */
void CWTreeAppendWithChild(CFTreeRef root, id object);

@interface CWTree2 : NSObject

-(instancetype)initWithRootObject:(id)object;

@property(nonatomic,readonly,assign) CFTreeRef tree;

-(id)rootObject;

-(void)appendToRoot:(id)object;

-(void)enumerateObjectsInTreeUsingBlock:(void (^)(id obj, CFTreeRef tree, BOOL *stop))block;

@end
