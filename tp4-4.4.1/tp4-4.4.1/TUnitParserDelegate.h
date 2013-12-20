//
//  TUnitParser.h
//  Project
//
//  Created by RICHARD ISABELLE on 13/12/13.
//  Copyright (c) 2013 Elias Abou Haydar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TUnit.h"
#import "TSchedule.h"

@interface TUnitParserDelegate : NSObject <NSXMLParserDelegate>

@property NSMutableArray *tUnits;
@property TUnit *currentTUnit;
@property TSchedule *currentTSchedule;
@property NSMutableString *currentStringValue;

@end
