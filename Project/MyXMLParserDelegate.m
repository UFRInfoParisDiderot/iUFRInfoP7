//
//  MyXMLParserDelegate.m
//  Project
//
//  Created by Elias Abou Haydar on 05/12/13.
//  Copyright (c) 2013 Elias Abou Haydar. All rights reserved.
//

#import "MyXMLParserDelegate.h"
#import "Teacher.h"
#import "TUnit.h"

@implementation MyXMLParserDelegate
@synthesize teachers;
@synthesize currentTeacher;
@synthesize currentStringValue;

// parsing starting elements
- (void) parser:(NSXMLParser *)parser didStartElement:
(NSString *)elementName namespaceURI:
(NSString *)namespaceURI qualifiedName:
(NSString *)qName attributes:
(NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"enseignants"]) {
        //creating the dictionary
        teachers = [[NSMutableArray alloc] init];
    }
    
    if ([elementName isEqualToString:@"enseignant"]) {
        currentTeacher = [[Teacher alloc] init];
        // adding the current teacher in the dictionary, with his id for key
        NSString *teacherId = [attributeDict objectForKey:@"id"];
        if (teacherId) {
            currentTeacher.idteacher = teacherId;
            [teachers addObject:currentTeacher];
        }
    }

}

// parsing characters elements
- (void) parser:(NSXMLParser *)parser foundCharacters:
(NSString *)string
{
    // NSLog(@"string = %@",string);
    if (!currentStringValue) {
        currentStringValue = [[NSMutableString alloc] init];
    }
    
    [currentStringValue appendString:string];
}

// parsing ending elements
- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    // ignore root and empty elements
    if ([elementName isEqualToString:@"enseignants"] || [elementName isEqualToString:@"enseignant"])
        return;
    
    NSString *value = [currentStringValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([elementName isEqualToString:@"nom"])
        currentTeacher.lastname = value;
    
    if ([elementName isEqualToString:@"prenom"])
        currentTeacher.firstname = value;
    
    if ([elementName isEqualToString:@"web"])
        currentTeacher.webpage = [NSURL URLWithString:value];
    
    if ([elementName isEqualToString:@"mail"])
        currentTeacher.mail = [NSURL URLWithString:value];
    
    if ([elementName isEqualToString:@"photo"])
        currentTeacher.image = [NSURL URLWithString:value];
    
    currentStringValue = nil;
}

@end

