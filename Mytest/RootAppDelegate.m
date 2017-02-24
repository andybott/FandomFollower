//
//  RootAppDelegate.m
//  Mytest
//
//  Created by Andrew & Allison Bottoni.
//  Copyright (c) 2016 Andrew & Allison Bottoni. All rights reserved.
//

#import "RootAppDelegate.h"
//#import "User.h"
#import "Backendless.h"
#import "RootViewController.h"

static NSString *APP_ID = @"FBFCCCA4-7C80-7113-FF7F-8C032B5EA100";
static NSString *SECRET_KEY = @"D20F869A-2122-F727-FF06-E1F629177A00";
static NSString *VERSION_NUM = @"v1";


@implementation RootAppDelegate

-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    BackendlessUser *user = [backendless.userService handleOpenURL:url];
    if ([user isKindOfClass:[BackendlessUser class]]) {
        [(RootViewController *)self.window.rootViewController showSuccessView];
    }
    return YES;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    User *userObj = [[User alloc] init];
//    self.authenticated = [userObj userAuthenticated];
    
    [DebLog setIsActive:YES];
    
    backendless.hostURL = @"https://api.backendless.com";
    [backendless initApp:APP_ID secret:SECRET_KEY version:VERSION_NUM];
  // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
