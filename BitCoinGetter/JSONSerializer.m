//
//  JSONSerializer.m
//  BitCoinGetter
//
//  Created by Duc Ho on 2/7/15.
//  Copyright (c) 2015 self. All rights reserved.
//

#import "JSONSerializer.h"

@implementation JSONSerializer

-(NSSet *)acceptableContentTypes {
    return [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/plain", @"application/javascript", nil];
}


@end
