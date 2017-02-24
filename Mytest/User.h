//
//  User.h
//  Mytest
//
//  Created by Andrew & Allison Bottoni.
//  Copyright (c) 2016 Andrew & Allison Bottoni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

- (void)loginWithUsername:(NSString *)username andPassword:(NSString *)password;
- (void)logout;
- (BOOL)userAuthenticated;

@end
