//
//  CWBlockTimer.h
//  ObjC_Playground
//
//  Created by Colin Wheeler on 7/25/13.
//  Copyright (c) 2013 Colin Wheeler. All rights reserved.
//

#import <Foundation/Foundation.h>

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
 Invalidates the timer so it stops firing
 */
-(void)invalidate;

@end
