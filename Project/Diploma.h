//
//  Diploma.h
//  Project
//
//  Created by Elias Abou Haydar on 05/12/13.
//  Copyright (c) 2013 Elias Abou Haydar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Diploma : NSObject

@property NSString *name;
@property NSURL *url1;
@property NSURL *url2;
@property NSMutableArray *tUnits;

- (id)init;

@end
