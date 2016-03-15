//
//  YYCommissionViewController.m
//  hjb
//
//  Created by zeno on 16/3/15.
//  Copyright © 2016年 peng. All rights reserved.
//

#import "YYCommissionViewController.h"
#import "UIImage+Tint.h"
#import <Masonry/Masonry.h>

@interface YYCommissionViewController ()
AS_CELL_STRUCT_COMMON(header)
AS_CELL_STRUCT_COMMON(detail)
@end

@implementation YYCommissionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.dataDictionary setObject:self.cell_struct_header forKey:KEY_INDEXPATH(0, 0)];
    [self.dataDictionary setObject:self.cell_struct_detail forKey:KEY_INDEXPATH(0, 1)];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.scrollEnabled = NO;
    self.navigationbar.title = @"YY佣金";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CELL_STRUCT *)cell_struct_header
{
    if (!_cell_struct_header) {
        CELL_STRUCT * cellstruct = [CELL_STRUCT cell_x_x_struct:@"我的佣金 \n 0.00元" detailvalue:nil target:nil selectAction:nil];
        [cellstruct.dictionary setObject:value_cellstruct_textAlignment_center forKey:key_cellstruct_textAlignment];
        cellstruct.cellheight = self.view.width;
        cellstruct.selectionStyle = NO;
        cellstruct.accessory = NO;
        cellstruct.titleLabelNumberOfLines = 2;
        _cell_struct_header = cellstruct;
    }
    return _cell_struct_header;
}


-(CELL_STRUCT *)cell_struct_detail
{
    if (!_cell_struct_detail) {
        CELL_STRUCT * cellstruct = [CELL_STRUCT cell_x_x_struct:@"温馨提示：佣金可以提现，也可以兑换Y币使用。当您Y币月不足时，可以通过扣除佣金的方式，满足您的正常使用。\n更多功能请使用电脑访问pay.duowan.com" detailvalue:nil target:nil selectAction:nil];
        [cellstruct.dictionary setObject:[UIColor clearColor] forKey:key_cellstruct_background];
        cellstruct.cellheight = 80;
        cellstruct.selectionStyle = NO;
        cellstruct.accessory = NO;
        cellstruct.titleFont = [UIFont systemFontOfSize:11];
        cellstruct.titleLabelNumberOfLines = 0;
        _cell_struct_detail = cellstruct;
    }
    return _cell_struct_detail;
}



@end
