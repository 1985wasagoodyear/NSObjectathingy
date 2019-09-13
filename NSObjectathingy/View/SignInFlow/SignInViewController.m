//
//  SignInViewController.m
//  NSObjectathingy
//
//  Created by K Y on 9/5/19.
//  Copyright © 2019 K Y. All rights reserved.
//

#import "SignInViewController.h"
#import "NetworkingWorker.h"
#import "UIKit+Utility.h"

NSString *const TO_DIARY_SEGUE_ID = @"toDiary";

@interface SignInViewController () {
    NetworkingWorker *worker;
}

@property (strong, nonatomic) IBOutlet UILabel *headerLabel;
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *pwTextField;
@property (strong, nonatomic) IBOutlet UISwitch *remSwitch;
@property (strong, nonatomic) IBOutlet UILabel *remLabel;
@property (strong, nonatomic) IBOutlet UIButton *signInButton;

@end

@implementation SignInViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        worker = [[NetworkingWorker alloc] init];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        worker = [[NetworkingWorker alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:TO_DIARY_SEGUE_ID]) {
        UINavigationController *nav = [segue destinationViewController];
        UIViewController *signedInVC = [nav viewControllers][0];
        
    }
}

- (IBAction)signInButtonAction:(UIButton *)sender {
    UserSignIn *details = [[UserSignIn alloc] init:_nameTextField.text
                                          password:_pwTextField.text];
    __weak typeof(self) weakSelf = self;
    [worker performSignIn:details success:^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf performSegueWithIdentifier:TO_DIARY_SEGUE_ID sender:nil];
    } failure:^(NSError *err) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf showToast:[err debugDescription]];
    }];
}


@end
