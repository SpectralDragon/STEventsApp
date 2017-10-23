//
//  MeetingsInteractor.m
//  SberTech-Test
//
//  Created by Vladislav Prusakov on 22/10/2017.
//  Copyright © 2017 ST. All rights reserved.
//

#import "MeetingsInteractor.h"
#import "MeetingsInteractorOutput.h"

#import "NetworkService.h"
#import "URLRequestPath.h"
#import "MeetingModel.h"
#import "OrganizationModel.h"
#import "Vizit.h"

@interface MeetingsInteractor ()

@property (nonatomic, strong) id<NetworkService> networkService;

@end

@implementation MeetingsInteractor

#pragma mark - Методы MeetingsInteractorInput

- (void)getMeetings {
    
    __weak typeof(self) weakSelf = self;
    [self.networkService taskOnRequest:[URLRequestPath meetingsRequest]
                           costToClass:[MeetingModel class]
                            completion:^(NSArray<MeetingModel *> * _Nullable meetings, NSError * _Nullable error) {
                                
                                if (error) {
                                    [weakSelf didFinishDownloadWithError:error];
                                    return;
                                }
                                
                                [weakSelf.networkService taskOnRequest:[URLRequestPath meetingsRequest]
                                                           costToClass:[OrganizationModel class]
                                                            completion:^(NSArray<OrganizationModel *> * _Nullable objects, NSError * _Nullable error) {
                                                                
                                                                if (error) {
                                                                    [weakSelf didFinishDownloadWithError:error];
                                                                    return;
                                                                }
                                                                
                                                                NSMutableArray *array = [NSMutableArray new];
                                                                for (MeetingModel *meeting in meetings) {
                                                                    for (OrganizationModel *org in objects) {
                                                                        if (meeting.organizationId == org.organizationId) {
                                                                            Vizit *vizit = [Vizit new];
                                                                            vizit.meeting = meeting;
                                                                            vizit.organization = org;
                                                                            
                                                                            
                                                                            [array addObject:vizit];
                                                                        }
                                                                    }
                                                                }
                                                                [weakSelf didFinishDownloadWithVizit:array];
                                                            }];
                            }];
}

#pragma mark - Private methods

- (void)didFinishDownloadWithError:(NSError *)error {
    __weak typeof(self) weakSelf = self;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if ([weakSelf.output respondsToSelector:@selector(didFinishDownloadWithError:)]) {
            [weakSelf.output didFinishDownloadWithError:error];
        }
    });
}

- (void)didFinishDownloadWithVizit:(NSArray<Vizit *> *)array {
    __weak typeof(self) weakSelf = self;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if ([weakSelf.output respondsToSelector:@selector(didFinishDownloadWithVizits:)]) {
            [weakSelf.output didFinishDownloadWithVizits:array];
        }
    });
}

@end
