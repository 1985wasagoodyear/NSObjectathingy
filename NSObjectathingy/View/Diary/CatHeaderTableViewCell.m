//
//  CatHeaderTableViewCell.m
//  NSObjectathingy
//
//  Created by K Y on 9/5/19.
//  Copyright © 2019 K Y. All rights reserved.
//

#import "CatHeaderTableViewCell.h"
#import "UIKit+Utility.h"

@implementation CatHeaderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [_catImageView.layer roundCorners];
    [_catNameButton.layer roundCorners];
}

- (IBAction)catNameButtonAction:(UIButton *)sender {
    printf("mreow");
}

@end
