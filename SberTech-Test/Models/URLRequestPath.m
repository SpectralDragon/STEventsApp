//
//  URLRequestPath.m
//  SberTech-Test
//
//  Created by Vladislav Prusakov on 22/10/2017.
//  Copyright © 2017 Vladislav Prusakov. All rights reserved.
//

#import "URLRequestPath.h"

@implementation URLRequestPath

#pragma mark - Const

static NSString *const GET_VISIT_LIST = @"getVisitsListTest";
static NSString *const GET_ORGANIZATION_LIST = @"getOrganizationListTest";

+ (NSURL *)baseURL {
    return [NSURL URLWithString:@"http://demo3526062.mockable.io/"];
}

#pragma mark - Public methods

+ (NSURLRequest *)meetingsRequest {
    NSURL *meetingsURL = [[self baseURL] URLByAppendingPathComponent:GET_VISIT_LIST];
    return [[NSURLRequest alloc] initWithURL: meetingsURL];
}

+ (NSURLRequest *)organizationRequest {
    NSURL *organizationURL = [[self baseURL] URLByAppendingPathComponent:GET_ORGANIZATION_LIST];
    return [[NSURLRequest alloc] initWithURL:organizationURL];
}

@end
