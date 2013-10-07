//
//  CWBinaryHeap_Private.h
//  ObjC_Playground
//
//  Created by Colin Wheeler on 10/7/13.
//  Copyright (c) 2013 Colin Wheeler. All rights reserved.
//
#import "CWBinaryHeap.h"

@interface CWBinaryHeap ()
@property(nonatomic,assign) CFBinaryHeapRef heap;
@property(nonatomic,copy) NSComparisonResult (^userSortBlock)(id obj1,id obj2);
@end

@interface CWBinaryHeapNode : NSObject
@property(strong) id data;
@property(weak) CWBinaryHeap *parent;
+(instancetype)nodeWithData:(id)data;
@end