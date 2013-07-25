//
//  CWBlockTimer.h
//  ObjC_Playground
//
//  Created by Colin Wheeler on 7/25/13.
//  Copyright (c) 2013 Colin Wheeler. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CWBlockTimer2 : NSObject

//designated initializer
- (id)initWithTimeInterval:(NSTimeInterval)interval
				   onQueue:(dispatch_queue_t)queue
				 withBlock:(dispatch_block_t)block;

-(void)invalidate;

@end
