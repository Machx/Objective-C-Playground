//
//  CWTrie2Tests.m
//  ObjC_Playground
//
//  Created by Colin Wheeler on 1/5/14.
//  Copyright (c) 2014 Colin Wheeler. All rights reserved.
//

#import "CWTrie2.h"

SpecBegin(CWTrie2)

it(@"should store and retreieve a object", ^{
    CWTrie2 *trie = [[CWTrie2 alloc] init];
    
    [trie setObjectValue:@"World!" forKey:@"Hello"];
    
    expect([trie objectValueForKey:@"Hello"]).to.equal(@"World!");
});

it(@"should return nil for objects it doesn't contain", ^{
    CWTrie2 *trie = [[CWTrie2 alloc] init];
    
    expect([trie objectValueForKey:@"Hypnotoad"]).to.beNil();
});

SpecEnd