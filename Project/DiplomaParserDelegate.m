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
    
    if ([elementName isEqualToString:@"annee"]) {
        currentDiploma = [[Diploma alloc] init];
        [diplomas addObject:currentDiploma];
        NSString *yearid = [attributeDict objectForKey:@"id"];
        if (yearid) {
            currentDiploma.name = yearid;
            currentDiploma.tUnits = [[NSMutableArray alloc] init];
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
    
    if ([elementName isEqualToString:@"UE"]) {
        // NSLog(@"- %@", );
        [currentDiploma.tUnits addObject:value];
    }
    
    if ([elementName isEqualToString:@"url1"]) {
    NSString *value = [currentStringValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        // NSLog(@"%@",value);
        currentDiploma.url1 = [NSURL URLWithString:value];
        currentDiploma.url1 = [NSURL URLWithString:value];
    }
    
    if ([elementName isEqualToString:@"url2"]) {
        NSString *value = [currentStringValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        // NSLog(@"%@",value);
        currentDiploma.url2 = [NSURL URLWithString:value];
        currentDiploma.url2 = [NSURL URLWithString:value];
    }
    
    currentStringValue = nil;
}

@end
