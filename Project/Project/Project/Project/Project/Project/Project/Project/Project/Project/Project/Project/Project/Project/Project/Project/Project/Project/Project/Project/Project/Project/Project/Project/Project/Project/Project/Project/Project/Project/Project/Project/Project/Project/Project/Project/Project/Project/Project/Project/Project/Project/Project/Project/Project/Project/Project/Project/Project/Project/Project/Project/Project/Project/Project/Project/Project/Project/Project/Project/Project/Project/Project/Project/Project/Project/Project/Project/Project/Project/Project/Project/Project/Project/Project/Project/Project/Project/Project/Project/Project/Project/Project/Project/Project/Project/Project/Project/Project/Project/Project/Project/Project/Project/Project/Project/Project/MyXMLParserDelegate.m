//
//  MyXMLParserDelegate.m
//  Project
//
//  Created by Elias Abou Haydar on 05/12/13.
//  Copyright (c) 2013 Elias Abou Haydar. All rights reserved.
//

#import "MyXMLParserDelegate.h"

@implementation MyXMLParserDelegate

- (void) parser:(NSXMLParser *)parser didStartElement:
(NSString *)elementName namespaceURI:
(NSString *)namespaceURI qualifiedName:
(NSString *)qName attributes:
(NSDictionary *)attributeDict
{
    NSLog(@"%@",elementName);
    if ([elementName isEqualToString:@"enseignants"]) {
        NSLog(@"Enseignants");
    }
}

- (void) parser:(NSXMLParser *)parser foundCharacters:
(NSString *)string
{
    
}

- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
}

@end
