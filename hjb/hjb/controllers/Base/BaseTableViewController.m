//
//  BaseTableViewController.m
//  PENG
//
//  Created by zeno on 15/12/14.
//  Copyright © 2015年 nonato. All rights reserved.
//

#import "BaseTableViewController.h"
#import "UIView+Transition.h"
#import <MJRefresh/MJRefresh.h>
//#import "UIView+Loading.h"
#import "PengGifRefresh.h"
#import <MJRefresh/MJRefreshStateHeader.h>

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController
@synthesize noHeaderFreshView = _noHeaderFreshView;
@synthesize noFooterView = _noFooterView;

-(void)setNoHeaderFreshView:(BOOL)noHeaderFreshView
{
    _noHeaderFreshView = noHeaderFreshView;
    if (noHeaderFreshView) {
        [self.tableView.header removeFromSuperview];
    }
    else
    {
       PengGifHeader * header = [PengGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshView)];
        // 隐藏时间
        header.lastUpdatedTimeLabel.hidden = YES;
        // 隐藏状态
        header.stateLabel.hidden = YES;
        self.tableView.header = header;
    }
}


ON_HBSIGNAL(HTTPSEngine, networkerror, notify)
{
    [self FinishedLoadData];
}

-(void)setNoFooterView:(BOOL)noFooterView
{
    _noFooterView = noFooterView;
    if (_noFooterView) {
        [self.tableView.footer removeFromSuperview];
    }
    else
    {
        PengGifFooter * footer = [PengGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(getNextPageView)];
        // 隐藏时间
        //        footer.lastUpdatedTimeLabel.hidden = YES;
        // 隐藏状态
        footer.stateLabel.hidden = YES;
        self.tableView.footer = footer;
    }
}
/**
 *  从PLIST 文件中加载配置信息
 *
 *  @param plistname plist文件的名字
 */
-(void)loadplistConfig:(NSString *)plistname
{
    NSString * filepath = [[NSBundle mainBundle] pathForResource:plistname ofType:@"plist"];
    NSDictionary * dic = [NSDictionary dictionaryWithContentsOfFile:filepath];
    
    for (NSString * key in dic.allKeys) {
        NSDictionary * adic = dic[key];
        CELL_STRUCT * cellstruct = [[CELL_STRUCT alloc] initWithPlistDictionary:adic];
        [self.dataDictionary setObject:cellstruct forKey:key];
    }
    NSLog(@"dic:%@",dic);
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setExtraCellLineHidden:self.tableView];
    [self.view sendSubviewToBack:self.tableView];
    self.tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    if (self.navigationController.childViewControllers.count > 1 && self.navigationController.topViewController == self) {
        self.showBackItem = YES;
    }
}
-(BOOL)isShowLoadingView
{
    return NO;
}

-(void)FinishedLoadData
{
    [super FinishedLoadData];
//    [self.view hideloadingview];
}

-(void)finishReloadingData
{
    [super finishReloadingData];
//    [self.view hideloadingview];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
   UIView * view = [super tableView:tableView viewForHeaderInSection:section];
   CELL_STRUCT *cell_struce = [self.dataDictionary objectForKey:KEY_INDEXPATH(section, 0)];
   UIColor * sectioncolor = [cell_struce.dictionary objectForKey:key_cellstruct_sectionbguicolor];
   if (sectioncolor && [[sectioncolor class] isSubclassOfClass:[UIColor class]]) {
        view.backgroundColor = sectioncolor;
    }
    return view;
}
- (void)setExtraCellLineHidden:(UITableView *)tableView
{
    UIView *view =[ [UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}

-(void)removeDataDictionaryForSection:(NSInteger)section
{
    NSMutableArray * sectionkeys = [NSMutableArray new];
    [self.dataDictionary.allKeys enumerateObjectsUsingBlock:^(NSString * sectionrowkey, NSUInteger idx, BOOL * stop) {
        NSString * sectionstr = KEY_SECTION_INDEX_STR(sectionrowkey);
        if (sectionstr && sectionstr.integerValue == section) {
            [sectionkeys addObject:sectionrowkey];
        }
    }];
    if (sectionkeys.count) {
        [self.dataDictionary removeObjectsForKeys:sectionkeys];
    }
}

-(void)dealloc
{
    NSLogMethod
    //    NSLog(@"%@ : %s",NSStringFromClass([self class]),__func__);
    REMOVE_HBSIGNAL_OBSERVER(self, @"networkerror",  @"HTTPSEngine")
}


@end
