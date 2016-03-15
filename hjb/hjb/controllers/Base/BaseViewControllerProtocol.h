//
//  BaseViewControllerProtocol.h
//  PENG
//
//  Created by zeno on 15/12/14.
//  Copyright © 2015年 nonato. All rights reserved.
//
#import <objc/runtime.h>
#import <Foundation/Foundation.h>
#import "HBNavigationbar.h"
#import "ProtocolKit.h"
//#import "PENG_Define.h"
#import "UIViewAdditions.h"
#import "HJBRouterHelper.h"
#import <HBKit/HBKit.h>

#define DEFAULT_CELL_SELECTOR  DEFAULT_CELL_SELECT_ACTION

#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__);
#define NSLogMethod NSLog(@"🔴类名与方法名：%s（在第%d行），描述：%@", __PRETTY_FUNCTION__, __LINE__, NSStringFromClass([self class]));
#else
#  define NSLog(...) ;
#  define NSLogMethod ;
#endif

@protocol BaseViewControllerProtocol<NSObject>

@end

@interface HBBaseViewController(BaseViewControllerProtocol)
@property(nonatomic,retain) HBNavigationbar * navigationbar;
@property(nonatomic,retain) HBNavigationbar * navigationtoolsbar;

//-(HBNavigationbar *)navigationbar;
//-(void)setNavigationbar:(HBNavigationbar *)navigationbar;
//-(HBNavigationbar *)navigationtoolsbar;
//-(void)setNavigationtoolsbar:(HBNavigationbar *)navigationtoolsbar;

-(void)backtoparent:(id)sender andRefresh:(BOOL)refresh;
-(void)FinishedLoadData;
-(void)refreshView;
-(void)swizz_dealloc;

@end
