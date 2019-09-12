//
//  UserSignIn.h
//  NSObjectathingy
//
//  Created by K Y on 9/12/19.
//  Copyright © 2019 K Y. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserSignIn : NSObject

- (instancetype)init:(NSString *)username password:(NSString *)password;
- (NSData *)dictData;
- (NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
