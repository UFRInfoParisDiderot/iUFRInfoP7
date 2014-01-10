//
//  TeacherViewController.m
//  Project
//
//  Created by Elias Abou Haydar on 12/12/13.
//  Copyright (c) 2013 Elias Abou Haydar. All rights reserved.
//

#import "TeacherDetailViewController.h"
#import "TeacherViewController.h"
#import "AppDelegate.h"

@interface TeacherViewController ()

@end

@implementation TeacherViewController {
    NSArray *teachers;
}

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
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    AppDelegate *d = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    return [d.teacherParserDelegate.teachers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TeacherCell";
    UITableViewCell *cell = [tabView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    AppDelegate *d = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    Teacher *t = (Teacher *)[d.teacherParserDelegate.teachers objectAtIndex:indexPath.row];
    cell.textLabel.text = [t lastname];

    return cell;
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    TeacherDetailViewController *tdvc = segue.destinationViewController;
    AppDelegate *d = (AppDelegate *) [[UIApplication sharedApplication] delegate];

    Teacher *t = (Teacher *)[d.teacherParserDelegate.teachers objectAtIndex:indexPath.row];
    tdvc.teacher = t;
}

@end
