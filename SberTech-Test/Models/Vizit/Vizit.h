//
//  Vizit.h
//  SberTech-Test
//
//  Created by Vladislav Prusakov on 22/10/2017.
//  Copyright © 2017 Vladislav Prusakov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MeetingModel.h"
#import "OrganizationModel.h"

@interface Vizit : NSObject

@property (nonatomic, strong) MeetingModel *meeting;
@property (nonatomic, strong) OrganizationModel *organization;

@end
