//
//  CWViewController.m
//  Objc_Playground_iOS
//
//  Created by Colin Wheeler on 12/12/13.
//  Copyright (c) 2013 Colin Wheeler. All rights reserved.
//

#import "CWViewController.h"

@interface CWViewController ()

@end

@implementation CWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 300, 50)];
    label.text = @"Objective-C Playground";
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
