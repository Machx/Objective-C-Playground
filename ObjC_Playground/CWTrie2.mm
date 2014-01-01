//
//  CWTrie2.m
//  ObjC_Playground
//
//  Created by Colin Wheeler on 12/31/13.
//  Copyright (c) 2013 Colin Wheeler. All rights reserved.
//

#import "CWTrie2.h"

typedef struct CWTrie2Node {
    id __strong value;
    char *key;
    void **children;
} CWTrie2Node;

CWTrie2Node *CWTrie2NodeCreate(id *value,char key) {
    CWTrie2Node *node = (CWTrie2Node *)calloc(1, sizeof(CWTrie2Node));
    node->value = *value;
    node->key = ({
        char *str = (char *)calloc(2, sizeof(char));
        strncpy(str, &key, 1);
        str;
    });
    return node;
}

void CWTrie2NodeRelease(CWTrie2Node *node) {
    free(node->key);
    delete node;
}

BOOL CWTrie2NodeEqual(CWTrie2Node *node1, CWTrie2Node *node2) {
    BOOL keyEqual = ({
        BOOL result = YES;
        if (strcmp(node1->key, node2->key) != 0) result = NO;
        result;
    });
    BOOL objEqual = [(id)node1->value isEqual:(id)node2->value];
    return (keyEqual && objEqual);
}

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
