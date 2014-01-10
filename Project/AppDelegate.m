//
//  AppDelegate.m
//  tp4-4.4.1
//
//  Created by Isabelle Richard on 18/12/13.
//  Copyright (c) 2013 Isabelle Richard. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize menu;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    BOOL success;
    NSXMLParser *parser;
    NSURL *xmlURL;
    
    // NSString *diplomasFilePath = @"http://nivose.informatique.univ-paris-diderot.fr:8087/~richard/diplomes.xml";
    // NSString *teachersFilePath = @"http://nivose.informatique.univ-paris-diderot.fr:8087/~richard/enseignants.xml";
    // NSString *tUnitsFilePath = @"http://nivose.informatique.univ-paris-diderot.fr:8087/~richard/cours.xml";
    
    NSString *diplomasFilePath = @"file:///Users/ufr_info/workspaces/dev-mox/mox-tp4/Project/diplomes.xml";
    NSString *teachersFilePath = @"file:///Users/ufr_info/workspaces/dev-mox/mox-tp4/Project/enseignants.xml";
    NSString *tUnitsFilePath = @"file:///Users/ufr_info/workspaces/dev-mox/mox-tp4/Project/cours.xml";
    
    // initializing the menu
    menu = [[NSMutableArray alloc] init];
    [menu addObject:@"Cours"];
    [menu addObject:@"Diplômes"];
    [menu addObject:@"Enseignants"];
    
    // parsing teachers
    xmlURL = [NSURL URLWithString:teachersFilePath];
    self.teacherParserDelegate = [[TeacherParserDelegate alloc] init];
    parser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
    [parser setDelegate:self.teacherParserDelegate];
    [parser setShouldResolveExternalEntities:YES];
    success = [parser parse];
    if (!success) {
        NSLog(@"parse fail");
    } else {
        /* for (int i=0; i<[self.teacherParserDelegate.teachers count]; i++) {
         Teacher *value = [self.teacherParserDelegate.teachers objectAtIndex:i];
         NSLog(@"Nom: %@",value.firstname);
         }*/
    }
    
    // parsing teaching units
    xmlURL = [NSURL URLWithString:tUnitsFilePath];
    self.tUnitParserDelegate = [[TUnitParserDelegate alloc] init];
    parser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
    [parser setDelegate:self.tUnitParserDelegate];
    [parser setShouldResolveExternalEntities:YES];
    success = [parser parse];
    if (!success) {
        NSLog(@"parse fail");
    } else {
        /*for (int i=0; i<[self.tUnitParserDelegate.tUnits count]; i++) {
         TUnit *value = [self.tUnitParserDelegate.tUnits objectAtIndex:i];
         NSLog(@"Nom: %@",value.name);
         }*/
    }
    
    // parsing diplomas
    xmlURL = [NSURL URLWithString:diplomasFilePath];
    self.diplomaParserDelegate = [[DiplomaParserDelegate alloc] init];
    parser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
    [parser setDelegate:self.diplomaParserDelegate];
    [parser setShouldResolveExternalEntities:YES];
    success = [parser parse];
    if (!success) {
        NSLog(@"parse fail");
    } else {

    }

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    
}

@end
