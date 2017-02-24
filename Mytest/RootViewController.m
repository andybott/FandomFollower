//
//  RootViewController.m
//  Mytest
//
//  Created by Andrew & Allison Bottoni.
//  Copyright (c) 2016 Andrew & Allison Bottoni. All rights reserved.
//

#import "RootViewController.h"
#import "LoginViewController.h"
#import "RootAppDelegate.h"

@interface RootViewController ()

@end

@implementation RootViewController

//@synthesize loginView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _rememberMeSwitch.on = backendless.userService.isStayLoggedIn;
    if (backendless.userService.currentUser) {
        [_logoutView setHidden:NO];
    }
    @try {
        [backendless initAppFault];
    }
    @catch (Fault *fault) {
        [self showAlert:fault.message];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}







#pragma mark -
#pragma mark Private Methods
-(void)showAlert:(NSString *)message {
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Fault:" message:message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [av show];
}

#pragma mark -
#pragma mark Public Methods

-(void)showSuccessView
{
    _logoutView.hidden = NO;
}

#pragma mark -
#pragma mark IBAction

-(IBAction)rememberMe:(UISwitch *)sender
{
    [backendless.userService setStayLoggedIn:sender.on];
}

-(IBAction)loginWithFacebook:(id)sender
{
    [backendless.userService
     easyLoginWithFacebookFieldsMapping:@{@"email":@"email"}
     permissions:@[@"email"]
     response:^(id response) {
         NSLog(@"loginWithFacebook: %@", response);
         [self successfulLogin];
     }
     error:^(Fault *fault) {
         NSLog(@"Error loginWithFacebook: %@", fault.detail);
     }];
}

-(IBAction)loginWithTwitter:(id)sender
{
    [backendless.userService
     easyLoginWithTwitterFieldsMapping:@{@"email":@"email"}
     response:^(id response) {
         NSLog(@"loginWithTwitter: %@", response);
         [self successfulLogin];
     }
     error:^(Fault *fault) {
         NSLog(@"Error loginWithTwitter: %@", fault.detail);
     }];
}

-(IBAction)loginWithGooglePlus:(id)sender
{
    [backendless.userService
     easyLoginWithGooglePlusFieldsMapping:@{@"email":@"email"}
     permissions:@[@"email"]
     response:^(id response) {
         NSLog(@"loginWithGooglePlus: %@", response);
         [self successfulLogin];
     }
     error:^(Fault *fault) {
         NSLog(@"Error loginWithGooglePlus: %@", fault.detail);
     }];
}

-(void)successfulLogin {
    RootAppDelegate *authObj = (RootAppDelegate*)[[UIApplication sharedApplication] delegate];
    authObj.authenticated = YES;
    [self performSegueWithIdentifier:@"loginToRootSegue" sender:self];
}

-(IBAction)login:(id)sender
{
    [backendless.userService
     login:self.loginInput.text
     password:self.passwordInput.text
     response:^(BackendlessUser *user) {
         _logoutView.hidden = NO;
         NSLog(@"%@", user);
         // https://developer.apple.com/library/ios/featuredarticles/ViewControllerPGforiPhoneOS/UsingSegues.html
         //loginToRootSegue
         NSLog(@"************ Successful Login: %@  Password: %@", self.loginInput.text,self.passwordInput.text);
         
         [self successfulLogin];
     }
     error:^(Fault *fault) {
         NSLog(@"%@", fault.detail);
     }];
    //NSLog(@"Login: %@  Password: %@", self.loginInput.text,self.passwordInput.text);
}

// http://stackoverflow.com/questions/27939361/shouldperformseguewithidentifier-called-before-checking-other-method-issue
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    
    BOOL ret=YES;
    
    if ([identifier isEqualToString:@"RootToTabAfterLogin"]) {
        RootAppDelegate *authObj = (RootAppDelegate*)[[UIApplication sharedApplication] delegate];
        if (!(authObj.authenticated == YES)) {
            ret=NO;
        }
    }
    return ret;
}

#pragma mark -
#pragma mark - IBAction for Unwind Seque

-(IBAction)cancel:(UIStoryboardSegue *)segue {
    if ([[segue identifier] isEqualToString:@"Cancel.RegisterViewController"]) {
        
        [backendless.userService logout:nil];
        return;
    }
}

-(void)registration:(UIStoryboardSegue *)segue
{
    _loginInput.text = @"";
    _passwordInput.text = @"";
}

#pragma mark -


-(IBAction)logout:(id)sender
{
    [backendless.userService
     logout:^(id response) {
         _logoutView.hidden = YES;
         NSLog(@"%@", response);
     }
     error:^(Fault *fault) {
         NSLog(@"%@", fault);
     }];
}

#pragma mark Segue Methods

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"RegisterViewController"]) {
        return;
    }
}

#pragma mark -
#pragma mark UITextFieldDelegate Methods

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}










//- (IBAction)loginBtnPressed:(id)sender {
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(loginActionFinished:)
//                                                 name:@"loginActionFinished"
//                                               object:loginView];
//    
//}
//
//#pragma mark - Dismissing Delegate Methods
//
//-(void) loginActionFinished:(NSNotification*)notification {
//    
//    RootAppDelegate *authObj = (RootAppDelegate*)[[UIApplication sharedApplication] delegate];
//    authObj.authenticated = YES;
//    
//    [self dismissLoginAndShowProfile];
//}
//
//- (void)dismissLoginAndShowProfile {
//    [self dismissViewControllerAnimated:NO completion:^{
//        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        UITabBarController *tabView = [storyboard instantiateViewControllerWithIdentifier:@"profileView"];
//        [self presentViewController:tabView animated:YES completion:nil];
//    }];
//        
//    
//}

@end
