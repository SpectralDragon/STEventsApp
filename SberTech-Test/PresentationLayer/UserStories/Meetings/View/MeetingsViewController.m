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



#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.vizits.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Vizit *vizit = self.vizits[indexPath.row];
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@""];
    cell.textLabel.text = vizit.meeting.name;
    cell.textLabel.font = [UIFont systemFontOfSize:17 weight:UIFontWeightMedium];
    cell.detailTextLabel.text = vizit.organization.organizationName;
    return cell;
}

@end
