//
//  CatHeaderTableViewCell.h
//  NSObjectathingy
//
//  Created by K Y on 9/5/19.
//  Copyright © 2019 K Y. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CatHeaderTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *catImageView;
@property (strong, nonatomic) IBOutlet UIButton *catNameButton;

@end

NS_ASSUME_NONNULL_END
