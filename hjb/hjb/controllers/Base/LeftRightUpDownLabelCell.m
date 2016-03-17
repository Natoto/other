//
//  RightUpDownLabelCell.m
//  hjb
//
//  Created by BooB on 16/3/17.
//  Copyright © 2016年 peng. All rights reserved.
//

#import "LeftRightUpDownLabelCell.h"
#import <Masonry/Masonry.h>

@implementation LeftUpDownRightLabelCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _lbl_rightup = [UILabel new];
        _lbl_leftdown = [UILabel new];
        _lbl_leftup = [UILabel new];
        
        _lbl_leftup.textAlignment = NSTextAlignmentLeft;
        _lbl_leftdown.textAlignment = NSTextAlignmentLeft;        
        _lbl_rightup.textAlignment = NSTextAlignmentRight;
        
        
        [self.contentView addSubview:_lbl_rightup];
        [self.contentView addSubview:_lbl_leftup];
        [self.contentView addSubview:_lbl_leftdown];
        
        [_lbl_leftup mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(5);
            make.top.equalTo(self.contentView).offset(5);
            make.bottom.equalTo(_lbl_leftdown.mas_top);
        }];
        
        [_lbl_leftdown mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(5);
            make.bottom.equalTo(self.contentView).offset(-5);
            make.height.equalTo(_lbl_leftup.mas_height);
        }];
        
        [_lbl_rightup mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-5);
            make.top.equalTo(self.contentView).offset(5);
            make.bottom.equalTo(self.contentView).offset(-5);
        }];
        
        
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat imgright = self.imageView.frame.origin.x + self.imageView.frame.size.width;
    imgright += 8;
    
    [_lbl_leftup  mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(imgright);
        make.top.equalTo(self.contentView).offset(5);
        make.bottom.equalTo(_lbl_leftdown.mas_top);
    }];
    
    [_lbl_leftdown mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(imgright);
        make.bottom.equalTo(self.contentView).offset(-5);
    }];
    
}

-(void)setcellTitle:(NSString *)title
{
    self.lbl_leftup.text = title;
}

-(void)setcelldetailtitle:(NSString *)detailtitle
{
    self.lbl_leftdown.text = detailtitle;
}

-(void)setcellValue:(NSString *)value
{
    self.lbl_rightup.text = value;
}

-(void)setcelldictionary:(NSMutableDictionary *)dictionary
{
    [super setcelldictionary:dictionary];
    NSNumber * titlefont = [dictionary objectForKey:key_cellstruct_titleuifont];
    if (titlefont && [[titlefont class] isSubclassOfClass:[NSNumber class]]) {
        self.lbl_leftup.font = [UIFont systemFontOfSize:titlefont.floatValue];// titlefont;
    }
    
    NSString * titlecolor = [dictionary objectForKey:key_cellstruct_titleuicolor];
    if (titlecolor && [[titlecolor class] isSubclassOfClass:[NSString class]]) {
        self.lbl_leftup.textColor = [CELL_STRUCT_Common colorWithStructKey:titlecolor];
    }
    NSNumber * detailfont = [dictionary objectForKey:key_cellstruct_detailuifont];
    if (detailfont && [[detailfont class] isSubclassOfClass:[NSNumber class]]) {
        UIFont * font = [UIFont systemFontOfSize:detailfont.floatValue];
        self.lbl_leftdown.font = font;
        self.lbl_rightup.font = font;
    }
    
    NSString * detailcolor = [dictionary objectForKey:key_cellstruct_detailuicolor];
    if (detailcolor && [[detailcolor class] isSubclassOfClass:[NSString class]]) {
        UIColor * color = [CELL_STRUCT_Common colorWithStructKey:detailcolor];
        self.lbl_leftdown.textColor = color;
        self.lbl_rightup.textColor = color;
    }
    
}

@end

#pragma mark - LeftRightUpDownLabelCell
@interface LeftRightUpDownLabelCell()
@end
@implementation LeftRightUpDownLabelCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _lbl_rightdown = [UILabel new];
        _lbl_rightdown.textAlignment = NSTextAlignmentRight;
        
        [self.contentView addSubview:_lbl_rightdown];
        
        [self.lbl_rightup mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-5);
            make.top.equalTo(self.contentView).offset(5);
            make.bottom.equalTo(_lbl_rightdown.mas_top);
        }];
        
        [self.lbl_rightdown mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-5);
            make.bottom.equalTo(self.contentView).offset(-5);
            make.height.equalTo(self.lbl_rightup.mas_height);
        }]; 
    }
    return self;
}

-(void)setcellValue2:(NSString *)value
{
    self.lbl_rightdown.text = value;
}

-(void)setcelldictionary:(NSMutableDictionary *)dictionary
{
    [super setcelldictionary:dictionary];
    
    NSNumber * detailfont = [dictionary objectForKey:key_cellstruct_detailuifont];
    if (detailfont && [[detailfont class] isSubclassOfClass:[NSNumber class]]) {
        UIFont * font = [UIFont systemFontOfSize:detailfont.floatValue];
        self.lbl_rightdown.font = font;
    }
    
    NSString * detailcolor = [dictionary objectForKey:key_cellstruct_detailuicolor];
    if (detailcolor && [[detailcolor class] isSubclassOfClass:[NSString class]]) {
        UIColor * color = [CELL_STRUCT_Common colorWithStructKey:detailcolor];
        self.lbl_rightdown.textColor = color;
    }
    
}
@end

/***  创建一个有左边上下label 右边上下label 和有图标的cell  plist demo
 <dict>
 <key>title</key>
 <string>充值</string>
 <key>detailtitle</key>
 <string>2016-03-16</string>
 <key>cellclass</key>
 <string>LeftRightUpDownLabelCell</string>
 <key>picture</key>
 <string>myaccount2</string>
 <key>sel_selector_str</key>
 <string>selectAction:</string>
 <key>value</key>
 <string>+0.02</string>
 <key>subvalue2</key>
 <string>交易成功</string>
 <key>dictionary</key>
 <dict>
 <key>key_cellstruct_detailuicolor</key>
 <string>gray</string>
 <key>key_cellstruct_detailuifont</key>
 <integer>12</integer>
 <key>key_cellstruct_titleuicolor</key>
 <string>black</string>
 <key>key_cellstruct_titleuifont</key>
 <integer>14</integer>
 </dict>
 <key>sectionheight</key>
 <integer>20</integer>
 <key>selectionStyle</key>
 <true/>
 <key>cellheight</key>
 <integer>50</integer>
 <key>accessory</key>
 <false/>
 </dict>
 */