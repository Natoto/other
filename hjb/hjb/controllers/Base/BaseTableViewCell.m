//
//  BaseTableViewCell.m
//  PENG
//
//  Created by zeno on 15/12/14.
//  Copyright © 2015年 nonato. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "UIImageView+HBWebCache.h"

@implementation BaseTableViewCell


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
@end
