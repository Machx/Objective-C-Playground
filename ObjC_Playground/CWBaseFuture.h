//
//  CWBaseFuture.h
//  ObjC_Playground
//
//  Created by Colin Wheeler on 11/14/12.
//  Copyright (c) 2012 Colin Wheeler. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CWBaseFuture : NSObject

-(id)futureValue;
-(void)setFutureValue:(id)object;

-(void)setFutureValueUnlocked:(id)value;

-(BOOL)futureHasResolved;

-(id)waitForFutureResolution;

-(id)resolveFuture;

@end
