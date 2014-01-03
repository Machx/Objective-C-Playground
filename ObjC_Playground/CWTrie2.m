//
//  CWTrie2.m
//  ObjC_Playground
//
//  Created by Colin Wheeler on 12/31/13.
//  Copyright (c) 2013 Colin Wheeler. All rights reserved.
//

#import "CWTrie2.h"
#import <libkern/OSAtomic.h>

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
@property(strong) CWTrie2Node *root;
@property(strong) dispatch_queue_t queue;
@end

static uint32_t queue_counter = 0;

@implementation CWTrie2

-(instancetype)init {
    self = [super init];
    if(!self) return self;
    
    _root = nil;
    _queue = ({
        NSString *classString = NSStringFromClass([self class]);
        NSString *label = [NSString stringWithFormat:@"%@%i",
                           classString,OSAtomicIncrement32(&queue_counter)];
        dispatch_queue_t aQueue = dispatch_queue_create([label UTF8String], 0);
        aQueue;
    });
    
    return self;
}

-(void)setObjectValue:(id)value
               forKey:(NSString *)key {
    dispatch_async(self.queue, ^{
        const char *keyValue = [key UTF8String];
        
    });
}

@end
