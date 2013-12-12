//
//  AppDelegate.h
//  Project
//
//  Created by Elias Abou Haydar on 05/12/13.
//  Copyright (c) 2013 Elias Abou Haydar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyXMLParserDelegate.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong,retain) MyXMLParserDelegate *dparser;

@end
