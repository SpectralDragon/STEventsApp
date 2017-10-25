//
//  MapViewOutput.h
//  SberTech-Test
//
//  Created by Vladislav Prusakov on 23/10/2017.
//  Copyright © 2017 ST. All rights reserved.
//

#import <MapKit/MapKit.h>

@protocol MapViewOutput <NSObject>

- (void)didClickOnVizitByCoordinate:(CLLocationCoordinate2D)coordinate;

@end
