//
//  BCBitCoin.m
//  BitCoinGetter
//
//  Created by Duc Ho on 2/7/15.
//  Copyright (c) 2015 self. All rights reserved.
//

#import "BCBitCoin.h"

@implementation BCBitCoin

- (id)initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super init];
    if (self) {
        self.currentPrice = [dictionary[@"bpi"][@"USD"] objectForKey:@"rate"];
        self.pastPrices = nil;
    }
    return self;
}

@end
