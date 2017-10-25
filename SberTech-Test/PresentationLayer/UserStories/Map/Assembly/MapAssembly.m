//
//  MapAssembly.m
//  SberTech-Test
//
//  Created by Vladislav Prusakov on 23/10/2017.
//  Copyright © 2017 ST. All rights reserved.
//

#import "MapAssembly.h"

#import "MapViewController.h"
#import "MapInteractor.h"
#import "MapPresenter.h"
#import "MapRouter.h"

#import "MeetingsAssembly.h"
#import "MeetingsPresenter.h"

@implementation MapAssembly

- (MapViewController *)viewMap {
	return [TyphoonDefinition withClass:[MapViewController class]
												configuration:^(TyphoonDefinition *definition) {
													[definition injectProperty:@selector(output)
																								with:[self presenterMap]];
												}];
}

- (MapInteractor *)interactorMap {
	return [TyphoonDefinition withClass:[MapInteractor class]
												configuration:^(TyphoonDefinition *definition) {
													[definition injectProperty:@selector(output)
																								with:[self presenterMap]];
												}];
}

- (MapPresenter *)presenterMap {
	return [TyphoonDefinition withClass:[MapPresenter class]
												configuration:^(TyphoonDefinition *definition) {
													[definition injectProperty:@selector(view)
																								with:[self viewMap]];
													[definition injectProperty:@selector(interactor)
																								with:[self interactorMap]];
													[definition injectProperty:@selector(router)
																								with:[self routerMap]];
												}];
}

- (MapRouter *)routerMap {
	return [TyphoonDefinition withClass:[MapRouter class]
												configuration:^(TyphoonDefinition *definition) {
													[definition injectProperty:@selector(transitionHandler)
																								with:[self viewMap]];
												}];
}

@end
