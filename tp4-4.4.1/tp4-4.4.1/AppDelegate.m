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
    
    NSString *diplomasFilePath = @"http://nivose.informatique.univ-paris-diderot.fr:8087/~richard/diplomes.xml";
    NSString *teachersFilePath = @"http://nivose.informatique.univ-paris-diderot.fr:8087/~richard/enseignants.xml";
    NSString *tUnitsFilePath = @"http://nivose.informatique.univ-paris-diderot.fr:8087/~richard/cours.xml";
    
    // initializing the menu
    menu = [[NSMutableArray alloc] init];
    [menu addObject:@"Cours"];
    [menu addObject:@"Diplômes"];
    [menu addObject:@"Enseignants"];
    
    // parsing teachers
    xmlURL = [NSURL URLWithString:teachersFilePath];
    self.dparser = [[TeacherParserDelegate alloc] init];
    parser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
    [parser setDelegate:self.dparser];
    [parser setShouldResolveExternalEntities:YES];
    success = [parser parse];
    if (!success) {
        NSLog(@"parse fail");
    } else {
#warning TODO delete the following test
        for (int i=0; i<[self.dparser.teachers count]; i++) {
            Teacher *value = [self.dparser.teachers objectAtIndex:i];
            NSLog(@"Nom: %@",value.firstname);
        }
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
#warning TODO delete the following test
        for (int i=0; i<[self.tUnitParserDelegate.tUnits count]; i++) {
            TUnit *value = [self.tUnitParserDelegate.tUnits objectAtIndex:i];
            NSLog(@"Nom: %@",value.name);
        }
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
#warning TODO delete the following test
        for (int i=0; i<[self.diplomaParserDelegate.diplomas count]; i++) {
            Diploma *value = [self.diplomaParserDelegate.diplomas objectAtIndex:i];
            NSLog(@"Nom: %@",value.name);
        }
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
