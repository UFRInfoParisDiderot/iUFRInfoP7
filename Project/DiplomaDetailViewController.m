//
//  DiplomaDetailViewController.m
//  Project
//
//  Created by Elias Abou Haydar on 09/01/14.
//  Copyright (c) 2014 Elias Abou Haydar. All rights reserved.
//

#import "DiplomaDetailViewController.h"
#import "WebPageViewController.h"
#import "AppDelegate.h"

@interface DiplomaDetailViewController ()

@end

@implementation DiplomaDetailViewController

@synthesize diploma;


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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WebPageViewController *wpvc = segue.destinationViewController;

    if ([segue.identifier isEqualToString:@"edt1"]) {
        wpvc.url = diploma.url1;
    }
    else if ([segue.identifier isEqualToString:@"edt2"]) {
        wpvc.url = diploma.url2;
    }
    wpvc.hidesBottomBarWhenPushed = YES;

}

@end
