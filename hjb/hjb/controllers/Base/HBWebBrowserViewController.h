//
//  HBWebbrowser.h
//  hjb
//
//  Created by zeno on 16/3/14.
//  Copyright © 2016年 peng. All rights reserved.
//

#import "BaseViewController.h"
#import <WebKit/WebKit.h>
@class HBWebBrowserViewController;
@protocol HBWebBrowserDelegate <NSObject>
@optional
- (void)webBrowser:(HBWebBrowserViewController *)webBrowser didStartLoadingURL:(NSURL *)URL;
- (void)webBrowser:(HBWebBrowserViewController *)webBrowser didFinishLoadingURL:(NSURL *)URL;
- (void)webBrowser:(HBWebBrowserViewController *)webBrowser didFailToLoadURL:(NSURL *)URL error:(NSError *)error;
- (void)webBrowserViewControllerWillDismiss:(HBWebBrowserViewController*)viewController;
@end



@interface HBWebBrowserViewController : BaseViewController

#pragma mark - Public Properties

@property (nonatomic, weak) id <HBWebBrowserDelegate> delegate;

// The web views
// Depending on the version of iOS, one of these will be set
@property (nonatomic, strong) WKWebView *wkWebView;
@property (nonatomic, strong) UIWebView *uiWebView;

// The main and only UIProgressView
@property (nonatomic, strong) UIProgressView *progressView;

- (void)loadURL:(NSURL *)URL;
- (void)loadURLString:(NSString *)URLString;

+ (HBWebBrowserViewController *)locoalwebBrowser;
+ (HBWebBrowserViewController *)webBrowser;
+ (HBWebBrowserViewController *)webBrowserWithConfiguration:(WKWebViewConfiguration *)configuration;
@end
