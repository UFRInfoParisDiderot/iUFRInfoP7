//
//  AppDelegate.m
//  Project
//
//  Created by Elias Abou Haydar on 05/12/13.
//  Copyright (c) 2013 Elias Abou Haydar. All rights reserved.
//

#import "AppDelegate.h"
#import "MyXMLParserDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    BOOL success;

    NSString *pathToFile =@"file:///Users/ufr_info/workspaces/dev-mox/Project/Project/enseignants.xml";
    NSURL *xmlURL = [NSURL URLWithString:pathToFile];
                      
    NSXMLParser *addressParser;
    MyXMLParserDelegate *dparser = [[MyXMLParserDelegate alloc] init];
    
    addressParser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
    [addressParser setDelegate:dparser];
    [addressParser setShouldResolveExternalEntities:YES];
    
    success = [addressParser parse]; // return value not used
    // if not successful, delegate is informed of error
    if (success) {
        for (NSString* key in dparser.contents) {
            Teacher *value = [dparser.contents objectForKey:key];
            // do stuff
            NSLog(@"%@",value.firstname);
        }
    }
    else { NSLog(@"parse fail"); }
    
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
