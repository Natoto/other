//
//  CashierDeskViewController.m
//  hjb
//
//  Created by zeno on 16/3/15.
//  Copyright © 2016年 peng. All rights reserved.
//

#import "CashierDeskViewController.h"
#import "CashierDeskPayWayCell.h"
#import "CashierDeskHeaderCell.h"
#import "UIView+Tools.h"
#import "UIView+Transition.h"
@interface CashierDeskViewController ()
AS_CELL_STRUCT_COMMON(header)
AS_CELL_STRUCT_COMMON(payway1)
AS_CELL_STRUCT_COMMON(payway2)
@end

@implementation CashierDeskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"欢聚宝收银台";
    TABLEVIEW_REGISTERXIBCELL_CLASS(self.tableView, @"CashierDeskHeaderCell");
    TABLEVIEW_REGISTERXIBCELL_CLASS(self.tableView, @"CashierDeskPayWayCell");
    
    [self.dataDictionary setObject:self.cell_struct_header forKey:KEY_INDEXPATH(0, 0)];
    [self.dataDictionary setObject:self.cell_struct_payway1 forKey:KEY_INDEXPATH(1, 0)];
    [self.dataDictionary setObject:self.cell_struct_payway2 forKey:KEY_INDEXPATH(1, 1)];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self configtoolbar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

GET_CELL_SELECT_ACTION(cellstruct)
{
    
}

-(void)configtoolbar
{
    self.navigationtoolsbar.backgroundColor = self.hjb_themecolor;
    self.navigationtoolsbar.title = @"下一步";
    @weakify(self)
    [self.navigationtoolsbar touchEndedBlock:^(UIView *selfView) { @strongify(self)
        if ([self.navigationtoolsbar.title isEqualToString:@"下一步"]) {
            [self.dataDictionary removeAllObjects];
            [self.dataDictionary setObject:self.cell_struct_header forKey:KEY_INDEXPATH(0, 0)];
            [self.dataDictionary setObject:self.cell_struct_payway2 forKey:KEY_INDEXPATH(1, 0)];
            [self.navigationbar setleftBarButtonItemWithImage:[UIImage imageNamed:@"white_back_btn"] target:self selector:@selector(backtoselectpayway:)];
            [self.tableView reloadData];
            [self.view transitionCube];
            self.navigationtoolsbar.title = @"确认支付";
        }
        else
        {
            NSLog(@"确认。。。");
        }
    }];
}

-(IBAction)backtoselectpayway:(id)sender
{
    [self.dataDictionary setObject:self.cell_struct_header forKey:KEY_INDEXPATH(0, 0)];
    [self.dataDictionary setObject:self.cell_struct_payway1 forKey:KEY_INDEXPATH(1, 0)];
    [self.dataDictionary setObject:self.cell_struct_payway2 forKey:KEY_INDEXPATH(1, 1)];
    [self.navigationbar setleftBarButtonItemWithImage:[UIImage imageNamed:@"white_back_btn"] target:self selector:@selector(backtoparent:)];
    self.navigationtoolsbar.title = @"下一步";
    [self.tableView reloadData];
    [self.view transitionCube:HBUITransitionDirectionLeft];
    
}
#pragma mark - setter getter

-(CELL_STRUCT *)cell_struct_header
{
    if (!_cell_struct_header) {
        CELL_STRUCT * cellstruct = [CELL_STRUCT cell_x_x_struct:@"" detailvalue:nil target:self selectAction:DEFAULT_CELL_SELECT_ACTION];
        cellstruct.cellclass = NSStringFromClass([CashierDeskHeaderCell class]);
        cellstruct.xibvalue = @"xib";
        cellstruct.cellheight = 100;
        cellstruct.accessory = NO;
        cellstruct.selectionStyle = NO;
        _cell_struct_header = cellstruct;
    }
    return _cell_struct_header;
}

-(CELL_STRUCT *)cell_struct_payway1
{
    if (!_cell_struct_payway1) {
        CELL_STRUCT * cellstruct = [CELL_STRUCT cell_x_x_struct:@"账号余额0.00" detailvalue:nil target:self selectAction:DEFAULT_CELL_SELECT_ACTION];
        cellstruct.cellclass = NSStringFromClass([CashierDeskPayWayCell class]);
        cellstruct.xibvalue = @"xib";
        cellstruct.cellheight = 80;
        cellstruct.accessory = NO;
        cellstruct.selectionStyle = NO;
        cellstruct.sectiontitle = @"选择支付方式";
        cellstruct.sectionheight = 30;
        [cellstruct.dictionary setObject:[UIColor clearColor] forKey:key_cellstruct_background];
        [cellstruct.dictionary setObject:@"checkout_up" forKey:key_casheerdeskcell_bgimgname];
        
        _cell_struct_payway1 = cellstruct;
    }
    return _cell_struct_payway1;
}


-(CELL_STRUCT *)cell_struct_payway2
{
    if (!_cell_struct_payway2) {
        CELL_STRUCT * cellstruct = [CELL_STRUCT cell_x_x_struct:@"" detailvalue:nil target:self selectAction:DEFAULT_CELL_SELECT_ACTION];
        cellstruct.cellclass = NSStringFromClass([CashierDeskPayWayCell class]);
        cellstruct.xibvalue = @"xib";
        cellstruct.cellheight = 80;
        cellstruct.accessory = NO;
        cellstruct.selectionStyle = NO;
        cellstruct.picture = @"alipay";
        cellstruct.sectiontitle = @"选择支付方式";
        cellstruct.sectionheight = 30;
        [cellstruct.dictionary setObject:[UIColor clearColor] forKey:key_cellstruct_background];
        [cellstruct.dictionary setObject:@"checkoutxia" forKey:key_casheerdeskcell_bgimgname];
        _cell_struct_payway2 = cellstruct;
    }
    return _cell_struct_payway2;
}


@end
