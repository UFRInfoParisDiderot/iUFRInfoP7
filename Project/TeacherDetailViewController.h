//
//  TeacherDetailViewController.h
//  Project
//
//  Created by Elias Abou Haydar on 07/01/14.
//  Copyright (c) 2014 Elias Abou Haydar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Teacher.h"

@interface TeacherDetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *lastname;
@property (strong, nonatomic) IBOutlet UILabel *firstname;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) Teacher *teacher;


@end
