//
//  UserSignIn.h
//  NSObjectathingy
//
//  Created by K Y on 9/12/19.
//  Copyright © 2019 K Y. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 
 Represents the Sign In credentials for a User.
 
 **/

@interface UserSignIn : NSObject

/**
 
 Creates a Sign In credential for a user
 
 - Parameters:
    - username: a valid email address
    - password: a password of length > 8
 
 - Returns:
    - A valid instance if the username and password are valid
    - nil if they are not.
 
 **/
- (instancetype)init:(NSString *)username password:(NSString *)password;

- (NSData *)dictData;
- (NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
