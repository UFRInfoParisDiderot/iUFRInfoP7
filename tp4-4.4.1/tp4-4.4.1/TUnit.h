//
//  Courses.h
//  Project
//
//  Created by Elias Abou Haydar on 05/12/13.
//  Copyright (c) 2013 Elias Abou Haydar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSchedule.h"

@interface TUnit : NSObject

@property NSString *name;
@property TSchedule *CM, *TD, *TP;
@property NSString *idTUnit;

@end
