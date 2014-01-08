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

@synthesize tableView;

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    AppDelegate *d = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    // Return the number of rows in the section.
    // NSLog(@"count %d",[d.dparser.contents count]);
    return [d.teacherparserdelegate.teachers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    AppDelegate *d = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    Teacher *t = (Teacher *)[d.teacherparserdelegate.teachers objectAtIndex:indexPath.row];
    cell.textLabel.text = [t lastname];

    return cell;
    
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}


// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    TeacherDetailViewController *tdvc = segue.destinationViewController;
    AppDelegate *d = (AppDelegate *) [[UIApplication sharedApplication] delegate];

    Teacher *t = (Teacher *)[d.teacherparserdelegate.teachers objectAtIndex:indexPath.row];
    tdvc.teacher = t;
}

@end
