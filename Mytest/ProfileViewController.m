//
//  ProfileViewController.m
//  Mytest
//
//  Created by Andrew & Allison Bottoni.
//  Copyright (c) 2016 Andrew & Allison Bottoni. All rights reserved.
//

#import "ProfileViewController.h"
#import "RootViewController.h"
#import "RootAppDelegate.h"
//#import "User.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

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
    
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    
//    if(![(RootAppDelegate*)[[UIApplication sharedApplication] delegate] authenticated]) {
//        
//        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        
//        RootViewController *initView =  (RootViewController*)[storyboard instantiateViewControllerWithIdentifier:@"initialView"];
//        [initView setModalPresentationStyle:UIModalPresentationFullScreen];
//        [self presentViewController:initView animated:NO completion:nil];
//    } else{
//        // proceed with the profile view
//    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logoutAction:(id)sender {
//    User *userObj = [[User alloc] init];
//    [userObj logout];
//    
//    RootAppDelegate *authObj = (RootAppDelegate*)[[UIApplication sharedApplication] delegate];
//    authObj.authenticated = YES;
//    
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    
//    RootViewController *initView =  (RootViewController*)[storyboard instantiateViewControllerWithIdentifier:@"initialView"];
//    [initView setModalPresentationStyle:UIModalPresentationFullScreen];
//    [self presentViewController:initView animated:NO completion:nil];
    
}

@end
