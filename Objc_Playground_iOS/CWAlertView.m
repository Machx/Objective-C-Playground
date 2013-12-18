//
//  CWAlertView.m
//  ObjC_Playground
//
//  Created by Colin Wheeler on 12/13/13.
//  Copyright (c) 2013 Colin Wheeler. All rights reserved.
//

#import "CWAlertView.h"
#import "CWAlertViewController.h"

static NSString const *kCWAlertDefaultOkButton = @"kCWAlertDefaultOkButton";

@interface CWAlertView ()
@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *message;
@property(nonatomic,strong) NSArray *buttons;
@end

@implementation CWAlertView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self == nil) return nil;
    
    _title = @"Alert";
    _message = @"Alert Message";
    _buttons = @[kCWAlertDefaultOkButton];
    
    return self;
}

-(instancetype)initWithTitle:(NSString *)title message:(NSString *)message {
    self = [super initWithFrame:CGRectMake(50, 50, 200, 200)]; //
    if(self == nil) return nil;
    
    _title = title;
    _message = message;
    _buttons = @[kCWAlertDefaultOkButton];
    
    return self;
}

-(void)showWithCompletionBlock:(void (^)(NSUInteger selectedButtom))block {
    
    if ([self.delegate respondsToSelector:@selector(willShowAlertView:)]) {
        [self.delegate willShowAlertView:self];
    }
    
    //show
}

@end
