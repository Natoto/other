//
//  ChangeMSecureViewController.m
//  hjb
//
//  Created by zeno on 16/3/17.
//  Copyright © 2016年 peng. All rights reserved.
//

#import "ChangeMSecureViewController.h"
#import <yytext/YYText.h>
#import "BaseTableViewCell.h"
#import "CountDownButton.h"
#import "HBLabelCell.h"
#import "UIAlertView+MKBlockAdditions.h"
@interface ChangeMSecureViewController ()<BaseTableViewCellProtol>
AS_CELL_STRUCT_COMMON(curphone)

@property (strong, nonatomic) CountDownButton *dynamicPasswordButton;
@end

@implementation ChangeMSecureViewController

-(NSIndexPath *)indexpathofCurphone
{
    return [NSIndexPath indexPathForRow:0 inSection:1];
}

-(NSIndexPath *)indexpathOfinputcode
{
    return [NSIndexPath indexPathForRow:0 inSection:2];
}

-(NSIndexPath *)indexpathOfNext
{
    return [NSIndexPath indexPathForRow:1 inSection:0];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self loadplistConfig:@"cmsvc"];
    [self updateCellstructs];
    self.title = @"修改密保手机";
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
}

-(void)updateCellstructs
{
    
    self.cell_struct_curphone = [self.dataDictionary objectForKey:KEY_INDEXPATH(0, 1)];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSMutableAttributedString * attring = [NSMutableAttributedString new];
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"当前手机号码：1233***332     "];
        one.yy_font = [UIFont systemFontOfSize:14];
        one.yy_color = [UIColor grayColor];
        [attring appendAttributedString:one];
        
        NSMutableAttributedString *nofoundstr = [[NSMutableAttributedString alloc] initWithString:@"不再使用？"];
        nofoundstr.yy_font = [UIFont systemFontOfSize:14];
        nofoundstr.yy_color = [UIColor orangeColor];
        nofoundstr.yy_underlineColor = [UIColor orangeColor];
        nofoundstr.yy_underlineStyle = NSUnderlineStyleSingle;
        
        YYTextHighlight *highlight = [YYTextHighlight new];
        [highlight setColor:[UIColor colorWithRed:1.000 green:0.795 blue:0.014 alpha:1.000]];
        highlight.tapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
             NSLog(@"000000 点击了%@",text.string);
            [UIAlertView  alertViewWithTitle:@"提示" message:@"请使用PC访问欢聚宝官网：http://pay.yy.com重新设置手机号码" cancelButtonTitle:@"OK" otherButtonTitles:nil onDismiss:^(int buttonIndex) {
            } onCancel:^{
            }];
        };
        [nofoundstr yy_setTextHighlight:highlight range:nofoundstr.yy_rangeOfAll];
        
        [attring appendAttributedString:nofoundstr];
        self.cell_struct_curphone.attributeTitle =attring;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    });
}

-(BOOL)equalIndexpath:(NSIndexPath *)indexpath toIndexpath:(NSIndexPath *)indexpath2
{
    if (indexpath.section == indexpath2.section && indexpath.row == indexpath2.section) {
        return YES;
    }
    return NO;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
    });
}
-(UIButton *)hb_AcessoryButton:(BaseTableViewCell *)cell
{
    if (cell.indexPath.section == 0 && cell.indexPath.row == 2) {
        return self.dynamicPasswordButton;
    }
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(CountDownButton *)dynamicPasswordButton
{
    if (!_dynamicPasswordButton) {
        CountDownButton * btn = [CountDownButton buttonWithType:UIButtonTypeCustom];
        btn.frame =CGRectMake(0, 0, 100, 30);
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
        [btn addTarget:btn action:@selector(startCountDown) forControlEvents:UIControlEventTouchUpInside];
        _dynamicPasswordButton = btn;
    }
    return _dynamicPasswordButton;
}

@end
