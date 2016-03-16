//
//  ButtonCell.m
//  hjb
//
//  Created by zeno on 16/3/16.
//  Copyright © 2016年 peng. All rights reserved.
//

#import "ButtonCell.h"
#import <Masonry/Masonry.h>

@implementation ButtonCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_button];
        
        [_button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(5, 5, 5, 5));
        }];
    }
    return self;
}

-(void)setcellTitle:(NSString *)title
{
    [self.button setTitle:title forState:UIControlStateNormal];
}


-(void)setcellProfile:(NSString *)profile
{
    if (profile) {
        [self.button setImage:[UIImage imageNamed:profile] forState:UIControlStateNormal];
    }
}

@end
