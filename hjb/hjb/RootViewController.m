//
//  ViewController.m
//  hjb
//
//  Created by zeno on 16/3/9.
//  Copyright © 2016年 peng. All rights reserved.
//

#import "RootViewController.h"
#import "RKTabView.h"
#import "UIView+Transition.h"
#import "LoginModel.h" 
#import "HBWebBrowserViewController.h"

@interface RootViewController ()<RKTabViewDelegate>
@property(nonatomic,strong) RKTabView * tabbar;
@property(nonatomic,strong) UIView    * currentView;
@end

@implementation RootViewController
DEF_SINGLETON(RootViewController)

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setHidden:YES];

    [[self tabbar] selectTabItemWithIndex:ROOT_TYPE_DIS];
    [self TabSelectAtIndex:0 subIndex:0];
//    self.view.layer.shouldRasterize = YES;
}


-(void)openURL:(NSString *)htmlurl//广告选择
{
    NSLog(@"%s %@",__func__,htmlurl);
    if (htmlurl && htmlurl.length) {
        NSString * url = htmlurl;
        HBWebBrowserViewController *ctr = [HBWebBrowserViewController webBrowser];
        if(![url hasPrefix:@"http://"]) url = [NSString stringWithFormat:@"http://%@",url];
        [ctr loadURLString:url];
        CGFloat offsetY = ctr.navigationbar.bottom - 20;
        CGRect frame = CGRectMake(0, offsetY, ctr.view.width, ctr.view.height - offsetY);
        if (ctr.wkWebView) {
            ctr.wkWebView.frame = frame;
        }
        else
        {
            ctr.uiWebView.frame = frame;
        }
        [self.navigationController pushViewController:ctr animated:YES];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)tabView:(RKTabView *)tabView tabBecameDisabledAtIndex:(int)index tab:(RKTabItem *)tabItem
{
    
}
-(void)tabView:(RKTabView *)tabView tabBecameEnabledAtIndex:(int)index tab:(RKTabItem *)tabItem
{
    [self TabSelectAtIndex:index subIndex:0];
}

-(void)TabSelectAtIndex:(ROOT_TYPE)index subIndex:(NSInteger)subIndex
{
    self.current_root_type = index;
    UIView * curview ;
    switch (index) {
        case ROOT_TYPE_DIS:
            curview = self.ctr1.view;
            break;
        case ROOT_TYPE_SQUARE:
            curview = self.ctr2.view;
            break;
            
        case ROOT_TYPE_MINE:
            curview = self.ctr3.view;
            break;
        default:
            break;
    }
    if (self.currentView != curview) {
        if (curview) {
            [self.currentView removeFromSuperview];
        }
        self.currentView = curview;
        [self.view addSubview:self.currentView];
        [self.view transitionFade];
        [self.view bringSubviewToFront:self.navigationbar];
        [self.view bringSubviewToFront:self.tabbar];
    }
    else
    {
        
    }
} 

-(void)rootpushViewcontroller:(UIViewController *)ctr animated:(BOOL)anmimated
{
    [self.navigationController pushViewController:ctr animated:YES];
}

-(void)rootpresentViewController:(UIViewController *)ctr animated:(BOOL)animated completion:(void (^)(void))completion
{
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:ctr];
    navigationController.navigationBarHidden = YES;
    [self presentViewController:navigationController animated:animated completion:completion];
}


#pragma mark - getter setter

-(RKTabView *)tabbar
{
    if (!_tabbar) {
        
        RKTabItem *faxian = [RKTabItem createUsualItemWithImageEnabled:[UIImage imageNamed:@"home2"] imageDisabled:[UIImage imageNamed:@"home1"]];
        faxian.titleString = @"首页";
        faxian.enableTitleFontColor = [UIColor orangeColor];
//        faxian.titleFontColor
        faxian.tabState = TabStateEnabled;
        
        RKTabItem *huodong = [RKTabItem createUsualItemWithImageEnabled:[UIImage imageNamed:@"myaccount2"] imageDisabled:[UIImage imageNamed:@"myaccount1"]];
        huodong.titleString = @"我的账户";
        huodong.enableTitleFontColor = [UIColor orangeColor];
        
       
        RKTabItem *wode = [RKTabItem createUsualItemWithImageEnabled:[UIImage imageNamed:@"transactionhistory2"] imageDisabled:[UIImage imageNamed:@"transactionhistory1"]];
        wode.titleString = @"交易记录";
        wode.enableTitleFontColor = [UIColor orangeColor];
        RKTabView *_tabViewSocial = [[RKTabView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - [RKTabView heightOfTabView], [UIScreen mainScreen].bounds.size.width, [RKTabView heightOfTabView])];
        _tabViewSocial.backgroundColor = [UIColor clearColor];
        _tabViewSocial.anomalyStyle = YES;
        
        if (_tabViewSocial) {
            _tabViewSocial.horizontalInsets = HorizontalEdgeInsetsMake(0, 0);
            _tabViewSocial.drawSeparators = NO;
            _tabViewSocial.delegate = self;
            _tabViewSocial.darkensBackgroundForEnabledTabs = NO;
            [_tabViewSocial setTabItems:@[faxian,huodong, wode]];
            _tabViewSocial.backgroundColor = [UIColor whiteColor];//PENG_COLOR_NAVIGATIONBAR;
            
            _tabViewSocial.anomalyStyle = NO;
        }
        _tabbar = _tabViewSocial;
        [self.view addSubview:_tabbar];
    }
    return _tabbar;
}


-(IBAction)gotomyaccount:(id)sender
{
    
}

-(HomeViewController *)ctr1
{
    if (!_ctr1) {
        _ctr1 = [HomeViewController new];
    }
    return _ctr1;
}

-(MyAccountViewController *)ctr2
{
    if (!_ctr2) {
        _ctr2 = [MyAccountViewController new];
    }
    return _ctr2;
}

-(TradingRecordyViewController *)ctr3
{
    if (!_ctr3) {
        _ctr3 = [TradingRecordyViewController new];
    }
    return _ctr3;
}
@end
