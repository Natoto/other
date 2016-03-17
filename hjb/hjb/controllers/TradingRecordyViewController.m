//
//  TradingRecordyViewController.m
//  hjb
//
//  Created by zeno on 16/3/15.
//  Copyright © 2016年 peng. All rights reserved.
//

#import "TradingRecordyViewController.h"

@interface TradingRecordyViewController ()

@end

@implementation TradingRecordyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"交易记录";
    
    [self loadplistConfig:@"TradingRecordyViewController"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
