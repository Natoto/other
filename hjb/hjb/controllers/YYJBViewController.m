//
//  YYJBViewController.m
//  hjb
//
//  Created by zeno on 16/3/15.
//  Copyright © 2016年 peng. All rights reserved.
//

#import "YYJBViewController.h"
#import "YYJBTableViewCell.h"
#import "UIImage+Tint.h"
#import <Masonry/Masonry.h>

@interface YYJBViewController ()

@end

@implementation YYJBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    TABLEVIEW_REGISTERXIBCELL_CLASS(self.tableView, @"YYJBTableViewCell");
    for (int index = 0; index < 10; index ++) {
        CELL_STRUCT * celsltruct = [self createcellstruct];
        [self.dataDictionary setObject:celsltruct forKey:KEY_INDEXPATH(0, index)];
    }
    self.title = @"一元聚宝";
    [self configToolbar];
    [self.tableView setContentInset:UIEdgeInsetsMake(HEIGHT_NAVIGATIONBAR, 0, HEIGHT_NAVIGATIONBAR, 0)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

GET_CELL_SELECT_ACTION(cellstruct)
{
    [self openURLString:@"YYJBPayInfoViewController" forkey:@"YYJBPayInfoViewController" parameters:nil];
}


-(void)configToolbar
{
    UIButton * btn_myjb = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn_myjb setBackgroundImage:[UIImage imageWithColor:self.hjb_themecolor size:CGSizeMake(1, 1)] forState:UIControlStateNormal];
    [btn_myjb setTitle:@"我的聚宝" forState:UIControlStateNormal];
    [self.navigationtoolsbar addSubview:btn_myjb];
    [btn_myjb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@80);
        make.top.bottom.right.equalTo(self.navigationtoolsbar);
    }];
    [self.view bringSubviewToFront:self.navigationtoolsbar];
    self.navigationtoolsbar.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    UIButton * btn_aboutjb = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.navigationtoolsbar addSubview:btn_aboutjb];
    [btn_aboutjb setTitle:@"关于一元聚宝" forState:UIControlStateNormal];
    [btn_aboutjb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@150);
        make.top.bottom.equalTo(self.navigationtoolsbar);
    }];
    btn_aboutjb.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    [self.navigationtoolsbar clearTopLayer];
    [self.navigationtoolsbar clearBottomLayer];
}


-(CELL_STRUCT *)createcellstruct
{
    CELL_STRUCT * cellstruct = [CELL_STRUCT cell_x_x_struct:@"" detailvalue:nil target:self selectAction:DEFAULT_CELL_SELECT_ACTION];
    cellstruct.cellclass = @"YYJBTableViewCell";
    cellstruct.xibvalue = @"xib";
    cellstruct.cellheight = 315;
    cellstruct.accessory = NO;
    cellstruct.selectionStyle = NO;
    [cellstruct.dictionary setObject:self.view.backgroundColor forKey:key_cellstruct_background];
    return cellstruct;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
