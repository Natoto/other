//
//  CashierDeskPayWayCell.m
//  hjb
//
//  Created by zeno on 16/3/15.
//  Copyright © 2016年 peng. All rights reserved.
//

#import "CashierDeskPayWayCell.h"
@interface CashierDeskPayWayCell()
@property (weak, nonatomic) IBOutlet UIView *containver;
@property (weak, nonatomic) IBOutlet UIButton *btn_check;
@property (weak, nonatomic) IBOutlet UIButton *btn_title;
@property (weak, nonatomic) IBOutlet UILabel *lbl_payinfo;
@property (weak, nonatomic) IBOutlet UIImageView *img_background;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *l_titletoleft;

@end


@implementation CashierDeskPayWayCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setcellTitle:(NSString *)title
{
    [self.btn_title setTitle:title forState:UIControlStateNormal];
}

-(void)setcellProfile:(NSString *)profile
{
    if (profile) {
        [self.btn_title setImage:[UIImage imageNamed:profile] forState:UIControlStateNormal];
    }
    else
    {
        [self.btn_title setImage:[UIImage new] forState:UIControlStateNormal];
    }
}

-(void)setcelldictionary:(NSMutableDictionary *)dictionary
{
    [super setcelldictionary:dictionary];
    NSString * bgimgname = [dictionary objectForKey:key_casheerdeskcell_bgimgname];
    if (bgimgname) {
        self.img_background.image = [UIImage imageNamed:bgimgname];
        [self.containver sendSubviewToBack:self.img_background];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
