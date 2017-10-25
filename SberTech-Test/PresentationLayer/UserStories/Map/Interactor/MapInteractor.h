//
//  MapInteractor.h
//  SberTech-Test
//
//  Created by Vladislav Prusakov on 23/10/2017.
//  Copyright © 2017 ST. All rights reserved.
//

#import "MapInteractorInput.h"

@protocol MapInteractorOutput;

@interface MapInteractor : NSObject <MapInteractorInput>

@property (nonatomic, weak) id<MapInteractorOutput> output;

@end
