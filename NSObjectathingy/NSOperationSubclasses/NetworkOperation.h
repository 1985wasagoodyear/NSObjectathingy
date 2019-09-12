//
//  NetworkOperation.h
//  NSObjectathingy
//
//  Created by K Y on 9/12/19.
//  Copyright © 2019 K Y. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NWMOperations.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetworkOperation : NWMOperation

- (instancetype)init:(NSURLSession *)session
                 url:(NSURL *)url
              method:(NSString *)method
                body:(NSDictionary *)body
          completion:(void (^)(NSData *, NSURLResponse *, NSError *))completion;

- (instancetype)init:(NSURLSession *)session
                 url:(NSURL *)url
              method:(NSString *)method
          completion:(void (^)(NSData *, NSURLResponse *, NSError *))completion;

+ (void)test;

@end

NS_ASSUME_NONNULL_END

