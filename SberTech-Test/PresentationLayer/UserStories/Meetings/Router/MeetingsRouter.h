//
//  MeetingsRouter.h
//  SberTech-Test
//
//  Created by Vladislav Prusakov on 22/10/2017.
//  Copyright © 2017 ST. All rights reserved.
//

#import "MeetingsRouterInput.h"

@protocol RamblerViperModuleTransitionHandlerProtocol;

@interface MeetingsRouter : NSObject <MeetingsRouterInput>

@property (nonatomic, weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

@end
