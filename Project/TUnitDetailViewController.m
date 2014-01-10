//
//  TUnitDetailViewController.m
//  Project
//
//  Created by Elias Abou Haydar on 09/01/14.
//  Copyright (c) 2014 Elias Abou Haydar. All rights reserved.
//

#import "TUnitDetailViewController.h"

@interface TUnitDetailViewController ()

@end

@implementation TUnitDetailViewController
@synthesize tunit;

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
    self.title = tunit.name;
    NSString *tmp  = tunit.CM.begin;
    NSLog(@"%@",tmp);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
