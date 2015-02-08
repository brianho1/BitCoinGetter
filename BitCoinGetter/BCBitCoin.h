//
//  BCBitCoin.h
//  BitCoinGetter
//
//  Created by Duc Ho on 2/7/15.
//  Copyright (c) 2015 self. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BCBitCoin : NSObject

@property (nonatomic) NSString* currentPrice;
@property (nonatomic) NSDictionary* pastPrices;

- (id)initWithDictionary:(NSDictionary *)dictionary;


@end
