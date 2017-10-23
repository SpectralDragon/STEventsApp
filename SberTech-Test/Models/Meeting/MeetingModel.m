//
//  MeetingModel.m
//  SberTech-Test
//
//  Created by Vladislav Prusakov on 22/10/2017.
//  Copyright © 2017 Vladislav Prusakov. All rights reserved.
//

#import "MeetingModel.h"

@implementation MeetingModel

- (instancetype)initWithResponseData:(id)json {
    self = [super init];
    
    if (self) {
        self.organizationId = [[json objectForKey:@"organizationId"] intValue];
        self.name = [json objectForKey:@"title"];
    }
    
    return self;
}

@end
