//
//  TeacherDetailViewController.m
//  Project
//
//  Created by Elias Abou Haydar on 07/01/14.
//  Copyright (c) 2014 Elias Abou Haydar. All rights reserved.
//

#import "TeacherDetailViewController.h"

@interface TeacherDetailViewController ()

@end

@implementation TeacherDetailViewController
@synthesize lastname;
@synthesize firstname;
@synthesize mail;
@synthesize teacher;
@synthesize image;

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
    lastname.text = [teacher lastname];
    firstname.text = [teacher firstname];
    NSURL *urlmail = [teacher mail];
    mail.text = [urlmail absoluteString];
    // NSString *path = @"http://didascalie.informatique.univ-paris-diderot.fr/img/photo.jpg";
    // NSURL *url = [NSURL URLWithString:path];
    NSURL *url = [teacher image];
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    
    UIImage *tmpImage = [[UIImage alloc] initWithData:data];
    
    image.image = tmpImage;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
