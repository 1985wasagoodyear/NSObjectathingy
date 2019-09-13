//
//  UserSignIn.m
//  NSObjectathingy
//
//  Created by K Y on 9/12/19.
//  Copyright © 2019 K Y. All rights reserved.
//

#import "UserSignIn.h"
#import "CredentialsValidator.h"

NSString *const USERNAME_KEY = @"email";
NSString *const PASSWORD_KEY = @"password";

@implementation UserSignIn {
    NSString *_username;
    NSString *_password;
}

- (instancetype)init {
    NSException* myException = [NSException
                                exceptionWithName:@"Do not call init: on this object. "
                                reason:@"Use init:username:password, instead."
                                userInfo:nil];
    @throw myException;
}

- (instancetype)init:(NSString *)username password:(NSString *)password {
    if ([CredentialsValidator isValidEmail:username]
        && [CredentialsValidator isValidPassword:password]) {
        self = [super init];
        if (self) {
            _username = username;
            _password = password;
        }
    }
    else {
        self = nil;
    }
    return self;
}

- (NSDictionary *)dict {
    return @{USERNAME_KEY: _username,
             PASSWORD_KEY: _password};
}

- (NSData *)dictData {
    return [NSJSONSerialization dataWithJSONObject:[self dict]
                                           options:NSJSONWritingPrettyPrinted
                                             error:nil];
}

@end
