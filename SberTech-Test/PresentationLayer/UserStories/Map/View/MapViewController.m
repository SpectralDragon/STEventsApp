//
//  MapViewController.m
//  SberTech-Test
//
//  Created by Vladislav Prusakov on 23/10/2017.
//  Copyright © 2017 ST. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>

#import "MapViewOutput.h"

@interface MapViewController () <MKMapViewDelegate>

@property (nonatomic, weak) IBOutlet MKMapView *mapView;

@end

@implementation MapViewController

#pragma mark - Методы жизненного цикла

- (void)viewDidLoad {
	[super viewDidLoad];
	self.mapView.delegate = self;
}

#pragma mark - Методы MapViewInput

- (void)setupInitialStateWithMKPoints:(NSArray<id<MKAnnotation>> *)annotations {
	[self.mapView addAnnotations:annotations];
}

- (void)setupCameraWithCoordinate:(CLLocationCoordinate2D)coordinate {
	MKMapCamera *camera = [MKMapCamera cameraLookingAtCenterCoordinate:coordinate fromDistance:2500 pitch:0 heading:0];
	
	[self.mapView setCamera:camera animated:YES];
}

#pragma mark - MKMapViewDelegate

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
	[self.output didClickOnVizitByCoordinate:view.annotation.coordinate];
}

@end
