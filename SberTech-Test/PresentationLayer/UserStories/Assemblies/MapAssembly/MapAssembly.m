//
//  MapAssembly.m
//  SberTech-Test
//
//  Created by Vladislav Prusakov on 22/10/2017.
//  Copyright © 2017 Vladislav Prusakov. All rights reserved.
//

#import "MapAssembly.h"
#import "MapViewModel.h"
#import "MapViewController.h"

@implementation MapAssembly

- (MapViewController *)mapViewController {
    return [TyphoonDefinition withClass:[MapViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(viewModel) with:[self mapViewModel]];
    }];
}

- (MapViewModel *)mapViewModel {
    return [TyphoonDefinition withClass:[MapViewModel class]];
}

@end
