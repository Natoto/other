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

-(void)setcellRightValue:(NSString *)value
{
    if (value.length) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(hb_AcessoryButton:)]) {
            UIControl * control = [self.delegate hb_AcessoryButton:self];
            _AcessoryButton = control;
        }
        if (self.AcessoryButton) {
            if ([[self.AcessoryButton class] isSubclassOfClass:[UIButton class]]) {
                UIButton * btn = (UIButton *)self.AcessoryButton;
                [btn setTitle:value forState:UIControlStateNormal];
            }
            self.accessoryView = self.AcessoryButton;
        }
    }
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
    //----- from plist string --------
    NSNumber * titlefontsize = [dictionary objectForKey:key_cellstruct_titleuifont];
    if (titlefontsize && [[titlefontsize class] isSubclassOfClass:[NSNumber class]]) {
        self.textLabel.font = [UIFont systemFontOfSize:titlefontsize.floatValue];// titlefont;
    }
    
    NSString * titlecolorstr = [dictionary objectForKey:key_cellstruct_titleuicolor];
    if (titlecolorstr && [[titlecolorstr class] isSubclassOfClass:[NSString class]]) {
        self.textLabel.textColor = [CELL_STRUCT_Common colorWithStructKey:titlecolorstr];
    }
    NSNumber * detailfontsize = [dictionary objectForKey:key_cellstruct_detailuifont];
    if (detailfontsize && [[detailfontsize class] isSubclassOfClass:[NSNumber class]]) {
        UIFont * font = [UIFont systemFontOfSize:detailfontsize.floatValue];
        self.detailTextLabel.font = font;
    }
    
    NSString * detailcolorstr = [dictionary objectForKey:key_cellstruct_detailuicolor];
    if (detailcolorstr && [[detailcolorstr class] isSubclassOfClass:[NSString class]]) {
        UIColor * color = [CELL_STRUCT_Common colorWithStructKey:detailcolorstr];
        self.detailTextLabel.textColor = color;
    }
    
}


-(UIButton *)AcessoryButton
{
    UIButton * button;
    if (!_AcessoryButton) {
        button = [UIButton  buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, 70, 25);
        [button setTitle:@"已关注" forState:UIControlStateSelected];
        [button.titleLabel setFont:[UIFont systemFontOfSize:13] ];
        [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        _AcessoryButton = button;
    }
    else
    {
        button = (UIButton *)_AcessoryButton ;
    }
    return button;
}
@end
