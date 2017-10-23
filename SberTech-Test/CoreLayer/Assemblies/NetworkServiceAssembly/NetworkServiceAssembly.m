//
//  NetworkServiceAssembly.m
//  SberTech-Test
//
//  Created by Vladislav Prusakov on 22/10/2017.
//  Copyright © 2017 Vladislav Prusakov. All rights reserved.
//

#import "NetworkServiceAssembly.h"
#import "NetworkService.h"
#import "Mapper.h"

@implementation NetworkServiceAssembly

- (id<NetworkService>)networkService {
    return [TyphoonDefinition withClass:[NetworkServiceImp class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(mapper) with:[self mapper]];
    }];
}

- (id<MapperService>)mapper {
    return [TyphoonDefinition withClass:[MapperImp class]];
}

@end
