/*
//  CWLogging.h
//  ObjC_Playground
//
//  Created by Colin Wheeler on 6/19/13.
//  Copyright (c) 2013 Colin Wheeler. All rights reserved.
//
 Copyright (c) 2013, Colin Wheeler
 All rights reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 
 - Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.
 
 - Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation
 and/or other materials provided with the distribution.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

#import <Foundation/Foundation.h>
#import <asl.h>

/**
 CW_LOG_LEVELS exactly match ASL_LOG levels as defined in asl.h
 #define ASL_LEVEL_EMERG   0
 #define ASL_LEVEL_ALERT   1
 #define ASL_LEVEL_CRIT    2
 #define ASL_LEVEL_ERR     3
 #define ASL_LEVEL_WARNING 4
 #define ASL_LEVEL_NOTICE  5
 #define ASL_LEVEL_INFO    6
 #define ASL_LEVEL_DEBUG   7
 
 Emergency (level 0)
 The highest priority, usually reserved for catastrophic failures and reboot notices.
 
 Alert (level 1)
 A serious failure in a key system.
 
 Critical (level 2)
 A failure in a key system.
 
 Error (level 3)
 Something has failed.
 
 Warning (level 4)
 Something is amiss and might fail if not corrected.
 
 Notice (level 5)
 Things of moderate interest to the user or administrator.
 
 Info (level 6)
 The lowest priority that you would normally log, and purely informational in nature.
 
 Debug (level 7)
 The lowest priority, and normally not logged except for messages from the kernel.
 */

#ifndef CW_LOG_LEVEL
	#ifdef DEBUG
		#define CW_LOG_LEVEL ASL_LEVEL_DEBUG
	#else
		#define CW_LOG_LEVEL ASL_LEVEL_NOTICE
	#endif
#endif

void CWLog2(int level, NSString *messageFormat, ...);
