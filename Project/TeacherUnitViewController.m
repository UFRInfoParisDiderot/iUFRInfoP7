//
//  TeacherUnitViewController.m
//  Project
//
//  Created by Elias Abou Haydar on 10/01/14.
//  Copyright (c) 2014 Elias Abou Haydar. All rights reserved.
//

#import "TeacherUnitViewController.h"
#import "TUnitDetailViewController.h"
#import "AppDelegate.h"

@interface TeacherUnitViewController ()

@end

@implementation TeacherUnitViewController

@synthesize teacherUnits;
@synthesize tabView;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [teacherUnits count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TUCell";
    // NSLog(@"%@",indexPath);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [[teacherUnits objectAtIndex:indexPath.row] name];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    TUnitDetailViewController *tdvc = segue.destinationViewController;
    TUnit *tunit = (TUnit *)[teacherUnits objectAtIndex:indexPath.row];
    tdvc.tunit = tunit;
}

@end
