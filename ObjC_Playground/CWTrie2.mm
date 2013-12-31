//
//  CWTrie2.m
//  ObjC_Playground
//
//  Created by Colin Wheeler on 12/31/13.
//  Copyright (c) 2013 Colin Wheeler. All rights reserved.
//

#import "CWTrie2.h"

typedef struct CWTrie2Node {
    id *value;
    char *key;
} CWTrie2Node;

@interface CWTrie2 ()
@property(assign) CWTrie2Node *root;
@end

@implementation CWTrie2

-(instancetype)init {
    self = [super init];
    if(!self) return self;
    
    _root = NULL;
    
    return self;
}



@end
