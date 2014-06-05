//
//  LQLAppDelegate.m
//  Table
//
//  Created by Le Quang Long on 5/7/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "LQLAppDelegate.h"

@implementation LQLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    NSArray *datasource = @[@{@"itemKey": @[@{@"itemSubKey": @[@"section 0 - row 0 - page 0"]}]},
                            @{@"itemKey": @[@{@"itemSubKey": @[@"section 1 - row 0 - page 0"]}]},
                            @{@"itemKey": @[@{@"itemSubKey": @[@"section 2 - row 0 - page 0"]}]},
                            @{@"itemKey": @[@{@"itemSubKey": @[@"section 3 - row 0 - page 0"]}]},
                            @{@"itemKey": @[@{@"itemSubKey": @[@"section 4 - row 0 - page 0"]}]},
                            @{@"itemKey": @[@{@"itemSubKey": @[@"section 5 - row 0 - page 0"]}]},
                            @{@"itemKey": @[@{@"itemSubKey": @[@"section 6 - row 0 - page 0"]}]},
                            @{@"itemKey": @[@{@"itemSubKey": @[@"section 7 - row 0 - page 0"]}]},
                            @{@"itemKey": @[@{@"itemSubKey": @[@"section 8 - row 0 - page 0"]}]},
                            @{@"itemKey": @[@{@"itemSubKey": @[@"section 9 - row 0 - page 0"]}]},
                            @{@"itemKey": @[@{@"itemSubKey": @[@"section 10 - row 0 - page 0"]}]},
                            @{@"itemKey": @[@{@"itemSubKey": @[@"section 11 - row 0 - page 0"]}]},
                            @{@"itemKey": @[@{@"itemSubKey": @[@"section 12 - row 0 - page 0"]}]},
                            @{@"itemKey": @[@{@"itemSubKey": @[@"section 13 - row 0 - page 0"]}]},
                            @{@"itemKey": @[@{@"itemSubKey": @[@"section 14 - row 0 - page 0"]}]},
                            @{@"itemKey": @[@{@"itemSubKey": @[@"section 15 - row 0 - page 0"]}]},
                            @{@"itemKey": @[@{@"itemSubKey": @[@"section 16 - row 0 - page 0"]}]},
                            @{@"itemKey": @[@{@"itemSubKey": @[@"section 17 - row 0 - page 0"]}]},
                            @{@"itemKey": @[@{@"itemSubKey": @[@"section 18 - row 0 - page 0",@"section 18 - row 0 - page 1"]},
                                             @{@"itemSubKey": @[@"section 18 - row 1 - page 0",@"section 18 - row 1 - page 1"]}]},
                            @{@"itemKey": @[@{@"itemSubKey": @[@"section 19 - row 0 - page 0",@"section 19 - row 0 - page 1"]},
                                            @{@"itemSubKey": @[@"section 19 - row 1 - page 0"]}]}];
    arrDatasource = [NSMutableArray arrayWithArray:datasource];
    LQLTableViewController *table = [[LQLTableViewController alloc] initLQLTableViewWithFrame:(CGRect){0,64,320,500} withData:datasource];
    table.dataSource = self;
    self.window.rootViewController = table;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    #define XCODE_COLORS_ESCAPE @"\033["
    
#define XCODE_COLORS_RESET_FG  XCODE_COLORS_ESCAPE @"fg;" // Clear any foreground color
#define XCODE_COLORS_RESET_BG  XCODE_COLORS_ESCAPE @"bg;" // Clear any background color
#define XCODE_COLORS_RESET     XCODE_COLORS_ESCAPE @";"
    NSLog(XCODE_COLORS_ESCAPE @"fg0,0,255;" @"Blue text" XCODE_COLORS_RESET);
    return YES;
}


- (NSInteger)numberOfSectionsInLQLTableView:(LQLTableViewController *)tableView{
    return [arrDatasource count];
}
- (LQLTableSectionView *)sectionViewInLQLTableView:(LQLTableViewController *)table inSection:(NSInteger)section{

    return [[LQLTableSectionView alloc] initSectionViewWithData:arrDatasource[section][@"itemKey"] atSection:section];
}
- (CGFloat)heightForSectionViewInLQLTableView:(LQLTableViewController *)tableView inSection:(NSInteger)section{
    return [arrDatasource[section][@"itemKey"] count]*44;
}

//- (NSInteger)numberOfRowsInLQLTableView:(LQLTableViewController *)tableView inSection:(NSInteger)section{
////    return [arrDatasource[section][@"itemKey"] count];
//    return [arrDatasource[section][@"itemKey"] count];;
//}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
