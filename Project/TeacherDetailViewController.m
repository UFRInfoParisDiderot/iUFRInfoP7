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
#import "AppDelegate.h"
#import "TeacherUnitViewController.h"

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

    
    if ([segue.identifier isEqualToString:@"webPageSegue"]) {
        WebPageViewController *wpvc = segue.destinationViewController;
        wpvc.url = [teacher webpage];
        // hide the tab bar in the destination view
        wpvc.hidesBottomBarWhenPushed = YES;
    }
    else if ([segue.identifier isEqualToString:@"listUnitSegue"]) {
        // affichage des matieres enseignees par chaque enseignant
        AppDelegate *d = (AppDelegate *) [[UIApplication sharedApplication] delegate];
        
        
        NSMutableDictionary *resultCM = [[NSMutableDictionary alloc] init];
        NSMutableDictionary *resultTD = [[NSMutableDictionary alloc] init];
        NSMutableDictionary *resultTP = [[NSMutableDictionary alloc] init];
        for (int i=0; i<[d.teacherParserDelegate.teachers count]; i++) {
            Teacher *t = [d.teacherParserDelegate.teachers objectAtIndex:i];
            NSString *idTeacher = t.idteacher;
            NSMutableArray *CMi = [[NSMutableArray alloc] init];
            NSMutableArray *TDi = [[NSMutableArray alloc] init];
            NSMutableArray *TPi = [[NSMutableArray alloc] init];
            for (int j=0; j<[d.tUnitParserDelegate.tUnits count]; j++) {
                TUnit *tUnit =[d.tUnitParserDelegate.tUnits objectAtIndex:j];
                if (tUnit.CM.idTeacher != NULL && [tUnit.CM.idTeacher compare:idTeacher] == 0) {
                    [CMi addObject:tUnit];
                }
                if (tUnit.TD.idTeacher != NULL && [tUnit.TD.idTeacher compare:idTeacher] == 0) {
                    [TDi addObject:tUnit];
                }
                if (tUnit.TP.idTeacher != NULL && [tUnit.TP.idTeacher compare:idTeacher] == 0) {
                    [TPi addObject:tUnit];
                }
            }
            
            [resultCM setObject:CMi forKey:idTeacher];
            [resultTD setObject:TDi forKey:idTeacher];
            [resultTP setObject:TPi forKey:idTeacher];
            
        }
        
        // affichage des cours de JB
        NSMutableArray *teacherUnits = [[NSMutableArray alloc]init];
        
        NSLog(@"Cours de %@: ",teacher.lastname);
        // recuperer l'id de JB
        NSString *JBId = teacher.idteacher;
        NSLog(@"Cours magistraux: ");
        NSMutableArray *tmp = [resultCM objectForKey:JBId];
        for (TUnit *t in tmp) {
            NSLog(@"%@", t.name);
            [teacherUnits addObject:t];
        }
        NSLog(@"Travaux diriges: ");
        tmp = [resultTD objectForKey:JBId];
        for (TUnit *t in tmp) {
            NSLog(@"%@", t.name);
            [teacherUnits addObject:t];
        }
        NSLog(@"Travaux pratiques: ");
        tmp = [resultTP objectForKey:JBId];
        for (TUnit *t in tmp) {
            [teacherUnits addObject:t];
            NSLog(@"%@", t.name);
        }
        
        TeacherUnitViewController *tuvc = segue.destinationViewController;
        tuvc.teacherUnits = teacherUnits;

    }

}


@end
