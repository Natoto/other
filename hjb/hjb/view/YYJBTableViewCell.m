//
//  YYJBTableViewCell.m
//  hjb
//
//  Created by zeno on 16/3/15.
//  Copyright © 2016年 peng. All rights reserved.
//
#import "UIImage+Tint.h"
#import "HJBConstant.h"
#import "YYJBTableViewCell.h"

@interface YYJBTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *img_profile;
@property (weak, nonatomic) IBOutlet UIButton *btn_state;
@property (weak, nonatomic) IBOutlet UILabel *lbl_title;
@property (weak, nonatomic) IBOutlet UILabel *lbl_needcount;
@property (weak, nonatomic) IBOutlet UIProgressView *progressbar;
@property (weak, nonatomic) IBOutlet UILabel *lbl_tips;
@property (weak, nonatomic) IBOutlet UILabel *lbl_money;
@property (weak, nonatomic) IBOutlet UIButton *btn_action;
@property (weak, nonatomic) IBOutlet UIView *toolsContainer;
@property (weak, nonatomic) IBOutlet UIView *container;

@end

@implementation YYJBTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.toolsContainer.backgroundColor = [UIColor whiteColor];
    self.container.layer.borderColor = [UIColor colorWithRed:209./255. green:209./255. blue:209./255. alpha:1].CGColor;
    self.container.layer.borderWidth = 0.6;
    
    self.progressbar.layer.borderColor = self.hjb_themecolor.CGColor;
    self.progressbar.layer.borderWidth = 1;
    self.progressbar.layer.cornerRadius = 5;
    self.progressbar.layer.masksToBounds = YES;
    
    
    self.btn_state.layer.cornerRadius = 5;
    self.btn_state.layer.borderWidth = 1;
    self.btn_state.layer.borderColor = [UIColor colorWithRed:174./255. green:207./255. blue:47./255. alpha:1].CGColor;
    [self.btn_state setTitleColor:[UIColor colorWithRed:174./255. green:207./255. blue:47./255. alpha:1] forState:UIControlStateNormal];
    self.btn_state.layer.masksToBounds = YES;
    
    self.btn_action.layer.masksToBounds = YES;
    self.btn_action.layer.cornerRadius = 5;
    [self.btn_action setBackgroundImage:[UIImage imageWithColor:self.hjb_themecolor  size:CGSizeMake(1, 1)] forState:UIControlStateNormal ];
    
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
 
}

@end
