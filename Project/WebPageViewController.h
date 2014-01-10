//
//  WebPageViewController.h
//  Project
//
//  Created by Elias Abou Haydar on 09/01/14.
//  Copyright (c) 2014 Elias Abou Haydar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebPageViewController : UIViewController

{
    IBOutlet UIWebView *webview;
}

@property (strong,nonatomic) NSURL *url;

@end
