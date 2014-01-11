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

describe(@"case sensitive", ^{
    it(@"should return different values if case sensitive", ^{
        CWTrie2 *trie = [[CWTrie2 alloc] initWithCaseSensitiveKeys:YES];
        
        [trie setObjectValue:@5 forKey:@"Yes"];
        [trie setObjectValue:@4 forKey:@"yes"];
        
        expect([trie objectValueForKey:@"Yes"]).to.equal(@5);
        expect([trie objectValueForKey:@"yes"]).to.equal(@4);
    });
    
    it(@"should return the same value if not case sensitive", ^{
        CWTrie2 *trie = [[CWTrie2 alloc] initWithCaseSensitiveKeys:NO];
        
        [trie setObjectValue:@5 forKey:@"Yes"];
        [trie setObjectValue:@4 forKey:@"yes"];
        
        expect([trie objectValueForKey:@"yes"]).to.equal(@4);
    });
});

describe(@"-containsKey", ^{
    it(@"should detect if a key has been set", ^{
        CWTrie2 *trie = [CWTrie2 new];
        
        expect([trie containsKey:@"Hypnotoad"]).to.beFalsy();
        
        [trie setObjectValue:@4 forKey:@"Hypnotoad"];
        
        expect([trie containsKey:@"Hypnotoad"]).to.beTruthy();
    });
    
    it(@"should detect when a node exists, but not a stored value", ^{
        /*
         This detects that there is a stored value in a node and not that the 
         node simply exists. I.e. If we set the key "hello" we should be able to
         detect that the nodes for "he" exist, but that there is no stored value
         which corresponds to that key
         */
        CWTrie2 *trie = [CWTrie2 new];
        
        [trie setObjectValue:@4 forKey:@"hello"];
        
        expect([trie containsKey:@"he"]).to.beFalsy();
        expect([trie containsKey:@"hello"]).to.beTruthy();
    });
});

SpecEnd