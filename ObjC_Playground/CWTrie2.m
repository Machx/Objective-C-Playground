/*
//  CWTrie2.m
//  ObjC_Playground
//
//  Created by Colin Wheeler on 12/31/13.
//  Copyright (c) 2013 Colin Wheeler. All rights reserved.
//

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

#import "CWTrie2.h"
#import <libkern/OSAtomic.h>
#import <Zangetsu/CWAssertionMacros.h>

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

-(CWTrie2Node *)setNodeForKeyValue:(char)ch {
    CWTrie2Node *node = [CWTrie2Node new];
    node.key = ch;
    [self.children addObject:node];
    return node;
}

-(CWTrie2Node *)nodeForKeyValue:(char)ch {
    CWTrie2Node *result = nil;
    for (CWTrie2Node *node in self.children) {
        if (node.key == ch) {
            result = node;
            break;
        }
    }
    return result;
}

@end

@interface CWTrie2 ()
@property(strong) CWTrie2Node *root;
@property(strong) dispatch_queue_t queue;
@end

static int64_t queue_counter = 0;

@implementation CWTrie2

-(instancetype)init {
    self = [super init];
    if(!self) return self;
    
    _root = [CWTrie2Node new];
    _queue = ({
        NSString *label = [NSString stringWithFormat:@"%@%lli",
                           NSStringFromClass([self class]),
                           OSAtomicIncrement64(&queue_counter)];
        dispatch_queue_t aQueue = dispatch_queue_create([label UTF8String], DISPATCH_QUEUE_SERIAL);
        aQueue;
    });
    
    return self;
}

-(void)setObjectValue:(id)value
               forKey:(NSString *)key {
    CWAssert(value != nil);
    CWAssert(key != nil);
    
    dispatch_async(self.queue, ^{
        const char *keyValue = [key UTF8String];
        CWTrie2Node *search = self.root;
        
        while (*keyValue) {
            char sc = *keyValue;
            CWTrie2Node *nextNode = [search nodeForKeyValue:sc];
            search = nextNode ?: [search setNodeForKeyValue:sc];
            keyValue++;
        }
        search.storedValue = value;
    });
}

-(id)objectValueForKey:(NSString *)key {
    __block id result = nil;
    
    dispatch_sync(self.queue, ^{
        CWTrie2Node *node = self.root;
        const char *keystr = [key UTF8String];
        while (*keystr && (node != nil)) {
            node = [node nodeForKeyValue:*keystr];
            keystr++;
        }
        result = node.storedValue;
    });
    
    return result;
}

@end
