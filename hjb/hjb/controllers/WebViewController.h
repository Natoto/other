//
//  WebViewController.h
//  hjb
//
//  Created by zeno on 16/3/18.
//  Copyright © 2016年 peng. All rights reserved.
//


@interface UIViewController(WebViewController)
/**
 *  打开网页
 *
 *  @param htmlurl url 如果是本地网页则填路径，如果是远程则以http://开头
 */
-(void)openHTMLURL:(NSString *)htmlurl;
@end
