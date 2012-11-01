//
//  ObjC_PlaygroundTests.m
//  ObjC_PlaygroundTests
//
//  Created by Colin Wheeler on 10/26/12.
//  Copyright (c) 2012 Colin Wheeler. All rights reserved.
//

#import "ObjC_PlaygroundTests.h"
#import "CWErrorUtils.h"
#import <Zangetsu/Zangetsu.h>

@implementation ObjC_PlaygroundTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

-(void)testErrorMethod
{
	NSUInteger counter = 50;
	
	NSError *error;
	
	CWOnError(counter > 100,
			  @"Domain", 404,
			  @"Counter less than 100",
			  &error);
	
	CWLogError(error);
}

-(void)testErrorBlockMethod
{
	NSUInteger counter = 10;
	
	NSError *error;
	
	CWErrorTrap(counter > 100,
				^NSError *{
					return CWCreateError(@"Domain", 101, @"Counter is less than 100");
				}, &error);
	
	CWLogError(error);
}

@end
