//
//  HomeViewController.m
//  hjb
//
//  Created by zeno on 16/3/9.
//  Copyright © 2016年 peng. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>
#import "HomeViewController.h"
#import "HomeHeaderCell.h"
#import "HomeFunctionsCell.h"
#import "HBImageViewCell.h"
#import "RootViewController.h"
#import "SettingViewController.h"
#import "YBChargeViewController.h"
#import "QBChargeViewController.h"
#import "PhoneRechargeViewController.h"
#import "HBLanguage.h"

@interface HomeViewController ()
AS_CELL_STRUCT_COMMON(header)
AS_CELL_STRUCT_COMMON(functons)
AS_CELL_STRUCT_COMMON(ads)

@end

@implementation HomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationbar.title = __TEXT(@"homepage");// @"首页";
    NSString * righttitle = __TEXT(@"setting");
    
    
    [self.navigationbar setrightBarButtonItemWithTitle:righttitle target:self selector:@selector(showSetting:)];
    
    self.tableView.contentInset = UIEdgeInsetsMake(HEIGHT_NAVIGATIONBAR, 0, 0, 0);
    TABLEVIEW_REGISTERXIBCELL_CLASS(self.tableView, @"HomeHeaderCell")
    TABLEVIEW_REGISTERXIBCELL_CLASS(self.tableView, @"HomeFunctionsCell")
    
    [self.dataDictionary setObject:self.cell_struct_header forKey:KEY_INDEXPATH(0, 0)];
    [self.dataDictionary setObject:self.cell_struct_functons forKey:KEY_INDEXPATH(1, 0)];
    [self.dataDictionary setObject:self.cell_struct_ads forKey:KEY_INDEXPATH(2, 0)];
   
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      HomeFunctionsCell * cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]];
      if (cell) {
          [cell.delegateSignal  subscribeNext:^(NSNumber * x) {
              NSLog(@"%@",x);
              switch (x.intValue) {
                  case 0:
                  {
                      YBChargeViewController * ctr = [[YBChargeViewController alloc] initWithNibName:@"YBChargeViewController" bundle:nil];
                      [[RootViewController sharedInstance] rootpushViewcontroller:ctr animated:YES];
                      break;
                  }
                  case 1:
                  {
                      QBChargeViewController * ctr = [[QBChargeViewController alloc] initWithNibName:@"QBChargeViewController" bundle:nil];
                      [[RootViewController sharedInstance] rootpushViewcontroller:ctr animated:YES];
                      break;
                  }
                  case 2:
                  {
                      PhoneRechargeViewController * ctr = [[PhoneRechargeViewController alloc] initWithNibName:@"PhoneRechargeViewController" bundle:nil];
                      [[RootViewController sharedInstance] rootpushViewcontroller:ctr animated:YES];
                      break;
                  }
                  case 3:
                  {
                      [[RootViewController sharedInstance] openURL:@"http://wap.www.up24.com/"];
                      break;
                  }
                  default:
                      break;
              }
          }];
      }
});
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

}

-(IBAction)showSetting:(id)sender
{
    SettingViewController * ctr = [SettingViewController new];
    [[RootViewController sharedInstance]  rootpushViewcontroller:ctr animated:YES];
}

GET_CELL_SELECT_ACTION(cellstruct)
{
    NSLogMethod;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - setter getter

-(CELL_STRUCT *)cell_struct_ads
{
    if (!_cell_struct_ads) {
        CELL_STRUCT * cellstruct = [CELL_STRUCT cell_x_x_struct:nil detailvalue:nil target:self selectAction:DEFAULT_CELL_SELECTOR];
        cellstruct.cellheight = 80;
        cellstruct.cellclass = NSStringFromClass([HBImageViewCell class]);
        cellstruct.accessory = NO;
        cellstruct.picture = @"ad";
        cellstruct.sectionheight = 20;
        cellstruct.selectionStyle = NO;
        [cellstruct.dictionary setObject:[NSValue valueWithCGSize:CGSizeMake(self.view.bounds.size.width, 80)] forKey:key_soloImageView_size];
        _cell_struct_ads = cellstruct;
    }
    return _cell_struct_ads;
}


-(CELL_STRUCT *)cell_struct_header
{
    if (!_cell_struct_header) {
        CELL_STRUCT * cellstruct = [CELL_STRUCT cell_x_x_struct:nil detailvalue:nil target:self selectAction:DEFAULT_CELL_SELECTOR];
        cellstruct.cellheight = 90;
        cellstruct.cellclass =  NSStringFromClass([HomeHeaderCell class]);//@"HomeHeaderCell";
        cellstruct.xibvalue = @"xib";
        cellstruct.accessory = NO;
        cellstruct.selectionStyle = NO;
        _cell_struct_header = cellstruct;
    }
    return _cell_struct_header;
}

-(CELL_STRUCT *)cell_struct_functons
{
    if (!_cell_struct_functons) {
        CELL_STRUCT * cellstruct = [CELL_STRUCT cell_x_x_struct:nil detailvalue:nil target:self selectAction:DEFAULT_CELL_SELECTOR];
        cellstruct.cellheight = ([UIScreen mainScreen].bounds.size.width/2);
        cellstruct.sectionheight = 20;
        cellstruct.cellclass = NSStringFromClass([HomeFunctionsCell class]);
        cellstruct.xibvalue = @"xib";
        cellstruct.accessory = NO;
        cellstruct.selectionStyle = NO;
        [cellstruct.dictionary setObject:@[@"ycoin",
                                           @"qcoin",
                                           @"telephonefee",
                                           @"shopcoin",
                                           @"yjicon",
                                           @"eyjb",
                                           @"scan_bar"] forKey:key_cellstruct_imagenames];
        
        [cellstruct.dictionary setObject:@[@"Y币充值",
                                           @"Q币充值",
                                           @"话费充值",
                                           @"贝富商城",
                                           @"YY佣金",
                                           @"一元聚宝",
                                           @"扫码支付"] forKey:key_cellstruct_titles];
        
        [cellstruct.dictionary setObject:[UIColor grayColor] forKey:key_cellstruct_background];
        _cell_struct_functons = cellstruct;
    }
    return _cell_struct_functons;
}
@end
