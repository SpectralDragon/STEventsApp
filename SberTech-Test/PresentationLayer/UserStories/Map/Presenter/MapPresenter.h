//
//  MapPresenter.h
//  SberTech-Test
//
//  Created by Vladislav Prusakov on 23/10/2017.
//  Copyright © 2017 ST. All rights reserved.
//

#import "MapViewOutput.h"
#import "MapInteractorOutput.h"
#import "MapModuleInput.h"

@protocol MapViewInput;
@protocol MapInteractorInput;
@protocol MapRouterInput;
@protocol MeetingsModuleInput;

@interface MapPresenter : NSObject <MapModuleInput, MapViewOutput, MapInteractorOutput>

@property (nonatomic, weak) id<MapViewInput> view;
@property (nonatomic, strong) id<MapInteractorInput> interactor;
@property (nonatomic, strong) id<MapRouterInput> router;

@property (nonatomic, weak) id<MeetingsModuleInput> moduleOutput;

@end
