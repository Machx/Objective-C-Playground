//
//  CWBaseFuture.m
//  ObjC_Playground
//
//  Created by Colin Wheeler on 11/14/12.
//  Copyright (c) 2012 Colin Wheeler. All rights reserved.
//

#import "CWBaseFuture.h"

@interface CWBaseFuture ()
@property(retain) id value;
@property(retain) NSCondition *lock;
@property(assign) BOOL resolved;
@end

@implementation CWBaseFuture

- (id)init {
    self = [super init];
    if (self) {
        _lock = [NSCondition new];
    }
    return self;
}

-(id)futureValue {
	[self.lock lock];
	id value = _value;
	[self.lock unlock];
	return value;
}

-(void)setFutureValue:(id)object {
	[self.lock lock];
	[self setFutureValueUnlocked:object];
	[self.lock unlock];
}

-(void)setFutureValueUnlocked:(id)value {
	self.value = value;
	self.resolved = YES;
	[self.lock broadcast];
}

-(BOOL)futureHasResolved {
	return self.resolved;
}

-(id)waitForFutureResolution {
	[self.lock lock];
	while (!self.resolved) {
		[self.lock wait];
	}
	[self.lock unlock];
	return self.value;
}

-(id)resolveFuture {
	CWDebugLog(@"This method should not be called! You need to implement resolve future in %@",NSStringFromClass([self class]));
	NSParameterAssert(0);
	return nil;
}

@end
