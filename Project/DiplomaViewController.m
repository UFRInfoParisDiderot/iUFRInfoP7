//
//  DiplomaViewController.m
//  Project
//
//  Created by Elias Abou Haydar on 09/01/14.
//  Copyright (c) 2014 Elias Abou Haydar. All rights reserved.
//

#import "DiplomaViewController.h"
#import "DiplomaDetailViewController.h"
#import "AppDelegate.h"

@interface DiplomaViewController ()

@end

@implementation DiplomaViewController{
    NSArray *diplomas;
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
    return [d.diplomaParserDelegate.diplomas count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"DiplomaCell";
    UITableViewCell *cell = [tabView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
 
    // Configure the cell...
    AppDelegate *d = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    Diploma *diploma = (Diploma *)[d.diplomaParserDelegate.diplomas objectAtIndex:indexPath.row];
# warning fix me!!
    // DiplomaYear *y = (DiplomaYear *)[d.diplomaParserDelegate]
    cell.textLabel.text = [diploma name];
    
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    DiplomaDetailViewController *ddvc = segue.destinationViewController;
    AppDelegate *d = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    
    Diploma *diploma = (Diploma *)[d.diplomaParserDelegate.diplomas objectAtIndex:indexPath.row];
    ddvc.diploma = diploma;
}

@end
