//
//  CWAlertView.m
//  ObjC_Playground
//
//  Created by Colin Wheeler on 12/13/13.
//  Copyright (c) 2013 Colin Wheeler. All rights reserved.
//

#import "CWAlertView.h"

@interface CWAlertView ()
@property(nonatomic,copy) NSString *title;
@end

@implementation CWAlertView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(instancetype)initWithTitle:(NSString *)title message:(NSString *)message {
    self = [super initWithFrame:CGRectMake(50, 50, 200, 200)]; //
    if(self == nil) return nil;
    
    return self;
}

-(void)show {
    
}


-(void)showWithCompletionBlock:(void (^)(NSUInteger selectedButtom))block {
    
}

@end
