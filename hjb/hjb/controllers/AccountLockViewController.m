//
//  AccountLockViewController.m
//  hjb
//
//  Created by zeno on 16/3/18.
//  Copyright © 2016年 peng. All rights reserved.
//

#import "AccountLockViewController.h"
#import "BaseTableViewCell.h"
@interface AccountLockViewController ()
@property(nonatomic,strong) UISwitch * m_loginswitch;
@property(nonatomic,strong) UISwitch * m_ybswitch;

AS_CELL_STRUCT_COMMON(section00)
@end

@implementation AccountLockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadplistConfig:@"acclv"];

//    self.cell_struct_section00 = [self.dataDictionary objectForKey:KEY_INDEXPATH(0, 0)];
//    self.cell_struct_section00.cellheight = 100;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
