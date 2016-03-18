//
//  SettingViewController.m
//  hjb
//
//  Created by zeno on 16/3/10.
//  Copyright © 2016年 peng. All rights reserved.
//
#import "RootViewController.h"
#import "SettingViewController.h"
#import "LoginViewController.h"

@interface SettingViewController ()
AS_CELL_STRUCT_COMMON(exit)
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"设置";
    NSArray * images = @[@"setpwd",@"setphone",@"consume_lock",@"consume_lock"];
    NSArray * titles = @[@"设置支付密码",@"修改密保手机",@"账号锁",@"收货地址"];
    
    [images enumerateObjectsUsingBlock:^(NSString *  _Nonnull imgname, NSUInteger idx, BOOL * _Nonnull stop) {
        CELL_STRUCT * cellstruct = [CELL_STRUCT cell_x_x_struct:titles[idx] detailvalue:nil target:self selectAction:DEFAULT_CELL_SELECT_ACTION];
        cellstruct.picture = imgname;
        cellstruct.sectionheight = 20;
        [self.dataDictionary setObject:cellstruct forKey:KEY_INDEXPATH(0, idx)];
    }];
    [self.dataDictionary setObject:self.cell_struct_exit forKey:KEY_INDEXPATH(1, 0)];
}

GET_CELL_SELECT_ACTION(cellstruct)
{
    if (cellstruct == self.cell_struct_exit) {
        LoginViewController * ctr = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
        [[RootViewController sharedInstance] rootpresentViewController:ctr animated:YES completion:^{
            [self.navigationController popToRootViewControllerAnimated:NO];
        }];
    }
    if ([cellstruct.title isEqualToString:@"修改密保手机"]) {
        [self openURLString:@"ChangeMSecureViewController" forkey:@"ChangeMSecureViewController" parameters:nil];
    }
    else if([cellstruct.title isEqualToString:@"账号锁"])
    {
        [self openURLString:@"AccountLockViewController" forkey:@"AccountLockViewController" parameters:nil];
    }
} 

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CELL_STRUCT *)cell_struct_exit
{
    if (!_cell_struct_exit) {
        CELL_STRUCT * cellstruct = [CELL_STRUCT cell_x_x_struct:@"退出登录" detailvalue:nil target:self selectAction:DEFAULT_CELL_SELECT_ACTION];
        cellstruct.sectionheight = 50;
        cellstruct.titlecolor = value_cellstruct_white;
        cellstruct.accessory = NO;
        cellstruct.selectionStyle = NO;
        [cellstruct.dictionary setObject:value_cellstruct_textAlignment_center forKey:key_cellstruct_textAlignment];
        [cellstruct.dictionary setObject:KT_UIColorWithRGB(255, 77, 0) forKey:key_cellstruct_background];
        _cell_struct_exit = cellstruct;
    }
    return _cell_struct_exit;
}

@end
