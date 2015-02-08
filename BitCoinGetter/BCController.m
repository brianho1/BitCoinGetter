//
//  BCController.m
//  BitCoinGetter
//
//  Created by Duc Ho on 2/7/15.
//  Copyright (c) 2015 self. All rights reserved.
//

#import "BCController.h"
#import "BCNetworkController.h"


@implementation BCController


+ (BCController *)sharedInstance {
    static BCController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [BCController new];
    });
    return sharedInstance;

}

- (void)getCurrentPrice:(void (^)(BCBitCoin *bitcoin))getCurrentPrice {
//    NSString * startDate = @"2015-01-01";
//    NSString * endDate = @"2015-01-08";
//    NSString *data = [NSString stringWithFormat:@"select * from yahoo.finance.historicaldata where symbol in (\"YHOO\") and startDate = \"%@\" and endDate = \"%@\"",startDate, endDate];
    
    NSString * pathCurrentPrice = [NSString stringWithFormat:@"bpi/currentprice.json"];
    
    [[BCNetworkController api] GET:pathCurrentPrice parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *responseBitCoin = responseObject;
        BCBitCoin * w = [[BCBitCoin alloc] initWithDictionary:responseBitCoin];
        self.bc = w;
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        getCurrentPrice(nil);
    }];
    
    NSString * startDate = @"2015-01-01";
    NSString * endDate = @"2015-01-08";
    
    NSString * path= [NSString stringWithFormat:@"bpi/historical/close.json?start=%@&end=%@", startDate, endDate];
    
    
    [[BCNetworkController api] GET:path parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *responseBitCoin = responseObject;
        self.bc.pastPrices = responseBitCoin;
        getCurrentPrice(self.bc);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        getCurrentPrice(nil);
    }];

}

- (void)getLastWeekPrices:(void (^)(BCBitCoin *bitcoin))getLastWeekPrices {

    NSString * startDate = @"2015-01-01";
    NSString * endDate = @"2015-01-08";

    NSString * pathCurrentPrice = [NSString stringWithFormat:@"bpi/historical/close.json?start=%@&end=%@", startDate, endDate];
    
    
    [[BCNetworkController api] GET:pathCurrentPrice parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *responseBitCoin = responseObject;
        self.bc.pastPrices = [NSDictionary new];
        self.bc.pastPrices = responseBitCoin;
        getLastWeekPrices(self.bc);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        getLastWeekPrices(nil);
    }];

}


@end
