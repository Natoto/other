//
//  WebViewController.m
//  hjb
//
//  Created by zeno on 16/3/18.
//  Copyright © 2016年 peng. All rights reserved.
//

#import "WebViewController.h"
#import "HBWebBrowserViewController.h"

@implementation UIViewController(WebViewController)

/**
 *  打开网页
 *
 *  @param htmlurl url
 */
-(void)openHTMLURL:(NSString *)htmlurl
{
    NSLog(@"%s %@",__func__,htmlurl);
    if (htmlurl && htmlurl.length) {
        HBWebBrowserViewController * ctr;
        if(![htmlurl hasPrefix:@"http://"])
        {//加载本地文件
            ctr = [HBWebBrowserViewController locoalwebBrowser];
        }
        else
        {
            ctr = [HBWebBrowserViewController webBrowser];
        }
        CGFloat offsetY = ctr.navigationbar.bottom - 20;
        CGRect frame = CGRectMake(0, offsetY, ctr.view.width, ctr.view.height - offsetY);
        if (ctr.wkWebView) {
            ctr.wkWebView.frame = frame;
        }
        else
        {
            ctr.uiWebView.frame = frame;
        }
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [ctr loadURLString:htmlurl];
        });
        [self.navigationController pushViewController:ctr animated:YES];
    }
}


@end
