//
//  MeetingModel.h
//  SberTech-Test
//
//  Created by Vladislav Prusakov on 22/10/2017.
//  Copyright © 2017 Vladislav Prusakov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mapper.h"

@interface MeetingModel : NSObject <Mappable>

@property (nonatomic, assign) UInt16 organizationId;

@property (nonatomic, strong) NSString *name;

@end
