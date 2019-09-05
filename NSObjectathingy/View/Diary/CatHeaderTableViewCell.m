//
//  CatHeaderTableViewCell.m
//  NSObjectathingy
//
//  Created by K Y on 9/5/19.
//  Copyright © 2019 K Y. All rights reserved.
//

#import "CatHeaderTableViewCell.h"

@implementation CatHeaderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)catNameButtonAction:(UIButton *)sender {
    printf("mreow");
}

@end
