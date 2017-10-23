//
//  NetworkService.m
//  SberTech-Test
//
//  Created by Vladislav Prusakov on 22/10/2017.
//  Copyright © 2017 Vladislav Prusakov. All rights reserved.
//

#import "NetworkService.h"
#import "Mapper.h"

@interface NetworkServiceImp()

@property (nonatomic, strong) id<MapperService> mapper;

@end

@implementation NetworkServiceImp

- (void)taskOnRequest:(NSURLRequest *)request costToClass:(Class)clazz completion:(STResponseComplitionBlock)completion {
    
    __weak typeof(self) weakSelf = self;
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request
                                     completionHandler:^(NSData * _Nullable data,
                                                         NSURLResponse * _Nullable response,
                                                         NSError * _Nullable error) {
                                         
                                         // did catch error
                                         if (error) {
                                             if (completion) {
                                                 completion(nil, error);
                                             }
                                             
                                             return;
                                         }
                                         
                                         // did finish success
                                         if (completion) {
                                             id objects = [weakSelf.mapper tryCastArrayToClass:clazz
                                                                                      withData:data];
                                             completion(objects, nil);
                                         }
                                         
                                     }] resume];
}

@end
