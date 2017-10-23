//
//  MapMapViewController.m
//  SberTech-Test
//
//  Created by Vladislav Prusakov on 22/10/2017.
//  Copyright 2017 ST. All rights reserved.
//

#import "MapViewController.h"
#import "MapViewModel.h"
#import <MapKit/MapKit.h>

@interface MapViewController () <MKMapViewDelegate>

@property (nonatomic, strong) MapViewModel *viewModel;

@property (nonatomic, weak) IBOutlet MKMapView *mapView;

@end

@implementation MapViewController

#pragma mark - View lifecycle

- (void)viewDidLoad {
	[super viewDidLoad];

	[self bindUI];
	[self setupUI];
}

#pragma mark - Bind UI

- (void)bindUI {
    self.mapView.delegate = self;
    
    MKPointAnnotation *annotation = [MKPointAnnotation new];
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(55.836226, 37.483064);
    [annotation setCoordinate:coordinate];
    
    [self.mapView addAnnotation:annotation];
}

#pragma mark - Setup UI

- (void)setupUI {
    
}

#pragma mark - MKMapViewDelegate

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    
}

@end
