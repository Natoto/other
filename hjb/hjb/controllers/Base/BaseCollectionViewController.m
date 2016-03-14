//
//  BaseCollectionViewController.m
//  PENG
//
//  Created by zeno on 15/12/14.
//  Copyright © 2015年 nonato. All rights reserved.
//

#import "BaseCollectionViewController.h"
#import "HBSignalBus.h"
#import "NSObject+HBHUD.h"
#import "UINavigationController+FDFullscreenPopGesture.h"
#import "PengGifRefresh.h"
#import <MJRefresh/MJRefresh.h>

@interface BaseCollectionViewController ()
@end

@implementation BaseCollectionViewController
@synthesize noHeaderFreshView = _noHeaderFreshView;
@synthesize noFooterView = _noFooterView;

-(void)setNoHeaderFreshView:(BOOL)noHeaderFreshView
{
    _noHeaderFreshView = noHeaderFreshView;
    if (noHeaderFreshView) {
        [self.collectionView.header removeFromSuperview];
    }
    else
    {
        PengGifHeader * header = [PengGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshView)];
        // 隐藏时间
        header.lastUpdatedTimeLabel.hidden = YES;
        // 隐藏状态
        header.stateLabel.hidden = YES;
        self.collectionView.header = header;
    }
}

-(void)setNoFooterView:(BOOL)noFooterView
{
    _noFooterView = noFooterView;
    if (_noFooterView) {
        [self.collectionView.footer removeFromSuperview];
    }
    else
    {
        PengGifFooter * footer = [PengGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(getNextPageView)];
        // 隐藏时间
//        footer.lastUpdatedTimeLabel.hidden = YES;
        // 隐藏状态
        footer.stateLabel.hidden = YES;
        self.collectionView.footer = footer;
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //不自动偏移位置
    self.automaticallyAdjustsScrollViewInsets = NO;
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeAll;
    }
    self.fd_prefersNavigationBarHidden = YES;
    self.view.backgroundColor =   KT_UIColorWithRGB(239,239,239);
    ADD_HBSIGNAL_OBSERVER(self, @"networkerror", @"HTTPSEngine"); 
    if (self.navigationController.childViewControllers.count > 1 && self.navigationController.topViewController == self) {
        self.showBackItem = YES;
    }
    [self adjustContentOffSet:HEIGHT_NAVIGATIONBAR bottom:0];
    self.collectionView.backgroundColor = self.view.backgroundColor;
}
 
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



ON_HBSIGNAL(HTTPSEngine, networkerror, notify)
{
    [self FinishedLoadData];
}

-(void)dealloc
{
    NSLogMethod 
    REMOVE_HBSIGNAL_OBSERVER(self, @"networkerror",  @"HTTPSEngine")
}
@end
