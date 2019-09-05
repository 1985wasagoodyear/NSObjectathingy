//
//  SignInViewController.m
//  NSObjectathingy
//
//  Created by K Y on 9/5/19.
//  Copyright © 2019 K Y. All rights reserved.
//

#import "SignInViewController.h"

NSString *const TO_DIARY_SEGUE_ID = @"toDiary";

@interface SignInViewController ()

@property (strong, nonatomic) IBOutlet UILabel *headerLabel;
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *pwTextField;
@property (strong, nonatomic) IBOutlet UISwitch *remSwitch;
@property (strong, nonatomic) IBOutlet UILabel *remLabel;
@property (strong, nonatomic) IBOutlet UIButton *signInButton;

@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:TO_DIARY_SEGUE_ID]) {
        
    }
}

- (IBAction)signInButtonAction:(UIButton *)sender {
    [self performSegueWithIdentifier:TO_DIARY_SEGUE_ID sender:nil];
}


@end
