//
//  DetailViewController.h
//  tp4-4.4.1
//
//  Created by Isabelle Richard on 18/12/13.
//  Copyright (c) 2013 Isabelle Richard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
