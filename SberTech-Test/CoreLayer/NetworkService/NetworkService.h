//
//  NetworkService.h
//  SberTech-Test
//
//  Created by Vladislav Prusakov on 22/10/2017.
//  Copyright © 2017 Vladislav Prusakov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Mappable;

typedef void(^STResponseComplitionBlock)(id _Nullable object, NSError * _Nullable error);


/**
 Abstract network service layer, for work with request's
 */
@protocol NetworkService

- (void)taskOnRequest:(NSURLRequest * _Nonnull)request
          costToClass:(Class _Nonnull)clazz
           completion:(STResponseComplitionBlock _Nullable)completion;

@end

@interface NetworkServiceImp : NSObject <NetworkService>

@end
