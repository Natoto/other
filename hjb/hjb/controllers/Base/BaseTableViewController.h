//
//  BaseTableViewController.h
//  PENG
//
//  Created by zeno on 15/12/14.
//  Copyright © 2015年 nonato. All rights reserved.
//

#import <HBKit/HBKit.h>
#import "BaseViewController.h"
#import "BaseViewControllerProtocol.h"
#import "PENGProtocol.h"

#define TABLEVIEW_REGISTER_CELLCLASS(TABLEVIEW,CELLCLSSTR) {[TABLEVIEW registerClass:NSClassFromString(CELLCLSSTR) forCellReuseIdentifier:CELLCLSSTR];}

static NSString * key_cellstruct_sectionbguicolor = @"key_cellstruct_sectionuicolor";

@interface BaseTableViewController : HBBaseTableViewController<PENGCellProtocol,BaseViewControllerProtocol>
//@property(nonatomic,retain) HBNavigationbar * navigationbar;
//@property(nonatomic,retain) HBNavigationbar * navigationtoolsbar;

/**
 *  是否显示loading动画 需要重载
 *
 *  @return 是否
 */
-(BOOL)isShowLoadingView;
//当前controller创建时间 用于返回的时候发通知
@property (nonatomic,strong) NSNumber *  thiscreateTime;

-(void)removeDataDictionaryForSection:(NSInteger)section;

/**
 *  从PLIST 文件中加载配置信息
 *
 *  @param plistname plist文件的名字
 */
-(void)loadplistConfig:(NSString *)plistname;
@end
