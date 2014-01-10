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
@synthesize cmTime;
@synthesize tdTime;
@synthesize tpTime;

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
    NSMutableString *tmp  = [[NSMutableString alloc ] init];
    [tmp appendString:tunit.CM.day];
    [tmp appendString:@" : "];
    [tmp appendString:tunit.CM.begin];
    [tmp appendString:@" - "];
    [tmp appendString:tunit.CM.end];
    cmTime.text = tmp;
    
    tmp = [[NSMutableString alloc]init];
    [tmp appendString:tunit.TD.day];
    [tmp appendString:@" : "];
    [tmp appendString:tunit.TD.begin];
    [tmp appendString:@" - "];
    [tmp appendString:tunit.TD.end];
    tdTime.text = tmp;
    
    tmp = [[NSMutableString alloc]init];
    [tmp appendString:tunit.TP.day];
    [tmp appendString:@" : "];
    [tmp appendString:tunit.TP.begin];
    [tmp appendString:@" - "];
    [tmp appendString:tunit.TP.end];
    tpTime.text = tmp;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
