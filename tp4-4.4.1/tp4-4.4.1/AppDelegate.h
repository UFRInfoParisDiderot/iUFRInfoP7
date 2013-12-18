//
//  AppDelegate.h
//  tp4-4.4.1
//
//  Created by Isabelle Richard on 18/12/13.
//  Copyright (c) 2013 Isabelle Richard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TeacherParserDelegate.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong,retain) TeacherParserDelegate *dparser;

@end
