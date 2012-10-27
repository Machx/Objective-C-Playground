//
//  main.m
//  ObjC_Playground
//
//  Created by Colin Wheeler on 10/26/12.
//  Copyright (c) 2012 Colin Wheeler. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
	@autoreleasepool {
	    [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
	}
    return 0;
}

