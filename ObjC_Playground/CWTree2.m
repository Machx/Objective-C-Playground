/*
//  CWTree2.m
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

#import "CWTree2.h"

#pragma mark CFTree Callbacks -

static const void* CWTree2Retain(const void *ptr) {
	return CFBridgingRetain((__bridge id)ptr);
}

static void CWTree2Release(const void *ptr) {
	CFBridgingRelease(ptr);
}

static CFStringRef CWTree2CopyDescription(const void *ptr) {
	NSObject *event = (__bridge NSObject *)ptr;
	CFStringRef description = (__bridge_retained CFStringRef)[event description];
	return description;
}

#pragma mark CWTree2 implementation -

@interface CWTree2()
@property(nonatomic,assign) CFTreeRef tree;
@end

@implementation CWTree2

- (id)init {
    self = [super init];
    if (self == nil) return self;
	
	CFTreeContext context = {
		.version = 0,
		.info = NULL,
		.retain = CWTree2Retain,
		.release = CWTree2Release,
		.copyDescription = CWTree2CopyDescription
	};
	
	_tree = CFTreeCreate(kCFAllocatorDefault, &context);
	
    return self;
}

-(id)initWithRootObject:(id)object {
	self = [super init];
	if(self == nil) return nil;
	
	CFTreeContext context = {
		.version = 0,
		.info = object,
		.retain = CWTree2Retain,
		.release = CWTree2Release,
		.copyDescription = CWTree2CopyDescription
	};
	
	_tree = CFTreeCreate(kCFAllocatorDefault, &context);
	
	return self;
}

@end
