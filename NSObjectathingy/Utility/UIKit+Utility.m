//
//  UIKit+Utility.m
//  NSObjectathingy
//
//  Created by K Y on 9/5/19.
//  Copyright © 2019 K Y. All rights reserved.
//

#import "UIKit+Utility.h"

@implementation CALayer (Utility)

- (void)roundCorners {
    self.cornerRadius = 16.0;
    self.masksToBounds = YES;
}

- (void)roundCornersWithRadius:(CGFloat)radius {
    self.cornerRadius = radius;
    self.masksToBounds = YES;
}

@end

