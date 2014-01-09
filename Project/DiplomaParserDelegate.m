//
//  DiplomaParserDelegate.m
//  tp4-4.4.1
//
//  Created by Isabelle Richard on 20/12/13.
//  Copyright (c) 2013 Isabelle Richard. All rights reserved.
//

#import "DiplomaParserDelegate.h"

@implementation DiplomaParserDelegate

@synthesize currentDiploma;
@synthesize currentStringValue;
@synthesize currentDiplomaYear;
@synthesize diplomas;

// parsing starting elements
- (void) parser:(NSXMLParser *)parser didStartElement:
(NSString *)elementName namespaceURI:
(NSString *)namespaceURI qualifiedName:
(NSString *)qName attributes:
(NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"diplomes"]) {
        //creating the dictionary
        diplomas = [[NSMutableArray alloc] init];
        // NSLog(@"diplomas init");
    }
    
    if ([elementName isEqualToString:@"diplome"]) {
        currentDiploma = [[Diploma alloc] init];
        [diplomas addObject:currentDiploma];
        NSString *diplomaId = [attributeDict objectForKey:@"id"];
        if (diplomaId) {
            currentDiploma.name = diplomaId;
        }
    }
    
    if ([elementName isEqualToString:@"annee"]) {
        currentDiplomaYear = [[DiplomaYear alloc] init];
        [currentDiploma.years addObject:currentDiplomaYear];
        NSString *diplomaYearId = [attributeDict objectForKey:@"id"];
        if (diplomaYearId) {
            currentDiplomaYear.name = diplomaYearId;
            currentDiplomaYear.tUnits = [[NSMutableArray alloc] init];
        }
    }
        
    
}

// parsing characters elements
- (void) parser:(NSXMLParser *)parser foundCharacters:
(NSString *)string
{
    if (!currentStringValue) {
        currentStringValue = [[NSMutableString alloc] init];
    }
    [currentStringValue appendString:string];
}

// parsing ending elements
- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    // ignore root and empty elements
    if ([elementName isEqualToString:@"diplomes"] || [elementName isEqualToString:@"diplome"])
        return;
    
    NSString *value = [currentStringValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([elementName isEqualToString:@"UE"])
        [currentDiplomaYear.tUnits addObject:value];
    
    currentStringValue = nil;
}

@end
