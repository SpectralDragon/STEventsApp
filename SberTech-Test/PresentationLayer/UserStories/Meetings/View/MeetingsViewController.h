//
//  MeetingsViewController.h
//  SberTech-Test
//
//  Created by Vladislav Prusakov on 22/10/2017.
//  Copyright © 2017 ST. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MeetingsViewInput.h"

@protocol MeetingsViewOutput;

@interface MeetingsViewController : UITableViewController <MeetingsViewInput>

@property (nonatomic, strong) id<MeetingsViewOutput> output;

@end
