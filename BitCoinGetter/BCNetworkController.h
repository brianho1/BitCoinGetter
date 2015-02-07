//
//  BCNetworkController.h
//  BitCoinGetter
//
//  Created by Duc Ho on 2/7/15.
//  Copyright (c) 2015 self. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface BCNetworkController : NSObject
+ (AFHTTPSessionManager *)api;

@end
