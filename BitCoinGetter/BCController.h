//
//  BCController.h
//  BitCoinGetter
//
//  Created by Duc Ho on 2/7/15.
//  Copyright (c) 2015 self. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BCBitCoin.h"


@interface BCController : NSObject

@property (strong, nonatomic) BCBitCoin *bc;

+ (BCController *)sharedInstance;

- (void)getCurrentPrice:(void (^)(BCBitCoin *bitcoin))getCurrentPrice;

- (void)getLastWeekPrices:(void (^)(BCBitCoin *bitcoin))getLastWeekPrices;


@end
