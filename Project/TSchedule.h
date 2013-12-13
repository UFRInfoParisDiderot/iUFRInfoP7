//
//  TSchedule.h
//  Project
//
//  Created by RICHARD ISABELLE on 13/12/13.
//  Copyright (c) 2013 Elias Abou Haydar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSchedule : NSObject

@property NSString *idTSchedule;
@property NSString *idTeacher; // FIXME id or teacher directly ?
//@property Teacher *teacher;
@property NSString *day;
@property NSString *begin;
@property NSString *end;
@property NSString *room;

@end
