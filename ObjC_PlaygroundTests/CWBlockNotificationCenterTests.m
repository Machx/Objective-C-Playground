//
//  CWBlockNotificationCenterTests.m
//  ObjC_Playground
//
//  Created by Colin Wheeler on 10/31/12.
//  Copyright (c) 2012 Colin Wheeler. All rights reserved.
//

#import "CWBlockNotificationCenterTests.h"
#import "CWBlockNotificationCenter.h"

@interface CWBlockNotificationCenterTests ()
@property(assign) dispatch_queue_t queue;
@property(assign) BOOL triggered;
@end

@implementation CWBlockNotificationCenterTests

-(void)setUp
{
	self.triggered = NO;
	
	self.queue = dispatch_queue_create("com.UnitTest.CWBlockNotifierTest", DISPATCH_QUEUE_SERIAL);
	
	[[CWBlockNotificationCenter defaultCenter] addBlock:^{
		dispatch_async(dispatch_get_main_queue(), ^{
			self.triggered = YES;
		});
	} forNotification:@"name"
              onQueue:self.queue];
}

-(void)testBasic
{
	[[CWBlockNotificationCenter defaultCenter] postNotificationWithName:@"name"];
	
	//STAssertTrue(self.triggered == YES, nil);
}

-(void)tearDown
{
	dispatch_release(_queue);
}

@end
