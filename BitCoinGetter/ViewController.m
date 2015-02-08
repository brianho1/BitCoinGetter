//
//  ViewController.m
//  BitCoinGetter
//
//  Created by Duc Ho on 2/7/15.
//  Copyright (c) 2015 self. All rights reserved.
//

#import "ViewController.h"
#import "BCController.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *currentPriceLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[BCController sharedInstance] getCurrentPrice:^(BCBitCoin *bitcoin) {
        NSLog(@"%@",bitcoin.currentPrice);
        self.currentPriceLabel.text = bitcoin.currentPrice;
        NSLog(@"%@",bitcoin.pastPrices);
        NSDictionary *listPrices = bitcoin.pastPrices[@"bpi"];
        NSLog(@"%@", listPrices);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
