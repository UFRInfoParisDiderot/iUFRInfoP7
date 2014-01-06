//
//  MyXMLParserDelegate.h
//  Project
//
//  Created by Elias Abou Haydar on 05/12/13.
//  Copyright (c) 2013 Elias Abou Haydar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Teacher.h"

@interface TeacherParserDelegate : NSObject <NSXMLParserDelegate>

@property NSMutableArray *teachers;
@property Teacher *currentTeacher;
@property NSMutableString *currentStringValue;

@end
