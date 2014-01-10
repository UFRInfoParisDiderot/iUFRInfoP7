//
//  DiplomaDetailViewController.h
//  Project
//
//  Created by Elias Abou Haydar on 09/01/14.
//  Copyright (c) 2014 Elias Abou Haydar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Diploma.h"

@interface DiplomaDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) Diploma *diploma;

@end
