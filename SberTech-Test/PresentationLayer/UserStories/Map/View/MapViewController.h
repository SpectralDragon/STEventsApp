//
//  MapViewController.h
//  SberTech-Test
//
//  Created by Vladislav Prusakov on 23/10/2017.
//  Copyright © 2017 ST. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MapViewInput.h"

@protocol MapViewOutput;

@interface MapViewController : UIViewController <MapViewInput>

@property (nonatomic, strong) id<MapViewOutput> output;

@end
