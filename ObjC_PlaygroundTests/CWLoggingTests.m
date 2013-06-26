//
//  CWLoggingTests.m
//  ObjC_Playground
//
//  Created by Colin Wheeler on 6/19/13.
//  Copyright (c) 2013 Colin Wheeler. All rights reserved.
//

#import <asl.h>

#define CW_LOG_LEVEL ASL_LEVEL_DEBUG

#import "CWLoggingTests.h"
#import "CWLogging.h"

SpecBegin(CWLogging)

it(@"should log", ^{
	/**
	 This is here as a means to verify that the function 
	 is working correctly. It is not a true unit test.
	 */
//	CWLog2(ASL_LEVEL_DEBUG, @"Log Debug Message");
//	CWLog2(ASL_LEVEL_INFO, @"Log Info Message");
//	CWLog2(ASL_LEVEL_NOTICE, @"Log Notice Message");
//	CWLog2(ASL_LEVEL_WARNING, @"Log Warning Message");
//	CWLog2(ASL_LEVEL_ERR, @"Log Error Message");
//	CWLog2(ASL_LEVEL_CRIT, @"Log Critical Message");
//	CWLog2(ASL_LEVEL_ALERT, @"Log Alert Message");
//	CWLog2(ASL_LEVEL_EMERG, @"Log Emergency Message");
//	CWLog2(ASL_LEVEL_DEBUG, @"Log Var arg Message %@",@"Hello World!");
//	
//	CWLog2Emergency(@"Emergency Message");
//	CWLog2Alert(@"Alert Message");
//	CWLog2Critical(@"Critical Message");
//	CWLog2Error(@"Error Message");
//	CWLog2Warning(@"Warning Message");
//	CWLog2Notice(@"Notice Message");
//	CWLog2Info(@"Info Message");
//	CWLog2Debug(@"Debug Message");
	
	//CWLog2Shell(ASL_LEVEL_INFO, @"Hello Info world!");
	//CWLog2Shell(ASL_LEVEL_INFO, @"Hello %@",@"World!");
});

SpecEnd
