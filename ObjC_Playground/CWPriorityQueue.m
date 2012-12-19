//
//  CWPriorityQueue.m
//  ObjC_Playground
//
//  Created by Colin Wheeler on 12/18/12.
//  Copyright (c) 2012 Colin Wheeler. All rights reserved.
//

#import "CWPriorityQueue.h"

@interface CWPriorityQueueItem : NSObject
@property(retain) id item;
@property(assign) NSUInteger priority;
@end

@implementation CWPriorityQueueItem

- (id)init
{
    self = [super init];
    if (self) {
        _item = nil;
		_priority = NSUIntegerMax; //lowest priority
    }
    return self;
}

@end

@interface CWPriorityQueue ()
@property(retain) NSMutableArray *storage;
@end

@implementation CWPriorityQueue

- (id)init
{
    self = [super init];
    if (self) {
        _storage = [NSMutableArray array];
    }
    return self;
}

-(void)_sortStorage
{
	[self.storage sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
		NSUInteger obj1Priority = ((CWPriorityQueueItem *)obj1).priority;
		NSUInteger obj2Priority = ((CWPriorityQueueItem *)obj2).priority;
		if (obj1Priority < obj2Priority) {
			return NSOrderedAscending;
		} else if (obj1Priority == obj2Priority) {
			return NSOrderedSame;
		} else {
			return NSOrderedAscending;
		}
	}];
}

-(void)addItem:(id)item
  withPriority:(NSUInteger)priority
{
	CWPriorityQueueItem *container = [CWPriorityQueueItem new];
	container.item = item;
	container.priority = priority;
	[self.storage addObject:container];
	[self _sortStorage];
}

-(id)pop
{
	id obj = ((CWPriorityQueueItem *)self.storage[0]).item;
	[self.storage removeObjectAtIndex:0];
	return obj;
}

@end
