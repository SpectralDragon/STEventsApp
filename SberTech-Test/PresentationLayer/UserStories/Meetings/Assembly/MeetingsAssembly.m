//
//  MeetingsAssembly.m
//  SberTech-Test
//
//  Created by Vladislav Prusakov on 22/10/2017.
//  Copyright © 2017 ST. All rights reserved.
//

#import "MeetingsAssembly.h"

#import "MeetingsViewController.h"
#import "MeetingsInteractor.h"
#import "MeetingsPresenter.h"
#import "MeetingsRouter.h"

#import "MapAssembly.h"
#import "MapPresenter.h"

#import "NetworkServiceAssembly.h"

@implementation MeetingsAssembly

- (MeetingsViewController *)viewMeetings {
	return [TyphoonDefinition withClass:[MeetingsViewController class]
												configuration:^(TyphoonDefinition *definition) {
													[definition injectProperty:@selector(output)
																								with:[self presenterMeetings]];
												}];
}

- (MeetingsInteractor *)interactorMeetings {
	return [TyphoonDefinition withClass:[MeetingsInteractor class]
												configuration:^(TyphoonDefinition *definition) {
													[definition injectProperty:@selector(output)
																								with:[self presenterMeetings]];
													[definition injectProperty:@selector(networkService)
																								with:[self networkService]];
												}];
}

- (MeetingsPresenter *)presenterMeetings {
	return [TyphoonDefinition withClass:[MeetingsPresenter class]
												configuration:^(TyphoonDefinition *definition) {
													[definition injectProperty:@selector(view)
																								with:[self viewMeetings]];
													[definition injectProperty:@selector(interactor)
																								with:[self interactorMeetings]];
													[definition injectProperty:@selector(router)
																								with:[self routerMeetings]];
												}];
}

- (MeetingsRouter *)routerMeetings {
	return [TyphoonDefinition withClass:[MeetingsRouter class]
												configuration:^(TyphoonDefinition *definition) {
													[definition injectProperty:@selector(transitionHandler)
																								with:[self viewMeetings]];
												}];
}

- (id<NetworkService>)networkService {
	return [[[NetworkServiceAssembly assembly] activated] networkService];
}

@end
