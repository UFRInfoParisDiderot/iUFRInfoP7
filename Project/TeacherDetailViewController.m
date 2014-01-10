//
//  TeacherDetailViewController.m
//  Project
//
//  Created by Elias Abou Haydar on 07/01/14.
//  Copyright (c) 2014 Elias Abou Haydar. All rights reserved.
//

#import "TeacherDetailViewController.h"
#import "WebPageViewController.h"
#import <MessageUI/MessageUI.h>

@interface TeacherDetailViewController ()<
    MFMailComposeViewControllerDelegate,
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
//	shouldAutorotateToInterfaceOrientation:
//  Disable rotation on iOS 5.x and earlier.  Note, for iOS 6.0 and later all you
//  need is "UISupportedInterfaceOrientations" defined in your Info.plist
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
#endif

#pragma mark - Actions

//	showMailPicker:
//  IBAction for the Compose Mail button.
- (IBAction)showMailPicker:(id)sender
{
    if ([MFMailComposeViewController canSendMail])
    {
        [self displayMailComposerSheet];
    }
    else
    {
        UIAlertView *alert;
        alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Device not configured to send mail" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

#pragma mark - Compose Mail

//	displayMailComposerSheet
//  Displays an email composition interface inside the application.
//  Populates all the Mail fields.
- (void)displayMailComposerSheet
{
	MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
	picker.mailComposeDelegate = self;
	
    // Set up contents
    NSURL *adress = (NSURL *)[teacher mail];
    NSString *str = [adress absoluteString];
    
	NSArray *toRecipients = [NSArray arrayWithObjects:str, nil] ;
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

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    WebPageViewController *wpvc = segue.destinationViewController;
    wpvc.url = [teacher webpage];
    
    // hide the tab bar in the destination view
    wpvc.hidesBottomBarWhenPushed = YES;

}


@end
