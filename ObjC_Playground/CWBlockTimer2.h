//
//  CWBlockTimer.h
//  ObjC_Playground
//
//  Created by Colin Wheeler on 7/25/13.
//  Copyright (c) 2013 Colin Wheeler. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 CWBlockTimer is a simple class that is designed to be a minimal wrapper around
 Grand Central Dispatch and its dispatch_source timer API. Internally it sets
 up a dispatch_source_t object and configures it with the time interval, queue
 and block you give it. Then it will immediately begin firing the block at the
 time interval you give it. 
 
 To stop the timer forever, call the -invalidate method which will take care of
 that, or just let ARC dealloc a CWBlockTimer instance and that will also 
 stop the timer.
 */

@interface CWBlockTimer2 : NSObject

/**
 CWBlockTimer2 Designated Initializer
 
 @param interval seconds between timer firing
 @param queue block should be executed on. Must not be null
 @param block to be executed by the timer
 @return a new CWBlockTimer2 configured instance
 */
- (id)initWithTimeInterval:(NSTimeInterval)interval
				   onQueue:(dispatch_queue_t)queue
				 withBlock:(dispatch_block_t)block;

/**
 Invalidates the timer so it stops firing.
 
 Once the timer has been invalidated it will never fire again. You must dealloc
 the instance and create a new instance.
 */
-(void)invalidate;

@end
