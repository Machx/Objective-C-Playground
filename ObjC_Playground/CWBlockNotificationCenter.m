//
//  CWBlockNotificationCenter.m
//  ObjC_Playground
//
//  Created by Colin Wheeler on 10/26/12.
//  Copyright (c) 2012 Colin Wheeler. All rights reserved.
//

#import "CWBlockNotificationCenter.h"
#import <Zangetsu/Zangetsu.h>

@interface CWBlockQueuePair : NSObject
@property(copy) dispatch_block_t block;
@property(assign) dispatch_queue_t queue;
+(instancetype)pairWithQueue:(dispatch_queue_t)queue
					andBlock:(dispatch_block_t)block;
@end

@implementation CWBlockQueuePair

- (id)init {
    self = [super init];
    if (self == nil) return self;
	
	_block = nil;
	_queue = NULL;
	
    return self;
}

+(instancetype)pairWithQueue:(dispatch_queue_t)queue
					andBlock:(dispatch_block_t)block {
	CWAssert(queue != NULL);
	CWAssert(block != nil);
	CWBlockQueuePair *pair = [CWBlockQueuePair new];
	pair.queue = queue;
	pair.block = block;
	return pair;
}

@end

@interface CWBlockNotification : NSObject
@property(retain) NSString *notificationName;
@property(retain) NSMutableArray *blocks;
@end

@implementation CWBlockNotification

- (id)init {
    self = [super init];
    if (self == nil) return self;
	
	_notificationName = nil;
	_blocks = [NSMutableArray array];
	
    return self;
}

@end

@interface CWBlockNotificationCenter ()
@property(retain) NSMutableArray *notifications;
@end

@implementation CWBlockNotificationCenter

+(CWBlockNotificationCenter *)defaultCenter {
	static CWBlockNotificationCenter *center = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		center = [CWBlockNotificationCenter new];
	});
	return center;
}

-(id)init {
	self = [super init];
	if (self == nil) return self;
	
	_notifications = [NSMutableArray array];
	
	return self;
}


-(void)addBlock:(dispatch_block_t)block
forNotification:(NSString *)notificationName
		onQueue:(dispatch_queue_t)queue {
	CWAssert(block != nil);
	CWAssert(notificationName != nil);
	CWAssert(queue != NULL);
	
	CWBlockNotification *object = [self.notifications cw_findWithBlock:^BOOL(id object) {
		CWBlockNotification *notification = (CWBlockNotification *)object;
		if ([notification.notificationName isEqualToString:notificationName]) {
			return YES;
		}
		return NO;
	}];
	
	if (object == nil) {
		object = [CWBlockNotification new];
		object.notificationName = notificationName;
		[self.notifications addObject:object];
	}
	
	CWBlockQueuePair *pair = [CWBlockQueuePair pairWithQueue:queue
													andBlock:block];
	
	[object.blocks addObject:pair];
}

-(BOOL)postNotificationWithName:(NSString *)notificationName {
	CWBlockNotification *notification = [self.notifications cw_findWithBlock:^BOOL(id object) {
		CWBlockNotification *not = (CWBlockNotification *)object;
		if ([not.notificationName isEqualToString:notificationName]) {
			return YES;
		}
		return NO;
	}];
	
	if (notification == nil) return NO;
	
	[notification.blocks cw_each:^(id object, NSUInteger index, BOOL *stop) {
		CWBlockQueuePair *pair = (CWBlockQueuePair *)object;
		dispatch_sync(pair.queue, pair.block);
	}];
	
	return YES;
}

@end
