//
//  CWErrorUtils.h
//  ObjC_Playground
//
//  Created by Colin Wheeler on 10/27/12.
//  Copyright (c) 2012 Colin Wheeler. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Zangetsu/Zangetsu.h>

#define CW_ERROR_INITIALIZE(x) x = x ? x : &( NSError *){ nil };

void CWOnError(BOOL cond,
			   NSString *domain,
			   NSInteger errorNo,
			   NSString *description,
			   NSError **error);

void CWSetError(NSString *domain,
				NSInteger errorNo,
				NSString *description,
				NSError **error);
