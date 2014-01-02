//
//  CWTrie2.m
//  ObjC_Playground
//
//  Created by Colin Wheeler on 12/31/13.
//  Copyright (c) 2013 Colin Wheeler. All rights reserved.
//

#import "CWTrie2.h"

@interface CWTrie2Node : NSObject
@property(assign) char key;
@property(strong) id storedValue;
@property(copy) NSMutableSet *children;
@end

@implementation CWTrie2Node

+(CWTrie2Node *)nodeWithKey:(char)ch
                   andValue:(id)aVal {
    CWTrie2Node *node = [self new];
    node.key = ch;
    node.storedValue = aVal;
    return node;
}

-(instancetype)init {
    self = [super init];
    if(!self) return nil;
    
    _key = NULL;
    _storedValue = nil;
    _children = [NSMutableSet set];
    
    return self;
}

@end

@interface CWTrie2 ()
//lock or queue...
@end

@implementation CWTrie2

-(instancetype)init {
    self = [super init];
    if(!self) return self;
    
    return self;
}



@end
