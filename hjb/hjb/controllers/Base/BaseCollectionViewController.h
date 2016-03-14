//
//  BaseCollectionViewController.h
//  PENG
//
//  Created by zeno on 15/12/14.
//  Copyright © 2015年 nonato. All rights reserved.
//
#import <HBKit/HBKit.h>
#import "BaseViewControllerProtocol.h"
@interface BaseCollectionViewController : HBBaseCollectionViewController<BaseViewControllerProtocol>
@property(nonatomic,strong) NSNumber * thiscreateTime;
//@property(nonatomic,retain) HBNavigationbar * navigationbar;
//@property(nonatomic,retain) HBNavigationbar * navigationtoolsbar;
@end
