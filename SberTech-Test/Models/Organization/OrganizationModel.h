//
//  OrganizationModel.h
//  SberTech-Test
//
//  Created by Vladislav Prusakov on 22/10/2017.
//  Copyright © 2017 Vladislav Prusakov. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "Mapper.h"

@interface OrganizationModel : NSObject <Mappable>

@property (nonatomic, assign) UInt16 organizationId;

@property (nonatomic, strong) NSString *organizationName;

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

@end
