//
//  ObjC_PlaygroundTests.m
//  ObjC_PlaygroundTests
//
//  Created by Colin Wheeler on 10/26/12.
//  Copyright (c) 2012 Colin Wheeler. All rights reserved.
//

#import "ObjC_PlaygroundTests.h"
#import "ObjC_Playground_UnitTests.pch"

SpecBegin(ObjcPlayground)

it(@"should do something", ^{
	expect(YES).to.beTruthy();
});

SpecEnd

//@implementation ObjC_PlaygroundTests
//
//- (void)setUp
//{
//    [super setUp];
//    
//    // Set-up code here.
//}
//
//-(void)testErrorSet
//{
//	NSError *error1;
//	
//	CWSetError(@"domain",404,@"message",&error1);
//	
//	CWAssertEqualsStrings(@"domain", error1.domain);
//	STAssertTrue(404 == error1.code, nil);
//	CWAssertEqualsStrings(@"message", error1.localizedDescription);
//	
//	NSError *error2 = nil;
//	
//	CWSetError(@"domain",404,@"message",&error2);
//	
//	CWAssertEqualsStrings(@"domain", error2.domain);
//	STAssertTrue(404 == error2.code, nil);
//	CWAssertEqualsStrings(@"message", error2.localizedDescription);
//}
//
//- (void)tearDown
//{
//    // Tear-down code here.
//    
//    [super tearDown];
//}
//
