//
//  RootViewController.h
//  Mytest
//
//  Created by Andrew & Allison Bottoni.
//  Copyright (c) 2016 Andrew & Allison Bottoni. All rights reserved.
//

#import "Backendless.h"
#import <UIKit/UIKit.h>
//#import "LoginViewController.h"
#import "User.h"

@protocol LoginViewProtocol <NSObject>

- (void)dismissAndLoginView;

@end

@interface RootViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *loginInput;
@property (weak, nonatomic) IBOutlet UITextField *passwordInput;
@property (nonatomic, weak) IBOutlet UIView      *logoutView;
@property (nonatomic, weak) IBOutlet UISwitch    *rememberMeSwitch;

-(void)showSuccessView;

-(IBAction)rememberMe:(UISwitch *)sender;
-(IBAction)loginWithFacebook:(id)sender;
-(IBAction)loginWithTwitter:(id)sender;
-(IBAction)loginWithGooglePlus:(id)sender;
-(IBAction)login:(id)sender;
-(IBAction)registration:(UIStoryboardSegue *)segue;
-(IBAction)cancel:(UIStoryboardSegue *)segue;
-(IBAction)logout:(id)sender;



//
//@property (nonatomic, weak) id <LoginViewProtocol> delegate;
//@property (nonatomic, retain) LoginViewController *loginView;


@end
