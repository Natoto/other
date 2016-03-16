//
//  BaseViewControllerProtocol.m
//  PENG
//
//  Created by zeno on 15/12/14.
//  Copyright © 2015年 nonato. All rights reserved.
//
#import "BaseViewControllerProtocol.h"
#import <objc/runtime.h>
#import "XYRuntime.h"
#import "UINavigationController+FDFullscreenPopGesture.h"
#import "HBNavigationbar.h"
#import "HBSignalBus.h"
#import "NSObject+HBHUD.h"
#import <Masonry/Masonry.h>

@implementation HBBaseViewController(BaseViewControllerProtocol)
@dynamic navigationbar;
@dynamic navigationtoolsbar;

+(void)load
{
    [XYRuntime swizzleInstanceMethodWithClass:[HBBaseViewController class] originalSel:@selector(viewDidLoad) replacementSel:@selector(swizz_viewDidLoad)];

    [XYRuntime swizzleInstanceMethodWithClass:[HBBaseViewController class] originalSel:@selector(setShowBackItem:) replacementSel:@selector(swizz_setShowBackItem:)];
    
    [XYRuntime swizzleInstanceMethodWithClass:[HBBaseViewController class] originalSel:@selector(setTitle:) replacementSel:@selector(swizz_setTitle:)];
    
//    [XYRuntime swizzleInstanceMethodWithClass:[HBBaseViewController class] originalSel:@selector(swizz_dealloc) replacementSel:@selector(swizz_dealloc)];
}

-(void)swizz_viewDidLoad
{
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeAll;
    }
    self.fd_prefersNavigationBarHidden = YES;
    self.view.backgroundColor =  KT_UIColorWithRGB(239, 239, 239);// [UIColor grayColor];
    self.navigationItem.backBarButtonItem= [[UIBarButtonItem alloc]initWithTitle:@""
                                                                           style:UIBarButtonItemStylePlain
                                                                          target:nil
                                                                          action:nil];
    
    ADD_HBSIGNAL_OBSERVER(self, @"networkerror", @"HTTPSEngine");
    if (self.navigationController.viewControllers.count>=2 && self.navigationController.topViewController == self) {
        
        [self.navigationbar setleftBarButtonItemWithImage:[UIImage imageNamed:@"white_back_btn"] target:self selector:@selector(backtoparent:)];
    }
//    [self swizz_viewDidLoad];
}


-(void)swizz_setShowBackItem:(BOOL)showBackItem
{
    if([[self class] isSubclassOfClass:[HBBaseViewController class]])
    {
        //TODO:设置返回按钮
        if (showBackItem) {
            [self.navigationbar setleftBarButtonItemWithImage:[UIImage imageNamed:@"white_back_btn"] target:self selector:@selector(backtoparent:)];
        }
        else
        {
            [self.navigationbar.leftItem removeFromSuperview];
        }
    }
    [self swizz_setShowBackItem:showBackItem];
}

ON_HBSIGNAL(HTTPSEngine, networkerror, notify)
{
    NSLogMethod;
    [self dismissAllTips];
    //    [self FinishedLoadData];
}


-(void)swizz_dealloc
{
    NSLogMethod 
    REMOVE_HBSIGNAL_OBSERVER(self, @"networkerror",  @"HTTPSEngine")
}

-(void)swizz_setTitle:(NSString *)title
{
    [self.navigationbar setTitle:title];
}

static char const key_navigationtoolsbar = 'b';
static char const key_navigationbar = 't';

-(HBNavigationbar *)navigationtoolsbar
{
    HBNavigationbar * toolsbar = objc_getAssociatedObject(self, &key_navigationtoolsbar);
    if (!toolsbar) {
        toolsbar = [HBNavigationbar navigationtoolbar];
        [self.view addSubview:toolsbar];
        [toolsbar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.equalTo(self.view).offset(0);
            make.height.equalTo(@44);
        }];
        [self setNavigationtoolsbar:toolsbar];
    }
    return toolsbar;
}

-(void)setNavigationtoolsbar:(HBNavigationbar *)navigationtoolsbar
{
    [self willChangeValueForKey:@"navigationtoolsbar"];
    objc_setAssociatedObject(self, &key_navigationtoolsbar, navigationtoolsbar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"navigationtoolsbar"];
}

-(HBNavigationbar *)navigationbar
{
     HBNavigationbar * navbar = objc_getAssociatedObject(self, &key_navigationbar);
    if (!navbar) {
        navbar = [self.view viewWithTag:0x1437];
        if (!navbar) {
            navbar = [HBNavigationbar navigationbar];
            navbar.backgroundColor = [UIColor blackColor];
            [self.view addSubview:navbar];
            self.view.autoresizesSubviews = YES;
            [navbar mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.left.right.equalTo(self.view).offset(0);
                make.height.equalTo(@64);
            }];
//            navbar.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleRightMargin| UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleWidth;
            navbar.tag = 0x1437;
        }
        [self setNavigationbar:navbar];
        
    }
    return navbar;
}

-(void)setNavigationbar:(HBNavigationbar *)navigationbar
{
    @synchronized(self) {
        [self willChangeValueForKey:@"navigationbar"];
         objc_setAssociatedObject(self, &key_navigationbar, navigationbar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self didChangeValueForKey:@"navigationbar"];
    }
}

-(void)backtoparent:(id)sender andRefresh:(BOOL)refresh
{
    if([[self class] isSubclassOfClass:[UIViewController class]])
    {
        UINavigationController * navigation = (UINavigationController *)self.navigationController;        
//        UIViewController * ctr = (UIViewController *)self;
        if (self.navigationController.childViewControllers.count >1 && self.navigationController.topViewController == self) {
            [navigation popViewControllerAnimated:YES];
            if (refresh) {
                HBBaseViewController * ctr = (HBBaseViewController *)navigation.topViewController;
                [ctr refreshView];
            }
            return;
        }
        if (self.presentingViewController) {
            
            UINavigationController * navigation = (UINavigationController *)self.navigationController;
            [self dismissViewControllerAnimated:YES completion:NULL];
            if (refresh) {
                HBBaseViewController * ctr = (HBBaseViewController *)navigation.topViewController;
                [ctr refreshView];
            }
        }
    }
}

-(void)FinishedLoadData{}
-(void)refreshView{}

@end
