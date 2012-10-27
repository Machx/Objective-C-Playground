//
//  CWBlockNotificationCenter.h
//  ObjC_Playground
//
//  Created by Colin Wheeler on 10/26/12.
//  Copyright (c) 2012 Colin Wheeler. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CWBlockNotificationCenter : NSObject

+(CWBlockNotificationCenter *)defaultCenter;

-(void)addBlock:(dispatch_block_t)block
forNotification:(NSString *)notificationName
		onQueue:(dispatch_queue_t)queue;

-(BOOL)postNotificationWithName:(NSString *)notificationName;

@end
