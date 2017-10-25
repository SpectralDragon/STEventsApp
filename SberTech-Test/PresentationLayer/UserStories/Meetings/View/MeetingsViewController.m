//
//  MeetingsViewController.m
//  SberTech-Test
//
//  Created by Vladislav Prusakov on 22/10/2017.
//  Copyright © 2017 ST. All rights reserved.
//

#import "MeetingsViewController.h"
#import "MeetingsViewOutput.h"
#import "Vizit.h"

@interface MeetingsViewController ()

@property (nonatomic, strong) NSArray *vizits;

@end

@implementation MeetingsViewController

#pragma mark - Методы жизненного цикла

- (void)viewDidLoad {
	[super viewDidLoad];
	
	[self.output didTriggerViewReadyEvent];
	self.title = @"Встречи";
	self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

#pragma mark - Методы MeetingsViewInput


- (void)setupVizits:(NSArray<Vizit *> *)array {
	self.vizits = array;
	[self.tableView reloadData];
}

- (void)tellUserAboutServiceError:(NSError *)error {
	NSString *message = [NSString stringWithFormat:@"Something went wrong with error: %@", error.localizedDescription];
	UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"Error!"
																																			message:message
																															 preferredStyle:UIAlertControllerStyleAlert];
	[controller addAction:[UIAlertAction actionWithTitle:@"Close" style:UIAlertActionStyleCancel handler:nil]];
	[self presentViewController:controller animated:YES completion:nil];
}

- (void)selectVizits:(NSArray<Vizit *> *)vizits {
	NSMutableArray<NSIndexPath *>* indexPaths = [NSMutableArray new];
	for (Vizit *vizit in vizits) {
		NSUInteger index = [self.vizits indexOfObject:vizit];
		NSIndexPath *path = [NSIndexPath indexPathForRow:index inSection:0];
		[indexPaths addObject:path];
	}
	
	for (NSIndexPath *indexPath in indexPaths) {
		UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
		cell.contentView.backgroundColor = [UIColor greenColor];
		cell.textLabel.textColor = [UIColor whiteColor];
		cell.detailTextLabel.textColor = [UIColor whiteColor];
	}
}

- (void)deselectAllCell:(UITableView *)tableView {
	for (NSUInteger index = 0; index < self.vizits.count; index++) {
		NSIndexPath *path = [NSIndexPath indexPathForRow:index inSection:0];
		UITableViewCell *cell = [tableView cellForRowAtIndexPath:path];
		cell.contentView.backgroundColor = [UIColor whiteColor];
		cell.textLabel.textColor = [UIColor blackColor];
		cell.detailTextLabel.textColor = [UIColor blackColor];
	}
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
	cell.contentView.backgroundColor = [UIColor greenColor];
	cell.textLabel.textColor = [UIColor whiteColor];
	cell.detailTextLabel.textColor = [UIColor whiteColor];
	
	Vizit *vizit = self.vizits[indexPath.row];
	[self.output didSelectVizit:vizit];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
	[self deselectAllCell:tableView];
	
	UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
	cell.contentView.backgroundColor = [UIColor whiteColor];
	cell.textLabel.textColor = [UIColor blackColor];
	cell.detailTextLabel.textColor = [UIColor blackColor];
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 80.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return UITableViewAutomaticDimension;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.vizits.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	Vizit *vizit = self.vizits[indexPath.row];
	
	UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@""];
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	cell.textLabel.text = vizit.meeting.name;
	cell.textLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightMedium];
	cell.detailTextLabel.font = [UIFont systemFontOfSize:17 weight:UIFontWeightRegular];
	cell.detailTextLabel.text = vizit.organization.organizationName;
	return cell;
}

@end
