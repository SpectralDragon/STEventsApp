//
//  MapViewInput.h
//  SberTech-Test
//
//  Created by Vladislav Prusakov on 23/10/2017.
//  Copyright © 2017 ST. All rights reserved.
//

#import <MapKit/MapKit.h>

@protocol MapViewInput <NSObject>

/**
 @author Vladislav Prusakov

 Метод настраивает начальный стейт view
 */
- (void)setupInitialStateWithMKPoints:(NSArray<id<MKAnnotation>> *)annotations;

- (void)setupCameraWithCoordinate:(CLLocationCoordinate2D)coordinate;

@end
