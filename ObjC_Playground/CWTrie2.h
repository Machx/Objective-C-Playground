/*
//  CWTrie2.h
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

#import <Foundation/Foundation.h>

@interface CWTrie2 : NSObject

/**
 Initializes & returns a new CWTrie2 instance
 
 @param caseSensitive sets if the trie instace should use case sensitive keys
 @return An initialized CWTrie2 instance
 */
-(instancetype)initWithCaseSensitiveKeys:(BOOL)caseSensitive;

/**
 Sets a key value pair in the trie
 
 @param value the value for key
 @param key the key for value
 */
-(void)setObjectValue:(id)value forKey:(NSString *)key;

/**
 Returns the object corresponding to key or nil if no such key is set
 
 @param key the key to be used to see if something exists 
 */
-(id)objectValueForKey:(NSString *)key;

-(void)removeObjectValueForKey:(NSString *)key;

@end
