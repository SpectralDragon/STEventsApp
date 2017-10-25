//
//  Mapper.m
//  SberTech-Test
//
//  Created by Vladislav Prusakov on 22/10/2017.
//  Copyright © 2017 Vladislav Prusakov. All rights reserved.
//

#import "Mapper.h"

@implementation MapperImp

- (NSArray<Mappable> * _Nullable)tryCastArrayToClass:(Class)clazz withData:(NSData *)data; {
    NSError *error;
    NSArray *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    
    if (error) {
        NSLog(@"%s finish with error: %@", __PRETTY_FUNCTION__, error.localizedDescription);
        return nil;
    }    
    
    NSMutableArray *array = [NSMutableArray new];
    for (id json in jsonObject) {
        id<Mappable> object = [[clazz alloc] initWithResponseData:json];
        [array addObject:object];
    }
    
    return [array copy];
}

@end
