//
//  CWFuture.h
//  ObjC_Playground
//
//  Created by Colin Wheeler on 2/26/13.
//  Copyright (c) 2013 Colin Wheeler. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CWFuture : NSObject

/**
 Returns a CWFuture instance copying 
 */
+(id)futureWithBlock:(id (^)(void))block;

-(id)resolveFuture;

/**
 Returns a BOOl indicated if the future has been resolved or not
 
 @return BOOL indicating if the future has been resolved or not
 */
-(BOOL)futureResolved;

@end
