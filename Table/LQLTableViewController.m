//
//  LQLTableViewController.m
//  Table
//
//  Created by Le Quang Long on 5/7/14.
//  Copyright (c) 2014 Le Quang Long. All rights reserved.
//

#import "LQLTableViewController.h"

@interface LQLTableViewController () <LQLTableSectionViewDelegate>
{
	NSInteger numberSection;
	NSArray *arrDatasource;
	NSIndexPath *indexPathh;
}
@end

@implementation LQLTableViewController

- (id)initWithStyle:(UITableViewStyle)style {
	self = [super initWithStyle:style];
	if (self) {
		// Custom initialization
        //TODO: ABC
        
	}
	return self;
}
//FIXME:
- (id)initLQLTableViewWithFrame:(CGRect)frame withData:(id)data {
	self = [super initWithStyle:UITableViewStylePlain];
	if (self) {
        //test github
		// Custom initialization
		arrDatasource = data;
		self.sectionProgress = eSECTION_COLLAPSE;
		[self.tableView registerNib:[UINib nibWithNibName:@"LQLCell"
                                                   bundle:nil]
             forCellReuseIdentifier:@"DefaultCellID"];
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {    // Return the number of sections.
	numberSection = [self.dataSource numberOfSectionsInLQLTableView:self];
	return numberSection;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
	LQLTableSectionView *sectionView = [self.dataSource sectionViewInLQLTableView:self inSection:section];
	sectionView.sectionDelegate = self;
	return (UIView *)sectionView;
}

- (CGFloat)heightSectionInExpandMode:(LQLTableSectionView *)sectionView inSection:(NSInteger)section {
	self.sectionProgress = eSECTION_EXPAND;
	return [arrDatasource[section][@"itemKey"] count] * 44;
}

- (void)willExpandCell:(LQLTableSectionView *)sectionView inSection:(NSInteger)section {
	NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:section];
	[self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	// Return the number of rows in the section.
	if (self.sectionProgress == eSECTION_COLLAPSE) {
		return 0;
	}
	return [arrDatasource[section][@"itemKey"] count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	return [self.dataSource heightForSectionViewInLQLTableView:self inSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *cellID = @"DefaultCellID";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
	}
	// Configure the cell...

	cell.textLabel.text = arrDatasource[indexPath.section][@"itemKey"][indexPath.row][@"itemSubKey"][0];
	return cell;
}

/*
   // Override to support conditional editing of the table view.
   - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
   {
    // Return NO if you do not want the specified item to be editable.
    return YES;
   }
 */

/*
   // Override to support editing the table view.
   - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
   {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
   }
 */

/*
   // Override to support rearranging the table view.
   - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
   {
   }
 */

/*
   // Override to support conditional rearranging of the table view.
   - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
   {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
   }
 */

/*
   #pragma mark - Navigation

   // In a storyboard-based application, you will often want to do a little preparation before navigation
   - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
   {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
   }
 */

@end
