//
//  Vizit.m
//  SberTech-Test
//
//  Created by Vladislav Prusakov on 22/10/2017.
//  Copyright © 2017 Vladislav Prusakov. All rights reserved.
//

#import "Vizit.h"

@implementation Vizit

- (NSString *)description {
	return [NSString stringWithFormat:@"%@ { meetgins: %@\n organization: %@\n}", self, self.meeting, self.organization];
}

@end
