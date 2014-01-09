//
//  TeacherDetailViewController.m
//  Project
//
//  Created by Elias Abou Haydar on 07/01/14.
//  Copyright (c) 2014 Elias Abou Haydar. All rights reserved.
//

#import "TeacherDetailViewController.h"
#import <MessageUI/MessageUI.h>

@interface TeacherDetailViewController ()<
    MFMailComposeViewControllerDelegate,
    MFMessageComposeViewControllerDelegate,
    UINavigationControllerDelegate
>

@end

@implementation TeacherDetailViewController
@synthesize lastname;
@synthesize firstname;
@synthesize teacher;
@synthesize image;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    lastname.text = [teacher lastname];
    firstname.text = [teacher firstname];
    NSURL *url = [teacher image];
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    
    UIImage *tmpImage = [[UIImage alloc] initWithData:data];
    
    image.image = tmpImage;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Rotation

#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_6_0
// -------------------------------------------------------------------------------
//	shouldAutorotateToInterfaceOrientation:
//  Disable rotation on iOS 5.x and earlier.  Note, for iOS 6.0 and later all you
//  need is "UISupportedInterfaceOrientations" defined in your Info.plist
// -------------------------------------------------------------------------------
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
#endif

#pragma mark - Actions

// -------------------------------------------------------------------------------
//	showMailPicker:
//  IBAction for the Compose Mail button.
// -------------------------------------------------------------------------------
- (IBAction)showMailPicker:(id)sender
{
    // You must check that the current device can send email messages before you
    // attempt to create an instance of MFMailComposeViewController.  If the
    // device can not send email messages,
    // [[MFMailComposeViewController alloc] init] will return nil.  Your app
    // will crash when it calls -presentViewController:animated:completion: with
    // a nil view controller.
    if ([MFMailComposeViewController canSendMail])
        // The device can send email.
    {
        [self displayMailComposerSheet];
    }
    else
        // The device can not send email.
    {
        // self.feedbackMsg.hidden = NO;
		// self.feedbackMsg.text = @"Device not configured to send mail.";
    }
}

#pragma mark - Compose Mail

// -------------------------------------------------------------------------------
//	displayMailComposerSheet
//  Displays an email composition interface inside the application.
//  Populates all the Mail fields.
// -------------------------------------------------------------------------------
- (void)displayMailComposerSheet
{
	MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
	picker.mailComposeDelegate = self;
		
	// Set up recipients
    // NSString *str = [teacher mail];
    // NSLog(@"%@",str);
    //str = [str lowercaseString];
    //NSLog(@"%@",str);
    
	NSArray *toRecipients = [NSArray arrayWithObject:@"first@example.com"];
	[picker setToRecipients:toRecipients];
	
	[self presentViewController:picker animated:YES completion:NULL];
}

#pragma mark - Delegate Methods

//	mailComposeController:didFinishWithResult:
//  Dismisses the email composition interface when users tap Cancel or Send.
//  Proceeds to update the message field with the result of the operation.
- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    UIAlertView *alert;

	switch (result)
	{
		case MFMailComposeResultCancelled:
            alert = [[UIAlertView alloc] initWithTitle:@"Information" message:@"Mail sending canceled" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
			break;
		case MFMailComposeResultSaved:
            alert = [[UIAlertView alloc] initWithTitle:@"Information" message:@"Mail saved" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
			break;
		case MFMailComposeResultSent:
            alert = [[UIAlertView alloc] initWithTitle:@"Information" message:@"Mail sent" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            break;
		case MFMailComposeResultFailed:
            alert = [[UIAlertView alloc] initWithTitle:@"Information" message:@"Mail sending failed" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
			break;
		default:
            alert = [[UIAlertView alloc] initWithTitle:@"Information" message:@"Mail not sent" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
			break;
	}
    
	[self dismissViewControllerAnimated:YES completion:NULL];
}


@end
