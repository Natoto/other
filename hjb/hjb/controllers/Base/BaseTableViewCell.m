//
//  BaseTableViewCell.m
//  PENG
//
//  Created by zeno on 15/12/14.
//  Copyright © 2015年 nonato. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "UIImageView+HBWebCache.h"
@interface BaseTableViewCell()
@end
@implementation BaseTableViewCell

//-(UIButton *)hb_AcessoryButton:(BaseTableViewCell *)cell
//{
//    if (self.delegate && [self.delegate respondsToSelector:@selector(hb_AcessoryButton:)]) {
//        _AcessoryButton = [self.delegate hb_AcessoryButton:self];
//        return [self.delegate hb_AcessoryButton:self];
//    }
//    return self.AcessoryButton;
//}

-(void)setcellRightValue:(NSString *)value
{
    if (value.length) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(hb_AcessoryButton:)]) {
            _AcessoryButton = [self.delegate hb_AcessoryButton:self];
        }
        if (self.AcessoryButton) {
            [self.AcessoryButton setTitle:value forState:UIControlStateNormal];
            self.accessoryView = self.AcessoryButton;
        }
    }
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIView *view_bg = [[UIView alloc]initWithFrame:self.frame];
        view_bg.backgroundColor = [UIColor grayColor];
        self.selectedBackgroundView = view_bg;
    }
    return self;
}
-(void)setcellProfile:(NSString *)profile
{
    if (!profile) {
        return;
    }
    if ([profile hasPrefix:@"http://"] || [profile hasPrefix:@"https://"]) {//如果是网络图片 就加载网络图片
        [self.imageView hb_setImageWithURL:[NSURL URLWithString:profile] placeholderImage:[UIImage imageNamed:@"nopic"] options:0 completed:nil];
        return;
    }
    self.imageView.image = [UIImage imageNamed:profile];
}


-(void)setcelldictionary:(NSMutableDictionary *)dictionary
{
    [super setcelldictionary:dictionary];
    
    UIFont * titlefont = [dictionary objectForKey:key_cellstruct_titleuifont];
    if (titlefont && [[titlefont class] isSubclassOfClass:[UIFont class]]) {
        self.textLabel.font = titlefont;
    }
    
    UIColor * titlecolor = [dictionary objectForKey:key_cellstruct_titleuicolor];
    if (titlecolor && [[titlecolor class] isSubclassOfClass:[UIColor class]]) {
        self.textLabel.textColor = titlecolor;
    }
    UIFont * detailfont = [dictionary objectForKey:key_cellstruct_detailuifont];
    if (detailfont && [[detailfont class] isSubclassOfClass:[UIFont class]]) {
        self.detailTextLabel.font = detailfont;
    }
    
    UIColor * detailcolor = [dictionary objectForKey:key_cellstruct_detailuicolor];
    if (detailcolor && [[detailcolor class] isSubclassOfClass:[UIColor class]]) {
        self.detailTextLabel.textColor = detailcolor;
    }
}


-(UIButton *)AcessoryButton
{
    if (!_AcessoryButton) {
        UIButton * button = [UIButton  buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, 80, 25);
        [button setTitle:@"已关注" forState:UIControlStateSelected];
        [button.titleLabel setFont:[UIFont systemFontOfSize:12] ];
        [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        _AcessoryButton = button;
    }
    return _AcessoryButton;
}
@end
