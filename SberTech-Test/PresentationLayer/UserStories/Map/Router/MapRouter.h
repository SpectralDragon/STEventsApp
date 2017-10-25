//
//  MapRouter.h
//  SberTech-Test
//
//  Created by Vladislav Prusakov on 23/10/2017.
//  Copyright © 2017 ST. All rights reserved.
//

#import "MapRouterInput.h"

@protocol RamblerViperModuleTransitionHandlerProtocol;

@interface MapRouter : NSObject <MapRouterInput>

@property (nonatomic, weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

@end
