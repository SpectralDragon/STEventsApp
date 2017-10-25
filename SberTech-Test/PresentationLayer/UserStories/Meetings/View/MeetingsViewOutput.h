//
//  MeetingsViewOutput.h
//  SberTech-Test
//
//  Created by Vladislav Prusakov on 22/10/2017.
//  Copyright © 2017 ST. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Vizit;
@protocol MeetingsViewOutput <NSObject>

/**
 @author Vladislav Prusakov

 Метод сообщает презентеру о том, что view готова к работе
 */
- (void)didTriggerViewReadyEvent;

- (void)didSelectVizit:(Vizit *)vizit;

@end
