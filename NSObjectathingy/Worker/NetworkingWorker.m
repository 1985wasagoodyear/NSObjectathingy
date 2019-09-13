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
    BOOL success;
    NSError *error;
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

- (void)performSignIn:(UserSignIn *)details
              success:(void (^)(void))success
              failure:(void (^)(NSError *))failure {
    if (details == nil) {
        NSError *err = [NSError errorWithDomain:@"Invalid User Details" code:0 userInfo:nil];
        failure(err);
        return;
    }
    
    NetworkOperation *signInOp = [self networkSignInOp: details];
    
    __weak typeof(self) weakSelf = self;
    NSBlockOperation *signInCompleteOp = [NSBlockOperation blockOperationWithBlock:^{
        // do some extra work here, upon completing signin.
        // perhaps saving token information.
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (strongSelf->success == YES) {
            success();
        }
        else {
            failure(strongSelf->error);
        }
    }];
    
    [signInCompleteOp addDependency:signInOp];
    [[NSOperationQueue currentQueue] addOperations:@[signInOp, signInCompleteOp]
                                 waitUntilFinished:false];
}

// determine the operation to build, based on if it's with user details or something like a token...
- (NetworkOperation *)networkSignInOp:(UserSignIn *)details {
    NSURL *url = [NSURL URLWithString:SIGNIN_URL];
    __weak typeof(self) weakSelf = self;
    void(^completion)(NSData *, NSURLResponse *, NSError *) = ^(NSData *dat, NSURLResponse *resp, NSError *err) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        /*if (err == nil) {
            strongSelf->success = YES;
        }
        else {
            strongSelf->error = err;
        }*/
        strongSelf->success = YES;
        strongSelf->error = err;
        NSLog(@"did sign in");
    };
    NetworkOperation *signInOp = [[NetworkOperation alloc] init:_session
                                                            url:url
                                                         method:@"POST"
                                                           body:[details dictData]
                                                     completion:completion];
    return signInOp;
}

@end
