//
//  MeetingsInteractor.h
//  SberTech-Test
//
//  Created by Vladislav Prusakov on 22/10/2017.
//  Copyright © 2017 ST. All rights reserved.
//

#import "MeetingsInteractorInput.h"

@protocol MeetingsInteractorOutput;

@interface MeetingsInteractor : NSObject <MeetingsInteractorInput>

@property (nonatomic, weak) id<MeetingsInteractorOutput> output;

@end
