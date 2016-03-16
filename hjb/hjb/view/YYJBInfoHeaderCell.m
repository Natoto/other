//
//  YYJBInfoHeaderCell.m
//  hjb
//
//  Created by zeno on 16/3/16.
//  Copyright © 2016年 peng. All rights reserved.
//

#import "YYJBInfoHeaderCell.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface YYJBInfoHeaderCell()
@property (weak, nonatomic) IBOutlet UILabel *lbl_title;
@property (weak, nonatomic) IBOutlet UILabel *lbl_eachprice;
@property (weak, nonatomic) IBOutlet UILabel *lbl_canyucishu;
@property (weak, nonatomic) IBOutlet UIView *countContainer;
@property (weak, nonatomic) IBOutlet UIButton *btn_minus;
@property (weak, nonatomic) IBOutlet UIButton *btn_add;
@property (weak, nonatomic) IBOutlet UITextField *txt_count;
@property (weak, nonatomic) IBOutlet UILabel *lbl_count;
@property (weak, nonatomic) IBOutlet UIImageView *img_bg;
@property (weak, nonatomic) IBOutlet UIView *container;
@property (weak, nonatomic) IBOutlet UIView *line1;
@property (weak, nonatomic) IBOutlet UIView *line0;

@property (strong,nonatomic) NSString * countString;
@end

@implementation YYJBInfoHeaderCell

- (void)awakeFromNib {
    
    [self.container sendSubviewToBack:self.img_bg];
    
    RAC(self,countString) = [self.txt_count rac_textSignal];
    RAC(self.txt_count,text) = RACObserve(self, countString);
    
    @weakify(self)
    [[self.btn_minus rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self)
        [self setCountString:[NSString stringWithFormat:@"%ld",self.countString.integerValue -1]];
        self.lbl_count.text = [NSString stringWithFormat:@"支付金额:%.2f",self.countString.floatValue];
    }];
    
    [[self.btn_add rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {@strongify(self)
        [self setCountString:[NSString stringWithFormat:@"%ld",self.countString.integerValue + 1]];
        self.lbl_count.text = [NSString stringWithFormat:@"支付金额:%.2f",self.countString.floatValue];
    }];
    
    RAC(self.lbl_count,text) = [[self.txt_count rac_textSignal] map:^id(NSString * value) {
        return [NSString stringWithFormat:@"支付金额:%.2f",value.floatValue];
    }];
    
     RACSignal * valiteSignal = [RACObserve(self, countString) map:^id(NSString * value) {
        BOOL valiate = value.integerValue >= 1;
        return @(valiate);
    }];
    
    RAC(self.btn_minus,enabled) = valiteSignal;
    RAC(self.txt_count,backgroundColor) = [valiteSignal map:^id(NSNumber * x) {
        return (x.boolValue == YES)?[UIColor clearColor]:[UIColor redColor];
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
