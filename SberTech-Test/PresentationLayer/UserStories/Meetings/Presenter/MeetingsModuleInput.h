//
//  MeetingsModuleInput.h
//  SberTech-Test
//
//  Created by Vladislav Prusakov on 22/10/2017.
//  Copyright © 2017 ST. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Vizit;

@protocol MeetingsModuleInput

- (void)didClickOnVizits:(NSArray<Vizit *> *)vizits;

@end
