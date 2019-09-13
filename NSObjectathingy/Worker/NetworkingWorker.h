//
//  NetworkingWorker.h
//  NSObjectathingy
//
//  Created by K Y on 9/12/19.
//  Copyright © 2019 K Y. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserSignIn.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetworkingWorker : NSObject

- (void)performSignIn:(UserSignIn *)details
              success:(void (^)(void))success
              failure:(void (^)(NSError *))failure;

@end

NS_ASSUME_NONNULL_END
