//
//  LQLTableViewController.h
//  Table
//
//  Created by Le Quang Long on 5/7/14.
//  Copyright (c) 2014 Le Quang Long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LQLTableSectionView.h"

#define kDefaultNumberOfPagesOnEachRow 1


@class LQLTableViewController;

@protocol LQLTableViewControllerDatasource <NSObject>

@required
- (NSInteger)numberOfSectionsInLQLTableView:(LQLTableViewController *)tableView;
//- (NSInteger)numberOfRowsInLQLTableView:(LQLTableViewController *)tableView inSection:(NSInteger)section;

@optional
//FIXME: - (LQLTableSectionView *)sectionViewInLQLTableView:(LQLTableViewController *)table inSection:(NSInteger)section;

@end

@interface LQLTableViewController : UITableViewController
@property (nonatomic,assign) UITableViewStyle styleLQLTableView;
@property (nonatomic,assign) id<LQLTableViewControllerDatasource> dataSource;
@property (nonatomic,assign) SECTION_IN_PROGRESS sectionProgress;
- (id)initLQLTableViewWithFrame:(CGRect)frame withData:(id)data;
@end
