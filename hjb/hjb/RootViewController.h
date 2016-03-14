//
//  ViewController.h
//  hjb
//
//  Created by zeno on 16/3/9.
//  Copyright © 2016年 peng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"
#import "BaseViewController.h"
typedef enum : NSUInteger {
    ROOT_TYPE_DIS,
    ROOT_TYPE_SQUARE,
    ROOT_TYPE_MINE,
} ROOT_TYPE;

@interface RootViewController : BaseViewController
AS_SINGLETON(RootViewController)
@property (nonatomic,strong ) HomeViewController * ctr1;
@property (assign, nonatomic) ROOT_TYPE          current_root_type;

-(void)openURL:(NSString *)htmlurl;//广告选择

-(void)rootpushViewcontroller:(UIViewController *)ctr animated:(BOOL)anmimated;
-(void)rootpresentViewController:(UIViewController *)ctr animated:(BOOL)animated completion:(void (^)(void))completion;
@end

