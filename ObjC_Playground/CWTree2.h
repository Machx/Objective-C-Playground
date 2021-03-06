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
 Gets the Objective-C Object from a given CFTreeRef
 
 @param tree a valid CFTreeRef to extract the ObC object from. Must not be nil.
 @return the object from the given CFTreeRef
 */
id CWTreeGetObjectFromCFTree(CFTreeRef tree);

/**
 Appends a given CFTreeRef with a new CFTreeRef child containing object
 
 @param root the CFTreeRef you whish to append with a child. Must not be NULL.
 @param object the object with which to append to root. Must not be nil.
 */
void CWTreeAppendWithChild(CFTreeRef root, id object);

@interface CWTree2 : NSObject

/**
 Returns a new instance of CWTree2 containing object for the root node
 
 @param object a valid Objective-C Object, must not be nil.
 @return a CWTree2 instance containing object at the root node.
 */
-(instancetype)initWithRootObject:(id)object;

/**
 Reference to the root CFTreeRef node that is created for you
 
 @return the internal CFTreeRef node serving as the root node
 */
@property(nonatomic,readonly,assign) CFTreeRef tree;

/**
 Returns the root node in the given CWTree2 instance
 
 @return the Objective-C object contained in the root node of the receiver
 */
-(id)rootObject;

/**
 Appends the given objec to the root node in the tree
 
 @param object the object to be added as a child to root. Must not be nil.
 */
-(void)appendToRoot:(id)object;

/**
 Returns if the given object is contained in the receiver
 
 @return a BOOL value of YES if object is in the given tree, NO otherwise.
 */
-(BOOL)containsObject:(id)object;

/**
 Enumerates the objects in the receiver
 
 This method enumerates all the objects in the tree by enumerating over the root
 node and then adding the root nodes children (if there are any) to a queue and
 then taking the head of the queue off, enumerating over it and repeating the 
 process over and over until the queue is empty. Thus the tree is enumerated in
 a breadth first pattern.
 
 @param obj the Objective-C object being contained in the node
 @param tree the CFTreeRef node containing obj
 @param stop when this is set to YES then the search stops
 */
-(void)enumerateObjectsUsingBlock:(void (^)(id obj, CFTreeRef tree, BOOL *stop))block;

@end
