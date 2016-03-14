//
//  BaseViewController.m
//  PENG
//
//  Created by zeno on 15/12/14.
//  Copyright © 2015年 nonato. All rights reserved.
//

#import "BaseViewController.h"
//#import "UIView+Loading.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
//    if (self.navigationController.childViewControllers.count > 1 && self.navigationController.topViewController == self) {
//        self.showBackItem = YES;
//    }
//    if (self.isShowLoadingView) {
//        [self.view loadingView];
//    }
}

-(BOOL)isShowLoadingView
{
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    [self swizz_dealloc];
}

#pragma mark - 断开网络
-(void)FinishedLoadData
{
    [super FinishedLoadData];
//    [self.view hideloadingview];
}
 
@end
