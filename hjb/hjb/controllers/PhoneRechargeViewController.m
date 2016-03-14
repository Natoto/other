//
//  PhoneRechargeViewController.m
//  hjb
//
//  Created by zeno on 16/3/14.
//  Copyright © 2016年 peng. All rights reserved.
//

#import "PhoneRechargeViewController.h"
#import "UIImage+Tint.h"
#import "UIView+Tools.h"
#import "UINavigationController+FDFullscreenPopGesture.h"
#import "UIActionSheet+MKBlockAdditions.h"



@interface FeeChargeType : NSObject
@property(nonatomic,assign) CGFloat money;//原始
@property(nonatomic,assign) CGFloat dismoney;//打折后
@end
@implementation FeeChargeType

-(instancetype)initWithMoney:(CGFloat)money dismoney:(CGFloat)dismoney
{
    self = [super init];
    if (self) {
        _money = money;
        _dismoney = dismoney;
    }
    return self;
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"%.2f 元，优惠价 ￥%.2f",self.money,self.dismoney];
}
@end


@interface PhoneRechargeViewController ()

@property (weak, nonatomic) IBOutlet UIButton *btn_switchNumber;
@property (weak, nonatomic) IBOutlet UITextField *txt_phone;
@property (weak, nonatomic) IBOutlet UITextField *txt_money;
@property (weak, nonatomic) IBOutlet UIButton *btn_youhui;
@property (weak, nonatomic) IBOutlet UIView *v_moneyContainer;
@property (weak, nonatomic) IBOutlet UIButton *btn_charge;
@end

@implementation PhoneRechargeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"话费充值";
    [self.btn_charge  setBackgroundImage:[UIImage imageWithColor:[UIColor grayColor] size:CGSizeMake(1, 1)] forState:UIControlStateDisabled];
    [self.btn_charge  setBackgroundImage:[UIImage imageWithColor:self.hjb_themecolor size:CGSizeMake(1, 1)] forState:UIControlStateNormal];
    self.btn_charge.enabled = NO;
    
    
    [self.btn_switchNumber  setBackgroundImage:[UIImage imageWithColor:[UIColor grayColor] size:CGSizeMake(1, 1)] forState:UIControlStateDisabled];
    [self.btn_switchNumber  setBackgroundImage:[UIImage imageWithColor:self.hjb_themecolor size:CGSizeMake(1, 1)] forState:UIControlStateNormal];
    self.btn_switchNumber.enabled = YES;
    self.btn_youhui.userInteractionEnabled = NO;
    
    RACSignal * valiteacountSignal = [[self.txt_phone rac_textSignal] map:^id(NSString * value) {
        BOOL valiate = (value.length == 11);
        return @(valiate);
    }];
    
//    RACSignal * valitenumberSignal = [[self.txt_money rac_textSignal] map:^id(NSString * value) {
//        BOOL valide = value.length > 0 && (value.floatValue > 0);
//        return  @(valide);
//    }];
    
    RAC(self.btn_charge,enabled) = valiteacountSignal; // [RACSignal combineLatest:@[valiteacountSignal] reduce:^id(NSNumber * valideuser){\
        return @(valideuser.boolValue);\
    }];
    
    @weakify(self)
    [self.v_moneyContainer touchEndedBlock:^(UIView *selfView) {
        @strongify(self)
        [self.txt_phone resignFirstResponder];
        [UIActionSheet actionSheetWithTitle:@"请选择" message:nil destructiveButtonTitle:nil buttons:[self phonedisaccountdescriptions] showInView:self.view onDismiss:^(int buttonIndex) {
            FeeChargeType * type = [self phonedisaccounttypes][buttonIndex];
            self.txt_money.text = [NSString stringWithFormat:@"%.2f 元",type.money];
            [self.btn_youhui setTitle:[NSString stringWithFormat:@"优惠价：%.2f 元",type.dismoney] forState:UIControlStateNormal];
            
        } onCancel:^{
            
        }];
    }];
    
}

-(NSArray *)phonedisaccountdescriptions
{
    FeeChargeType  * type1 = [[FeeChargeType alloc] initWithMoney:100 dismoney:100.8];
    FeeChargeType  * type2 =[[FeeChargeType alloc] initWithMoney:50 dismoney:50.4];
    FeeChargeType  * type3 = [[FeeChargeType alloc] initWithMoney:30 dismoney:30.24];
    return @[type1.description,type2.description,type3.description];
}


-(NSArray *)phonedisaccounttypes
{
    FeeChargeType  * type1 = [[FeeChargeType alloc] initWithMoney:100 dismoney:100.8];
    FeeChargeType  * type2 =[[FeeChargeType alloc] initWithMoney:50 dismoney:50.4];
    FeeChargeType  * type3 = [[FeeChargeType alloc] initWithMoney:30 dismoney:30.24];
    
    return @[type1,type2,type3];
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
