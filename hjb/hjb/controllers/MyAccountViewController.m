//
//  MyAccountViewController.m
//  hjb
//
//  Created by zeno on 16/3/15.
//  Copyright © 2016年 peng. All rights reserved.
//

#import "MyAccountViewController.h"
#import "MyAccountHeaderCell.h"
#import "MyAccountChargeCell.h"
#import "MyAccountBalancesCell.h"

@interface MyAccountViewController ()
AS_CELL_STRUCT_COMMON(charge)
AS_CELL_STRUCT_COMMON(header)
AS_CELL_STRUCT_COMMON(balance)
AS_CELL_STRUCT_COMMON(gotocharge)
@end

@implementation MyAccountViewController


-(IBAction)showSetting:(id)sender
{
    [self openURLString:@"SettingViewController" forkey:@"SettingViewController" parameters:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的账户";
    [self.navigationbar setrightBarButtonItemWithTitle:@"设置" target:self selector:@selector(showSetting:)];
    
    TABLEVIEW_REGISTERXIBCELL_CLASS(self.tableView, @"MyAccountHeaderCell");
    TABLEVIEW_REGISTERXIBCELL_CLASS(self.tableView, @"MyAccountBalancesCell");
    TABLEVIEW_REGISTERXIBCELL_CLASS(self.tableView, @"MyAccountChargeCell");
    
    NSInteger rowIndex = 0;
    NSInteger sectionIndex = 0;
    [self.dataDictionary setObject:self.cell_struct_header forKey:KEY_INDEXPATH(sectionIndex++, 0)];
    [self.dataDictionary setObject:self.cell_struct_balance forKey:KEY_INDEXPATH(sectionIndex++, 0)];
    [self.dataDictionary setObject:self.cell_struct_gotocharge forKey:KEY_INDEXPATH(sectionIndex++, 0)];
    [self.dataDictionary setObject:self.cell_struct_charge forKey:KEY_INDEXPATH(sectionIndex++, 0)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


GET_CELL_SELECT_ACTION(cellstruct)
{
    if (cellstruct == self.cell_struct_gotocharge || cellstruct == self.cell_struct_charge) {
        [self openURLString:@"YBChargeViewController" forKeyAndNib:@"YBChargeViewController" parameters:nil];
    }
}

-(CELL_STRUCT *)cell_struct_header
{
    if (!_cell_struct_header) {
        CELL_STRUCT * cellstruct = [CELL_STRUCT cell_x_x_struct:@"" detailvalue:nil target:self selectAction:DEFAULT_CELL_SELECT_ACTION];
        cellstruct.cellclass = @"MyAccountHeaderCell";
        cellstruct.xibvalue = @"xib";
        cellstruct.cellheight = 120;
        cellstruct.accessory = NO;
        cellstruct.selectionStyle = NO;
        _cell_struct_header = cellstruct;
    }
    return _cell_struct_header;
}


-(CELL_STRUCT *)cell_struct_charge
{
    if (!_cell_struct_charge) {
        CELL_STRUCT * cellstruct = [CELL_STRUCT cell_x_x_struct:@"" detailvalue:nil target:self selectAction:DEFAULT_CELL_SELECT_ACTION];
        cellstruct.cellclass =NSStringFromClass([MyAccountChargeCell class]);
        cellstruct.xibvalue = @"xib";
        cellstruct.cellheight = 80;
        cellstruct.accessory = NO;
        cellstruct.selectionStyle = NO;
        cellstruct.sectionheight = 20;
        _cell_struct_charge = cellstruct;
    }
    return _cell_struct_charge;
}


-(CELL_STRUCT *)cell_struct_balance
{
    if (!_cell_struct_balance) {
        CELL_STRUCT * cellstruct = [CELL_STRUCT cell_x_x_struct:@"" detailvalue:nil target:self selectAction:DEFAULT_CELL_SELECT_ACTION];
        cellstruct.cellclass =NSStringFromClass([MyAccountBalancesCell class]);
        cellstruct.xibvalue = @"xib";
        cellstruct.cellheight = 70;
        cellstruct.sectionheight = 20;
        cellstruct.accessory = NO;
        cellstruct.selectionStyle = NO;
        _cell_struct_balance = cellstruct;
    }
    return _cell_struct_balance;
}


-(CELL_STRUCT *)cell_struct_gotocharge
{
    if (!_cell_struct_gotocharge) {
        CELL_STRUCT * cellstruct = [CELL_STRUCT cell_x_x_struct:@"立即充值" detailvalue:nil target:self selectAction:DEFAULT_CELL_SELECT_ACTION]; 
        cellstruct.sectionheight = 20;
        cellstruct.titlecolor = value_cellstruct_white;
        cellstruct.accessory = NO;
        cellstruct.selectionStyle = YES;
        [cellstruct.dictionary setObject:value_cellstruct_textAlignment_center forKey:key_cellstruct_textAlignment];
        [cellstruct.dictionary setObject:self.hjb_themecolor forKey:key_cellstruct_background];
        _cell_struct_gotocharge = cellstruct;
    }
    return _cell_struct_gotocharge;
}



@end
