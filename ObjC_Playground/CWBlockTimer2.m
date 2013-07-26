//
//  CWBlockTimer.m
//  ObjC_Playground
//
//  Created by Colin Wheeler on 7/25/13.
//  Copyright (c) 2013 Colin Wheeler. All rights reserved.
//

#import "CWBlockTimer2.h"
#import "CWLogging.h"
#import <Zangetsu/CWAssertionMacros.h>

@interface CWBlockTimer2 ()
@property(nonatomic,assign) dispatch_source_t source;
@end

@implementation CWBlockTimer2

- (id)init {
	CWLogInfo(@"Wrong initializer for CWBlockTimer2. Call -initWithTimeInterval:onQueue:withBlock:");
	return nil;
}

- (id)initWithTimeInterval:(NSTimeInterval)interval
				   onQueue:(dispatch_queue_t)queue
				 withBlock:(dispatch_block_t)block {
	CWAssert(queue != NULL);
	CWAssert(block != nil);
	
    self = [super init];
    if (self == nil) return self;
	
	_source = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
	
	uint64_t nSec = (uint64_t)(interval * NSEC_PER_SEC);
	//TODO: pick better parameter value for 10.9 
	dispatch_source_set_timer(_source,
							  dispatch_time(DISPATCH_TIME_NOW, nSec),
							  nSec,
							  0 /* leeway, should pick something better for 10.9*/);
	
	dispatch_source_set_event_handler(_source, block);
	dispatch_resume(_source);
	
    return self;
}

-(void)invalidate {
	if (self.source) {
		dispatch_source_cancel(self.source);
		dispatch_release(self.source);
		self.source = nil;
	}
}

- (void)dealloc {
    if (_source) {
		dispatch_source_cancel(_source);
		dispatch_release(_source);
		_source = nil;
	}
}

@end
