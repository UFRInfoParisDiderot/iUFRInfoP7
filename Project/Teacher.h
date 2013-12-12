//
//  Teacher.h
//  TP4
//
//  Created by Elias Abou Haydar on 04/12/13.
//  Copyright (c) 2013 Elias Abou Haydar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Teacher : NSObject

@property NSString *firstname;
@property NSString *lastname;
@property NSURL *image;
@property NSURL *webpage;
@property NSString *mail;
@property NSString *idteacher;

- (id) init;

@end
