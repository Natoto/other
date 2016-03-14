//
//  LoginViewController.m
//  hjb
//
//  Created by zeno on 16/3/10.
//  Copyright © 2016年 peng. All rights reserved.
//
#import "UIViewController+DismissKeyboard.h"
#import "LoginViewController.h"
#import "LoginModel.h"
#import "UIImage+Tint.h"
#import "NSObject+HBHUD.h"

@interface LoginViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txt_username;
@property (weak, nonatomic) IBOutlet UITextField *txt_password;
@property (weak, nonatomic) IBOutlet UIButton *btn_login;
@property (weak, nonatomic) IBOutlet UIButton *btn_forget;
@property (weak, nonatomic) IBOutlet UIButton *btn_moreaccount;
@property (weak, nonatomic) IBOutlet UILabel *lbl_tips;

@property (strong, nonatomic) LoginModel * model;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupForDismissKeyboard];
    self.title = @"登录";
    [self configsubviews];
    @weakify(self)
    [[self
       rac_signalForSelector:@selector(textFieldShouldReturn:)
      fromProtocol:@protocol(UITextFieldDelegate)]
    	subscribeNext:^(RACTuple *tuple) {
            @strongify(self)
            if (tuple.first == self.txt_username)
            {
                [self.txt_password becomeFirstResponder];
            }
            else
            {
                [self.txt_password resignFirstResponder];
                [self.model.loginCommand execute:nil];
            }
        }];
    self.txt_password.delegate = self;
    self.txt_username.delegate = self;
    [self bindViewModel];    
}


- (void)bindViewModel
{
    self.txt_username.text = self.model.username;
    self.txt_password.text = self.model.password;
    
    RAC(self.model,username) = [self.txt_username rac_textSignal];
    RAC(self.model,password) = [self.txt_password rac_textSignal];
    
    RACSignal * validUsernameSignal = [[self.txt_username rac_textSignal] map:^id(id value) {
        NSString * str = (NSString *)value;
        BOOL valide = str.length > 1;
        return @(valide);
    }];
    
    RACSignal * validPasswordSignal = [[self.txt_password rac_textSignal] map:^id(id value) {
        NSString * str = (NSString *)value;
        BOOL valide = str.length > 1;
        return @(valide);
    }];
    
    RACSignal * signUpActiveSignal = [RACSignal combineLatest:@[validUsernameSignal,validPasswordSignal] reduce:^id(NSNumber * valideuser,NSNumber * validpassword){
        return @(valideuser.boolValue && validpassword.boolValue);
    }];
    
    [signUpActiveSignal subscribeNext:^(NSNumber *valide) {
        self.btn_login.enabled = valide.boolValue;
    }];
    
    @weakify(self)
     [[self.model.loginCommand.executing skip:1]  subscribeNext:^(NSNumber *executing) {
        @strongify(self)
        if (executing.boolValue) {
            [self.view endEditing:YES];
            [self presentLoadingTips:@"登陆中..."];
        } else {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self dismissAllTips];
                [self presentMessageTips:@"登陆成功" dismisblock:^{
                    [self backtoparent:nil];
                }];
            });
        }
    }];
    
    [[self.btn_login rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
          @strongify(self)
        [self.txt_username resignFirstResponder];
        [self.txt_password resignFirstResponder];
        [self.model.loginCommand execute:nil];
    }];
    
}
-(void)configsubviews
{
    [self.btn_login  setBackgroundImage:[UIImage imageWithColor:[UIColor grayColor] size:CGSizeMake(1, 1)] forState:UIControlStateDisabled];
    [self.btn_login  setBackgroundImage:[UIImage imageWithColor:[UIColor orangeColor] size:CGSizeMake(1, 1)] forState:UIControlStateNormal];
    self.btn_login.enabled = NO;
}
-(LoginModel *)model
{
    if (!_model) {
        _model = [LoginModel new];
    }
    return _model;
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
