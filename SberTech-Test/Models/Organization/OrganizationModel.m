//
//  OrganizationModel.m
//  SberTech-Test
//
//  Created by Vladislav Prusakov on 22/10/2017.
//  Copyright © 2017 Vladislav Prusakov. All rights reserved.
//

#import "OrganizationModel.h"

@implementation OrganizationModel

- (instancetype)initWithResponseData:(id)json {
    self = [super init];
    
    if (self) {
        self.organizationId = [[json objectForKey:@"organizationId"] intValue];
        self.organizationName = [json objectForKey:@"title"];
        
        CLLocationDegrees latitude = [[json objectForKey:@"latitude"] doubleValue];
        CLLocationDegrees longitude = [[json objectForKey:@"longitude"] doubleValue];
        self.coordinate = CLLocationCoordinate2DMake(latitude, longitude);
    }
    
    return self;
}

@end
