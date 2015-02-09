//
//  ViewController.m
//  BitCoinGetter
//
//  Created by Duc Ho on 2/7/15.
//  Copyright (c) 2015 self. All rights reserved.
//

#import "ViewController.h"
#import "BCController.h"
#import "SHLineGraphView.h"
#import "SHPlot.h"
#import "BCGraphViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *currentPriceLabel;
@property (strong, nonatomic) BCBitCoin * bit;

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
        NSLog(@"%@",listPrices);
        //test graph here
        
        self.bit = bitcoin;
        }];
    

    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showGraphDetail"]) {

        BCGraphViewController *destViewController = segue.destinationViewController;
        destViewController.dictionaryData = self.bit.pastPrices[@"bpi"];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
