//
//  YYJBPayInfoViewController.m
//  hjb
//
//  Created by zeno on 16/3/16.
//  Copyright © 2016年 peng. All rights reserved.
//

#import "YYJBPayInfoViewController.h"
#import "YYJBInfoHeaderCell.h"
#import "TextFieldCell.h"
#import "ButtonCell.h"
#import "NSString+Addition.h"

@interface YYJBPayInfoViewController ()
AS_CELL_STRUCT_COMMON(header)
AS_CELL_STRUCT_COMMON(tips)
AS_CELL_STRUCT_COMMON(tips_sendtophone)
AS_CELL_STRUCT_COMMON(tips_risk)
AS_CELL_STRUCT_COMMON(phone)
AS_CELL_STRUCT_COMMON(pay)
@end

@implementation YYJBPayInfoViewController
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"一元聚宝";
    TABLEVIEW_REGISTERXIBCELL_CLASS(self.tableView, @"YYJBInfoHeaderCell");
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.dataDictionary setObject:self.cell_struct_header forKey:KEY_INDEXPATH(0, 0)];
    [self.dataDictionary setObject:self.cell_struct_tips forKey:KEY_INDEXPATH(0, 1)];
    [self.dataDictionary setObject:self.cell_struct_tips_sendtophone forKey:KEY_INDEXPATH(0, 2)];
    [self.dataDictionary setObject:self.cell_struct_phone forKey:KEY_INDEXPATH(1, 0)];
    [self.dataDictionary setObject:self.cell_struct_tips_risk forKey:KEY_INDEXPATH(2, 0)];
    [self.dataDictionary setObject:self.cell_struct_pay forKey:KEY_INDEXPATH(2, 1)];
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
//    self.tableView.bounces = NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

GET_CELL_SELECT_ACTION(cellstruct)
{
    
}


static float keybordheight;

-(void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([indexPath row] == ((NSIndexPath*)[[tableView indexPathsForVisibleRows] lastObject]).row){
        //end of loading
        dispatch_async(dispatch_get_main_queue(),^{
            TextFieldCell * cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]];
            if (cell) {
                [[cell.txt_content rac_textSignal] subscribeNext:^(id x) {
                    NSLog(@"%@",x);
                }];
                
                [[cell.AcessoryButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
                    NSLog(@"按钮点击了");
                }];
            }
            @weakify(self)
            [[[NSNotificationCenter defaultCenter]
              rac_addObserverForName:UIKeyboardWillShowNotification
              object:nil]
             subscribeNext:^(NSNotification *notify) { @strongify(self)
                 
                 CGSize kbSize = [[notify.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
                 keybordheight = kbSize.height;
                 NSIndexPath * indexpath =  [NSIndexPath indexPathForRow:0 inSection:1];
                 float duration = [notify.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
                 CGRect rect = [self.tableView rectForRowAtIndexPath:indexpath];
                 [UIView animateWithDuration:duration animations:^{
                     self.tableView.contentOffset = CGPointMake(0, rect.origin.y);
                 }];
                }
             ];
            
            [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIKeyboardWillHideNotification object:nil] subscribeNext:^(NSNotification *notify) { @strongify(self)
                float duration = [notify.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
                [UIView animateWithDuration:duration animations:^{
                    self.tableView.contentOffset = CGPointMake(0, 0);
                }];
            }];
        });
        
    }
}

#pragma mark - getter setter 

-(CELL_STRUCT *)cell_struct_pay
{
    if (!_cell_struct_pay) {
        
        CELL_STRUCT * cellstruct = [CELL_STRUCT cell_x_x_struct:@"立即支付" detailvalue:nil target:self selectAction:DEFAULT_CELL_SELECT_ACTION];
//        cellstruct.cellclass = NSStringFromClass([ButtonCell class]);
        cellstruct.cellheight = 44.;
        cellstruct.accessory = NO;
        cellstruct.selectionStyle = YES;
        cellstruct.titlecolor = value_cellstruct_white;
        [cellstruct.dictionary setObject:value_cellstruct_textAlignment_center forKey:key_cellstruct_textAlignment];
        [cellstruct.dictionary setObject:self.hjb_themecolor forKey:key_cellstruct_background];
        _cell_struct_pay = cellstruct;
    }
    return _cell_struct_pay;
}

-(CELL_STRUCT *)cell_struct_phone
{
    if (!_cell_struct_phone) {
        
        CELL_STRUCT * cellstruct = [CELL_STRUCT cell_x_x_struct:@"12341231242" detailvalue:nil target:self selectAction:DEFAULT_CELL_SELECT_ACTION];
        cellstruct.cellclass =  NSStringFromClass([TextFieldCell class]);
        cellstruct.cellheight = 44.;
        cellstruct.sectioncolor = value_cellstruct_gray;
        cellstruct.accessory = YES;
        cellstruct.rightValue = @"修改";
        cellstruct.selectionStyle = NO;
        [cellstruct.dictionary setObject:value_cellstruct_txtkeyboardtype_number forKey:key_cellstruct_txtkeyboardtype];
        _cell_struct_phone = cellstruct;
    }
    return _cell_struct_phone;
}

-(CELL_STRUCT *)cell_struct_tips
{
    if (!_cell_struct_tips) {
        CELL_STRUCT * cellstruct = [self create_tips_structcell:@"您每支付一元，即购买一天聚宝大神身份，同时获得一次参与聚宝活动的机会！(详细说明)"];
        cellstruct.accessory = YES;
        _cell_struct_tips = cellstruct;
    }
    return _cell_struct_tips;
}

-(CELL_STRUCT *)cell_struct_tips_risk
{
    if (!_cell_struct_tips_risk) {
        CELL_STRUCT * cellstruct = [self create_tips_structcell:@"聚宝有风险,参与需谨慎\n继续支付表示同意《欢聚宝-一元聚宝用户协议》"];
        [cellstruct.dictionary setObject:value_cellstruct_textAlignment_center forKey:key_cellstruct_textAlignment];
        cellstruct.accessory = NO;
        cellstruct.sectionheight = 20.;
        _cell_struct_tips_risk = cellstruct;
    }
    return _cell_struct_tips_risk;
}


-(CELL_STRUCT *)cell_struct_tips_sendtophone
{
    if (!_cell_struct_tips_sendtophone) {
        CELL_STRUCT * cellstruct = [self create_tips_structcell:@"聚宝成功将联系您的手机"];
        _cell_struct_tips_sendtophone = cellstruct;
    }
    return _cell_struct_tips_sendtophone;
}


-(CELL_STRUCT *)cell_struct_header
{
    if (!_cell_struct_header) {
        CELL_STRUCT * cellstruct = [CELL_STRUCT cell_x_x_struct:@"" detailvalue:nil target:self selectAction:DEFAULT_CELL_SELECT_ACTION];
        cellstruct.cellclass = @"YYJBInfoHeaderCell";
        cellstruct.xibvalue = @"xib";
        cellstruct.cellheight = 137;
        cellstruct.sectionfooterheight = 10.0;
        cellstruct.accessory = NO;
        cellstruct.selectionStyle = NO;
        [cellstruct.dictionary setObject:[UIColor clearColor] forKey:key_cellstruct_background];
        _cell_struct_header = cellstruct;
    }
    return _cell_struct_header;
}

-(CELL_STRUCT *)create_tips_structcell:(NSString *)title
{
    CELL_STRUCT * cellstruct = [CELL_STRUCT cell_x_x_struct:title detailvalue:nil target:self selectAction:DEFAULT_CELL_SELECT_ACTION];
    cellstruct.cellheight = 44.0;
    cellstruct.titleFont = [UIFont systemFontOfSize:12.];
    cellstruct.titlecolor = value_cellstruct_gray;
    cellstruct.selectionStyle = NO;
    cellstruct.accessory = NO;
    cellstruct.titleLabelNumberOfLines = 0;
    [cellstruct.dictionary setObject:[UIColor clearColor] forKey:key_cellstruct_background];
    return cellstruct;
}

@end
