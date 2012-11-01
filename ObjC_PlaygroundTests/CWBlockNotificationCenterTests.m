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
@property(assign) BOOL triggered;
@end

@implementation CWBlockNotificationCenterTests

-(void)setUp
{
	self.triggered = NO;
	
	[[CWBlockNotificationCenter defaultCenter] addBlock:^{
		NSLog(@"Got notified");
		self.triggered = YES;
	} forNotification:@"name"
              onQueue:dispatch_get_main_queue()];
}

-(void)testBasic
{
	[[CWBlockNotificationCenter defaultCenter] postNotificationWithName:@"name"];
	
	//STAssertTrue(self.triggered == YES, nil);
}

@end
