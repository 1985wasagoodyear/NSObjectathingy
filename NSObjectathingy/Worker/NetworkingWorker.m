//
//  NetworkingWorker.m
//  NSObjectathingy
//
//  Created by K Y on 9/12/19.
//  Copyright © 2019 K Y. All rights reserved.
//

#import "NetworkingWorker.h"
#import "NetworkOperation.h"
#import "Endpoints.h"

@interface NetworkingWorker () {
    NSURLSessionConfiguration *_config;
    NSURLSession *_session;
}

@end

@implementation NetworkingWorker

- (instancetype)init {
    self = [super init];
    if (self) {
        _config = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:_config];
    }
    return self;
}

- (instancetype)initWithSession:(NSURLSession *)session {
    self = [super init];
    if (self) {
        _config = session.configuration;
        _session = session;
    }
    return self;
}

- (void)performSignIn:(UserSignIn *)details {
    NSURL *url = [NSURL URLWithString:SIGNIN_URL];
    NetworkOperation *op = [[NetworkOperation alloc] init:_session
                                                      url:url
                                                   method:@"POST"
                                                     body:[details dictData]
                                               completion:^(NSData *dat, NSURLResponse *resp, NSError *err) {
                                                   NSLog(@"did sign in");
    }];
    [[NSOperationQueue currentQueue] addOperation:op];
}

@end
