//
//  Mapper.h
//  SberTech-Test
//
//  Created by Vladislav Prusakov on 22/10/2017.
//  Copyright © 2017 Vladislav Prusakov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Mappable <NSObject>

- (instancetype _Nullable)initWithResponseData:(id _Nullable)json;

@end

@protocol MapperService

- (NSArray<Mappable> * _Nullable)tryCastArrayToClass:(Class)clazz withData:(NSData *)data;

@end

@interface MapperImp : NSObject <MapperService>

@end
