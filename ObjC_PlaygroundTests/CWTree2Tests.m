//
//  CWTree2Tests.m
//  ObjC_Playground
//
//  Created by Colin Wheeler on 10/15/13.
//  Copyright (c) 2013 Colin Wheeler. All rights reserved.
//

#import "CWTree2Tests.h"
#import "CWTree2.h"

SpecBegin(CWTree2)

it(@"should retrieve the root object", ^{
	NSString *hello = @"world";
	
	CWTree2 *tree = [[CWTree2 alloc] initWithRootObject:hello];
	
	expect([tree rootObject]).to.equal(hello);
});

describe(@"-enumerateObjects", ^{
	it(@"shouldEnumerate", ^{
		NSString *hello = @"world";
		
		CWTree2 *tree = [[CWTree2 alloc] initWithRootObject:hello];
		
		[tree appendToRoot:@"Hypnotoad"];
		[tree appendToRoot:@"Farnsworth"];
		
		__block NSUInteger count = 0;
		
		[tree enumerateObjectsInTreeUsingBlock:^(id obj, CFTreeRef tree, BOOL *stop) {
			NSLog(@"object is %@",obj);
			count++;
		}];
		
		expect(count == 3).to.beTruthy();
	});
});

SpecEnd
