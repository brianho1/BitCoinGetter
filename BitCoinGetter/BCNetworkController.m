//
//  BCNetworkController.m
//  BitCoinGetter
//
//  Created by Duc Ho on 2/7/15.
//  Copyright (c) 2015 self. All rights reserved.
//
#import "BCNetworkController.h"
#import "JSONSerializer.h"

@implementation BCNetworkController

+ (AFHTTPSessionManager *)api {
    
    static AFHTTPSessionManager *api = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        api = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://api.coindesk.com/v1"]];
        api.responseSerializer = [JSONSerializer serializer];
        
    });
    return api;
}

@end

