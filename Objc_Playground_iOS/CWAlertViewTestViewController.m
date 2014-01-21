//
//  CWAlertViewTestViewController.m
//  ObjC_Playground
//
//  Created by Colin Wheeler on 1/21/14.
//  Copyright (c) 2014 Colin Wheeler. All rights reserved.
//

#import "CWAlertViewTestViewController.h"

@interface CWAlertViewTestViewController ()

@end

@implementation CWAlertViewTestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *aLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 100, 50)];
    aLabel.text = @"hello";
    [self.view addSubview:aLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
