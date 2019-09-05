//
//  CatDiaryViewController.m
//  NSObjectathingy
//
//  Created by K Y on 9/5/19.
//  Copyright © 2019 K Y. All rights reserved.
//

#import "CatDiaryViewController.h"
#import "CatHeaderTableViewCell.h"

typedef enum CatDiarySection : NSUInteger {
    kHeader,
    kDiaryEntries
} CatDiarySection;

const int CAT_DIARY_SECTION_COUNT = 2;
NSString *const DIARY_CELL_ID = @"CatDiaryCell";

@interface CatDiaryViewController ()

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) UITableViewCell *headerCell;

@end

@interface CatDiaryViewController (UITableView) <UITableViewDataSource, UITableViewDelegate>

- (UITableViewCell *)diaryCellForIndexPath:(NSIndexPath *)indexPath;

@end

@implementation CatDiaryViewController

- (void)loadView {
    [super loadView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.estimatedRowHeight = 200.0;
    NSArray *items = [[NSBundle mainBundle] loadNibNamed:@"CatHeaderTableViewCell"
                                                   owner:self
                                                 options:nil];
    _headerCell = items[0];
    [_tableView registerClass:[UITableViewCell class]
       forCellReuseIdentifier:DIARY_CELL_ID];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

@implementation CatDiaryViewController (UITableView)

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return CAT_DIARY_SECTION_COUNT;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case kHeader:
            return _headerCell;
        default:
            return [self diaryCellForIndexPath:indexPath];
    }
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case kHeader:
            return 1;
        default:
            return 10;
    }
}

- (UITableViewCell *)diaryCellForIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:DIARY_CELL_ID
                                                             forIndexPath:indexPath];
    cell.textLabel.text = @"hi";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

@end
