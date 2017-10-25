//
//  MapPresenter.m
//  SberTech-Test
//
//  Created by Vladislav Prusakov on 23/10/2017.
//  Copyright © 2017 ST. All rights reserved.
//

#import <MapKit/MapKit.h>

#import "MapPresenter.h"
#import "MapViewInput.h"
#import "MapInteractorInput.h"
#import "MapRouterInput.h"
#import "Vizit.h"
#import "MeetingsModuleInput.h"

@interface MapPresenter()

@property (nonatomic, strong) NSArray<Vizit *> *vizits;

@end

@implementation MapPresenter

#pragma mark - Методы MapModuleInput

- (void)configureModule {
	// Стартовая конфигурация модуля, не привязанная к состоянию view
}

#pragma mark - Методы MapViewOutput
- (void)didClickOnVizitByCoordinate:(CLLocationCoordinate2D)coordinate {
	NSMutableArray *vizitsByPoint = [NSMutableArray new];
	for (Vizit *vizit in self.vizits) {
		CLLocationCoordinate2D pointCoord = vizit.organization.coordinate;
		if (pointCoord.latitude == coordinate.latitude &&
				coordinate.longitude == pointCoord.longitude) {
			[vizitsByPoint addObject:vizit];
		}
	}
	[self.moduleOutput didClickOnVizits:vizitsByPoint];
}

#pragma mark - Методы MapInteractorOutput

- (void)didSendVizits:(NSArray<Vizit *> *)vizits {
	
	self.vizits = vizits;
	
	NSMutableArray *annotations = [NSMutableArray new];
	
	for (Vizit *vizit in vizits) {
		MKPointAnnotation *point = [MKPointAnnotation new];
		point.coordinate = vizit.organization.coordinate;
		[annotations addObject:point];
	}
	[self.view setupInitialStateWithMKPoints:annotations];
}

- (void)configureWithVizit:(Vizit *)vizit {
	[self.view setupCameraWithCoordinate:vizit.organization.coordinate];
}


@end
