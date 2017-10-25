//
//  MeetingsPresenter.h
//  SberTech-Test
//
//  Created by Vladislav Prusakov on 22/10/2017.
//  Copyright © 2017 ST. All rights reserved.
//

#import "MeetingsViewOutput.h"
#import "MeetingsInteractorOutput.h"
#import "MeetingsModuleInput.h"

@protocol MeetingsViewInput;
@protocol MeetingsInteractorInput;
@protocol MeetingsRouterInput;
@protocol MapModuleInput;

@interface MeetingsPresenter : NSObject <MeetingsModuleInput, MeetingsViewOutput, MeetingsInteractorOutput>

@property (nonatomic, weak) id<MeetingsViewInput> view;
@property (nonatomic, strong) id<MeetingsInteractorInput> interactor;
@property (nonatomic, strong) id<MeetingsRouterInput> router;

@property (nonatomic, weak) id<MapModuleInput> moduleOutput;

@end
