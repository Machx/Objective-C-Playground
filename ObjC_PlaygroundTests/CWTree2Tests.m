//
//  CWTree2Tests.m
//  ObjC_Playground
//
//  Created by Colin Wheeler on 10/15/13.
//  Copyright (c) 2013 Colin Wheeler. All rights reserved.
//

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
		
		[tree enumerateObjectsUsingBlock:^(id obj, CFTreeRef tree, BOOL *stop) {
			count++;
		}];
		
		expect(count == 3).to.beTruthy();
	});
	
	it(@"should be able to modify the tree while enumerating it", ^{
		CWTree2 *tree = [[CWTree2 alloc] initWithRootObject:@"Hello"];
		
		__block NSUInteger count = 0;
		
		[tree enumerateObjectsUsingBlock:^(id obj, CFTreeRef tree, BOOL *stop) {
			if([(NSString *)obj isEqualToString:@"Hello"]){
				CWTreeAppendWithChild(tree, @"World");
			}
			count++;
		}];
		
		expect(count == 2).to.beTruthy();
	});
});

describe(@"-containsObject:", ^{
	CWTree2 *tree = [[CWTree2 alloc] initWithRootObject:@"Hypnotoad"];
	
	it(@"should correctly say when we contain an object", ^{
		expect([tree containsObject:@"Hypnotoad"]).to.beTruthy();
	});
	
	it(@"should correctly say when we do not contain an object", ^{
		expect([tree containsObject:@"Quizzyjimbo"]).to.beFalsy();
	});
});

describe(@"CWTreeGetObjectFromCFTree", ^{
	it(@"should get the correct object", ^{
		CWTree2 *tree = [[CWTree2 alloc] initWithRootObject:@"Hypnotoad"];
		
		CFTreeRef cftree = tree.tree;
		
		id obj = CWTreeGetObjectFromCFTree(cftree);
		
		expect(obj).to.equal(@"Hypnotoad");
	});
});

//describe(@"Debug Description", ^{
//	CWTree2 *tree = [[CWTree2 alloc] initWithRootObject:@"Hello"];
//	
//	[tree enumerateObjectsUsingBlock:^(id obj, CFTreeRef tree, BOOL *stop) {
//		if([(NSString *)obj isEqualToString:@"Hello"]){
//			CWTreeAppendWithChild(tree, @"World");
//		}
//	}];
//	
//	NSLog(@"CWTree Debug Description");
//	NSLog(@"%@",[tree debugDescription]);
//});

SpecEnd
