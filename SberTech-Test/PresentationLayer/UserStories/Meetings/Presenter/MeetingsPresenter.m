//
//  MeetingsPresenter.m
//  SberTech-Test
//
//  Created by Vladislav Prusakov on 22/10/2017.
//  Copyright © 2017 ST. All rights reserved.
//

#import "MeetingsPresenter.h"

#import "MeetingsViewInput.h"
#import "MeetingsInteractorInput.h"
#import "MeetingsRouterInput.h"
#import "MapModuleInput.h"

@implementation MeetingsPresenter

#pragma mark - Методы MeetingsModuleInput

- (void)configureModule {
    // Стартовая конфигурация модуля, не привязанная к состоянию view
}

#pragma mark - Методы MeetingsViewOutput

- (void)didTriggerViewReadyEvent {
    [self.interactor getMeetings];
}

- (void)didSelectVizit:(id)vizit {
	[self.moduleOutput configureWithVizit:vizit];
}

#pragma mark - Методы MeetingsInteractorOutput

- (void)didFinishDownloadWithError:(NSError *)error {
    [self.view tellUserAboutServiceError:error];
}

- (void)didFinishDownloadWithVizits:(NSArray<Vizit *> *)array {
    [self.view setupVizits:array];
    [self.moduleOutput didSendVizits:array];
}

#pragma mark - Методы MeetingsModuleOutput

- (void)didClickOnVizits:(NSArray<Vizit *> *)vizits {
	[self.view selectVizits:vizits];
}


@end
