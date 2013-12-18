//
//  CWAlertView.h
//  ObjC_Playground
//
//  Created by Colin Wheeler on 12/13/13.
//  Copyright (c) 2013 Colin Wheeler. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CWAlertView;

@protocol CWAlertViewDelegate <NSObject>
@optional
-(void)willShowAlertView:(CWAlertView *)alertView;
@end

@interface CWAlertView : UIView
-(instancetype)initWithTitle:(NSString *)title message:(NSString *)message;
-(void)showWithCompletionBlock:(void (^)(NSUInteger selectedButtom))block;
@end
