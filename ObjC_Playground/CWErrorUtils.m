//
//  CWErrorUtils.m
//  ObjC_Playground
//
//  Created by Colin Wheeler on 10/27/12.
//  Copyright (c) 2012 Colin Wheeler. All rights reserved.
//

#import "CWErrorUtils.h"

void CWOnError(BOOL cond,
			   NSString *domain,
			   NSInteger errorNo,
			   NSString *description,
			   NSError **error)
{
	if (!cond) {
		if (error) {
			*error = CWCreateError(domain, errorNo, description);
		}
	}
}

void CWBOnError(BOOL cond,
				NSError *(^errorBlock)(void),
				NSError **error)
{
	if (!cond) {
		if (error) {
			*error = errorBlock();
		}
	}
}
