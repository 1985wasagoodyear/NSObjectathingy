//
//  CredentialsValidator.m
//  NSObjectathingy
//
//  Created by K Y on 9/12/19.
//  Copyright © 2019 K Y. All rights reserved.
//

#import "CredentialsValidator.h"

@implementation CredentialsValidator

+ (BOOL)isValidEmail:(NSString *)email {
    if ([email length] == 0) {
        return NO;
    }
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

+ (BOOL)isValidPassword:(NSString *)password {
    if ([password length] < 8) {
        return NO;
    }
    return YES;
}

@end
