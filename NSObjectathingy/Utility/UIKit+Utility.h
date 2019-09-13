//
//  UIKit+Utility.h
//  NSObjectathingy
//
//  Created by K Y on 9/5/19.
//  Copyright © 2019 K Y. All rights reserved.
//

#ifndef UIKit_Utility_h
#define UIKit_Utility_h

#import <UIKit/UIKit.h>

@interface CALayer (Utility)

- (void)roundCorners;
- (void)roundCornersWithRadius:(CGFloat)radius;

@end

@interface UIViewController (Utility)

- (void)showToast:(NSString *)message;

@end

#endif /* UIKit_Utility_h */
