//
//  CWViewController.m
//  Objc_Playground_iOS
//
//  Created by Colin Wheeler on 12/12/13.
//  Copyright (c) 2013 Colin Wheeler. All rights reserved.
//

#import "CWViewController.h"

static NSString * const kObjCPlayGroundTableCell = @"kObjCPlayGroundTableCell";

@interface CWViewController () <UITableViewDataSource, UITableViewDelegate>
@property(strong) UITableView *tableView;
@end

@implementation CWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
	// Do any additional setup after loading the view, typically from a nib.
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kObjCPlayGroundTableCell];
    
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kObjCPlayGroundTableCell];
    cell.textLabel.text = @"iOS Playground Test 1";
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

@end
