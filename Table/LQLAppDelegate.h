//
//  LQLAppDelegate.h
//  Table
//
//  Created by Le Quang Long on 5/7/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LQLTableViewController.h"

@interface LQLAppDelegate : UIResponder <UIApplicationDelegate,LQLTableViewControllerDatasource>
{
    NSMutableArray *arrDatasource;
}
@property (strong, nonatomic) UIWindow *window;

@end
