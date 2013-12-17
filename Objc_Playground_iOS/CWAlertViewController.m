//
//  CWAlertViewController.m
//  ObjC_Playground
//
//  Created by Colin Wheeler on 12/14/13.
//  Copyright (c) 2013 Colin Wheeler. All rights reserved.
//

#import "CWAlertViewController.h"

@interface CWAlertViewController ()
@property(nonatomic,strong) NSMutableArray *alertViews;
@end

@implementation CWAlertViewController

-(instancetype)init {
    self = [super init];
    if(self == nil) return nil;
    
    _alertViews = [[NSMutableArray alloc] init];
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
