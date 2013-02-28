//
//  CWFutureTests.m
//  ObjC_Playground
//
//  Created by Colin Wheeler on 2/28/13.
//  Copyright (c) 2013 Colin Wheeler. All rights reserved.
//

#import "CWFutureTests.h"
#import "CWFuture.h"
#import "CWBlockNotificationCenter.h"

SpecBegin(CWFuture)

it(@"should capture an expression and return its result", ^{
	CWFuture *future = [CWFuture futureWithBlock:^id{
		return @4;
	}];
	
	expect([future resolveFuture]).to.equal(@4);
});

SpecEnd
