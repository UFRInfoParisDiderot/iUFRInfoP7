//
//  DiplomaParserDelegate.h
//  tp4-4.4.1
//
//  Created by Isabelle Richard on 20/12/13.
//  Copyright (c) 2013 Isabelle Richard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Diploma.h"
#import "DiplomaYear.h"

@interface DiplomaParserDelegate : NSObject<NSXMLParserDelegate>

@property NSMutableArray *diplomas;
@property Diploma *currentDiploma;
@property DiplomaYear *currentDiplomaYear;
@property NSMutableString *currentStringValue;

@end
