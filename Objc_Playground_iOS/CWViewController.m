//
//  CWViewController.m
//  Objc_Playground_iOS
//
//  Created by Colin Wheeler on 12/12/13.
//  Copyright (c) 2013 Colin Wheeler. All rights reserved.
//

#import "CWViewController.h"
#import "CWAlertViewTestViewController.h"

static NSString * const kObjCPlayGroundTableCell = @"kObjCPlayGroundTableCell";

@interface CWViewController () <UITableViewDataSource, UITableViewDelegate>
@property(strong) UITableView *tableView;
@property(strong) NSArray *tests;
@end

@implementation CWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tests = @[ @"TestView1" ];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:kObjCPlayGroundTableCell];
    
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark TableView Data Source -

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kObjCPlayGroundTableCell];
    cell.textLabel.text = self.tests[indexPath.row];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tests.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

#pragma mark TableView Delegate -

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        CWAlertViewTestViewController *controller = [[CWAlertViewTestViewController alloc] init];
        [self presentViewController:controller animated:YES completion:^{
            //
        }];
    }
}

@end
