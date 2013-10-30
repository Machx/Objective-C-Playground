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

//Part of framework or standalone
#import <Zangetsu/CWAssertionMacros.h>
//#import "CWAssertionMacros.h"

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

/**
 Appends a given CFTreeRef with a new CFTreeRef child containing object
 
 @param root the CFTreeRef you whish to append with a child. Must not be NULL.
 @param object the object with which to append to root. Must not be nil.
 */
void CWTreeAppendWithChild(CFTreeRef root, id object) {
	CWAssert(root != NULL);
	CWAssert(object != nil);
	
	CFTreeContext context = {
		.version = 0,
		.info = (__bridge void *)object,
		.retain = CWTree2Retain,
		.release = CWTree2Release,
		.copyDescription = CWTree2CopyDescription
	};
	
	CFTreeRef tree = CFTreeCreate(kCFAllocatorDefault, &context);
	
	CFTreeAppendChild(root, tree);
}

id CWTreeGetObjectFromCFTree(CFTreeRef tree) {
	CWAssert(tree != NULL);
	CWAssert(CFGetTypeID(tree) == CFTreeGetTypeID());
	CFTreeContext context;
	CFTreeGetContext(tree, &context);
	id object = (__bridge id)context.info;
	return object;
}

@interface CWTree2()
@property(nonatomic,readwrite,assign) CFTreeRef tree;
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

-(instancetype)initWithRootObject:(id)object {
	CWAssert(object != nil);
	
	self = [super init];
	if(self == nil) return nil;
	
	CFTreeContext context = {
		.version = 0,
		.info = (__bridge void *)object,
		.retain = CWTree2Retain,
		.release = CWTree2Release,
		.copyDescription = CWTree2CopyDescription
	};
	
	_tree = CFTreeCreate(kCFAllocatorDefault, &context);
	
	return self;
}

-(id)rootObject {
	if(self.tree == NULL) return nil;
	id object = CWTreeGetObjectFromCFTree(self.tree);
	return object;
}

-(void)appendToRoot:(id)object {
	CWAssert(object != nil);
	CWTreeAppendWithChild(self.tree, object);
}

-(BOOL)containsObject:(id)object {
	if(self.tree == NULL) return NO;
	
	__block BOOL contains = NO;
	
	[self enumerateObjectsUsingBlock:^(id obj, CFTreeRef tree, BOOL *stop) {
		if ([object isEqual:obj]) {
			contains = YES;
			*stop = YES;
		}
	}];
	
	return contains;
}

-(void)enumerateObjectsUsingBlock:(void (^)(id obj, CFTreeRef tree, BOOL *stop))block {
	if(self.tree == NULL) return;
	
	CFMutableArrayRef queue = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
	CFArrayAppendValue(queue, self.tree);
	
	BOOL stop = NO;
	
	while (CFArrayGetCount(queue) > 0) {
		CFTreeRef tree = (CFTreeRef)CFArrayGetValueAtIndex(queue, 0);
		id object = CWTreeGetObjectFromCFTree(tree);
		block(object,tree,&stop);
		
		if(stop == YES) break;
		
		CFIndex count = CFTreeGetChildCount(tree);
		if (count > 0) {
			CFTreeRef *children = calloc(count, sizeof(CFTreeRef));
			CFTreeGetChildren(tree, children);
			
			for (NSInteger i = 0; i < count; i++) {
				CFTreeRef tree = children[i];
				CFArrayAppendValue(queue, tree);
			}
			free(children);
		}
		
		CFArrayRemoveValueAtIndex(queue, 0);
	}
	CFRelease(queue);
}

-(NSString *)debugDescription {
	//TODO: Add node depth information to this...
	NSMutableString *description = [NSMutableString string];
	
	[description appendFormat:@"CWTree <%p> : (\n",self];
	
	[self enumerateObjectsUsingBlock:^(id obj, CFTreeRef tree, BOOL *stop) {
		[description appendFormat:@"%@,\n",[obj description]];
	}];
	
	[description appendString:@")"];
	
	return description;
}

-(void)dealloc {
	CFRelease(_tree); _tree = NULL;
}

@end
