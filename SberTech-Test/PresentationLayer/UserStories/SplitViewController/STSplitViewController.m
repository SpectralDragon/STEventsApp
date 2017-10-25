//
//  STSplitViewController.m
//  SberTech-Test
//
//  Created by Vladislav Prusakov on 25/10/2017.
//  Copyright © 2017 Vladislav Prusakov. All rights reserved.
//

#import "STSplitViewController.h"
#import "MeetingsViewController.h"
#import "MapViewController.h"
#import "MapPresenter.h"
#import "MeetingsPresenter.h"

@interface STSplitViewController ()

@end

@implementation STSplitViewController



- (void)viewDidLoad {
	[super viewDidLoad];
	
	UINavigationController *navCont = [self.viewControllers firstObject];
	MeetingsViewController *meetingsVC = [navCont.viewControllers firstObject];
	
	MapViewController *mapController = (MapViewController *)[self.viewControllers lastObject];
	
	MapPresenter* mapPresenter = (MapPresenter *)mapController.output;
	MeetingsPresenter *meetingPresenter = (MeetingsPresenter *)meetingsVC.output;
	mapPresenter.moduleOutput = meetingPresenter;
	meetingPresenter.moduleOutput = mapPresenter;
}




@end
