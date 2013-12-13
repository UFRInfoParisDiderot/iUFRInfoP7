//
//  TUnitParser.m
//  Project
//
//  Created by RICHARD ISABELLE on 13/12/13.
//  Copyright (c) 2013 Elias Abou Haydar. All rights reserved.
//

#import "TUnitParserDelegate.h"

@implementation TUnitParserDelegate


@synthesize tUnits;
@synthesize currentTUnit;
@synthesize currentTSchedule;
@synthesize currentStringValue;

// parsing starting elements
- (void) parser:(NSXMLParser *)parser didStartElement:
(NSString *)elementName namespaceURI:
(NSString *)namespaceURI qualifiedName:
(NSString *)qName attributes:
(NSDictionary *)attributeDict
{
    NSLog(@"parser");
    if ([elementName isEqualToString:@"cours"]) {
        //creating the dictionary
        tUnits = [[NSMutableArray alloc] init];
    }
    
    if ([elementName isEqualToString:@"UE"]) {
        currentTUnit = [[TUnit alloc] init];
        // adding the current teacher in the dictionary, with his id for key
        NSString *tUnitId = [attributeDict objectForKey:@"id"];
        if (tUnitId) {
            currentTUnit.idTUnit = tUnitId;
            [tUnits addObject:currentTUnit];
        }
    }
    
    if ([elementName isEqualToString:@"CM"]
        || [elementName isEqualToString:@"TP"]
        || [elementName isEqualToString:@"TD"]) {
        currentTSchedule = [[TSchedule alloc] init];
    }
    
}

// parsing characters elements
- (void) parser:(NSXMLParser *)parser foundCharacters:
(NSString *)string
{
    NSLog(@"TUnitParseDelegate : foundCharacters");
    if (!currentStringValue) {
        currentStringValue = [[NSMutableString alloc] init];
    }
    
    [currentStringValue appendString:string];
}

// parsing ending elements
- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    // ignore root and empty elements
    if ([elementName isEqualToString:@"cours"]
        || [elementName isEqualToString:@"UE"]
        || [elementName isEqualToString:@"horaire"])
        return;
    
    NSString *value = [currentStringValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([elementName isEqualToString:@"intitule"])
        currentTUnit.name = value;
    
    if ([elementName isEqualToString:@"enseignant"])
        currentTSchedule.idTeacher = value;
    
    if ([elementName isEqualToString:@"salle"])
        currentTSchedule.room = value;
    
    if ([elementName isEqualToString:@"jour"])
        currentTSchedule.day = value;
    
    if ([elementName isEqualToString:@"debut"])
        currentTSchedule.begin = value;
    
    if ([elementName isEqualToString:@"fin"])
        currentTSchedule.end = value;
    
    if ([elementName isEqualToString:@"CM"])
        currentTUnit.CM = currentTSchedule;
    
    if ([elementName isEqualToString:@"TD"])
        currentTUnit.TD = currentTSchedule;
    
    if ([elementName isEqualToString:@"TP"])
        currentTUnit.TP = currentTSchedule;
    
    currentStringValue = nil;
}

@end
