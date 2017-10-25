//
//  MapModuleInput.h
//  SberTech-Test
//
//  Created by Vladislav Prusakov on 23/10/2017.
//  Copyright © 2017 ST. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Vizit;

@protocol MapModuleInput

- (void)configureWithVizit:(Vizit *)vizit;

- (void)didSendVizits:(NSArray<Vizit *> *)vizits;

@end
