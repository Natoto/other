//
//  QBChargeViewController.m
//  hjb
//
//  Created by zeno on 16/3/11.
//  Copyright © 2016年 peng. All rights reserved.
//

#import "QBChargeViewController.h"
#import "UIImage+Tint.h"

@interface QBChargeViewController ()

@property (weak, nonatomic) IBOutlet UITextField *txt_yyaccount;
@property (weak, nonatomic) IBOutlet UITextField *txt_yynumber;
@property (weak, nonatomic) IBOutlet UIButton *btn_chargefor;
@property (weak, nonatomic) IBOutlet UILabel *lbl_yynumber;
@property (weak, nonatomic) IBOutlet UIButton *btn_charge;
@end

@implementation QBChargeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Q币充值";
    RAC(self.lbl_yynumber,text) = [[self.txt_yynumber rac_textSignal] map:^id(NSString * value) {
        return [NSString stringWithFormat:@"￥%.2f",value.floatValue*0.98];
    }];
    
    [self.btn_charge  setBackgroundImage:[UIImage imageWithColor:[UIColor grayColor] size:CGSizeMake(1, 1)] forState:UIControlStateDisabled];
    [self.btn_charge  setBackgroundImage:[UIImage imageWithColor:self.hjb_themecolor size:CGSizeMake(1, 1)] forState:UIControlStateNormal];
    self.btn_charge.enabled = NO;
    
    RACSignal * valiteacountSignal = [[self.txt_yyaccount rac_textSignal] map:^id(NSString * value) {
        BOOL valide = value.length > 0;
        return  @(valide);
    }];
    RACSignal * valitenumberSignal = [[self.txt_yynumber rac_textSignal] map:^id(NSString * value) {
        BOOL valide = value.length > 0 && (value.floatValue > 0);
        return  @(valide);
    }];
    
    RAC(self.btn_charge,enabled) = [RACSignal combineLatest:@[valiteacountSignal,valitenumberSignal] reduce:^id(NSNumber * valideuser,NSNumber * validnumber){
        return @(valideuser.boolValue && validnumber.boolValue);
    }];
    
    [[self.btn_charge rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        [self openURLString:@"CashierDeskViewController" forkey:@"CashierDeskViewController" parameters:nil];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
