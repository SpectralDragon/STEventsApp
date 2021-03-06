//
//  NetworkServiceAssembly.h
//  SberTech-Test
//
//  Created by Vladislav Prusakov on 22/10/2017.
//  Copyright © 2017 Vladislav Prusakov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TyphoonAssembly.h"

@protocol NetworkService;

@interface NetworkServiceAssembly : TyphoonAssembly

- (id<NetworkService>)networkService;

@end
