//
//  TUnitViewController.m
//  Project
//
//  Created by Elias Abou Haydar on 13/12/13.
//  Copyright (c) 2013 Elias Abou Haydar. All rights reserved.
//

#import "TUnitViewController.h"
#import "TUnitDetailViewController.h"
#import "AppDelegate.h"

@interface TUnitViewController ()

@end

@implementation TUnitViewController {
    NSArray *tunits;
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
    // Dispose of any resources that can be recreated.
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
    // NSLog(@"%d",indexPath.row);
    static NSString *CellIdentifier = @"TUnitCell";
    UITableViewCell *cell = [tabView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    AppDelegate *d = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    TUnit *t = (TUnit *)[d.tUnitParserDelegate.tUnits objectAtIndex:indexPath.row];
    cell.textLabel.text = [t name];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    TUnitDetailViewController *tdvc = segue.destinationViewController;
    AppDelegate *d = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    
    TUnit *tunit = (TUnit *)[d.tUnitParserDelegate.tUnits objectAtIndex:indexPath.row];
    tdvc.tunit = tunit;
}

@end
