//
//  AppDelegate.h
//  tp4-4.4.1
//
//  Created by Isabelle Richard on 18/12/13.
//  Copyright (c) 2013 Isabelle Richard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DiplomaParserDelegate.h"
#import "TeacherParserDelegate.h"
#import "TUnitParserDelegate.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong,retain) TeacherParserDelegate *teacherParserDelegate;
@property (strong,retain) TUnitParserDelegate *tUnitParserDelegate;
@property (strong,retain) DiplomaParserDelegate *diplomaParserDelegate;
@property (strong, retain) NSMutableArray *menu;

@end
