//
//  MeetingsViewInput.h
//  SberTech-Test
//
//  Created by Vladislav Prusakov on 22/10/2017.
//  Copyright © 2017 ST. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Vizit;

@protocol MeetingsViewInput <NSObject>

- (void)setupVizits:(NSArray<Vizit *> *)array;

- (void)tellUserAboutServiceError:(NSError *)error;

- (void)selectVizits:(NSArray<Vizit *> *)vizits;

@end
