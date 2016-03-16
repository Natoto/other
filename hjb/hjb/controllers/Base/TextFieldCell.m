//
//  TextFieldCell.m
//  hjb
//
//  Created by zeno on 16/3/16.
//  Copyright © 2016年 peng. All rights reserved.
//
#import <Masonry/Masonry.h>
#import "TextFieldCell.h"
#import "TextInputAccessoryView.h"

@interface TextFieldCell()
@property (strong, nonatomic) TextInputAccessoryView  * inputAccessoryView;
@end

@implementation TextFieldCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _txt_content = [UITextField new];
        _txt_content.clearButtonMode = UITextFieldViewModeWhileEditing;
        [self.contentView addSubview:_txt_content];
        [_txt_content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(5, 5, 5, 5));
        }];
    }
    return self;
}


-(void)setcellTitle:(NSString *)title
{
    self.txt_content.text = title;
}

-(void)setcellRightValue:(NSString *)value
{
    if (value) {
        [self.AcessoryButton setTitle:value forState:UIControlStateNormal];
        self.accessoryView = self.AcessoryButton;
    }
}



-(void)setcellplaceholder:(NSString *)placeholder
{
    if (placeholder) {
        self.txt_content.placeholder = placeholder;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(IBAction)AcessoryButtonTap:(id)sender
{
}


-(CGSize)sizeThatFits:(CGSize)size
{
    [self.txt_content sizeToFit];
    if (self.txt_content.bounds.size.height < 40) {
        return CGSizeMake(size.width, 40);
    }
    else
    {
        return CGSizeMake(size.width, self.txt_content.bounds.size.height);
    }
}


-(void)setcelldictionary:(NSMutableDictionary *)dictionary
{
    [super setcelldictionary:dictionary];
    
  
    self.txt_content.placeholder = [dictionary objectForKey:key_cellstruct_placehoder];
    self.txt_content.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    NSString * keyboardtype = [dictionary objectForKey:key_cellstruct_txtkeyboardtype];
    self.txt_content.keyboardType = UIKeyboardTypeDefault;
    if (keyboardtype) {
        if ([keyboardtype isEqualToString:value_cellstruct_txtkeyboardtype_number]) {
            self.txt_content.keyboardType = UIKeyboardTypePhonePad;
        }
    }
    
    NSNumber * secureentry = [dictionary objectForKey:key_cellstruct_txtsecureTextEntry];
    if (secureentry) {
        self.txt_content.secureTextEntry = secureentry.boolValue;
    }
    
    NSNumber * editing = [dictionary objectForKey:key_cellstruct_editing];
    if (editing) {
        self.editing = editing.boolValue;
    }
    
    NSNumber * editable = [dictionary objectForKey:key_cellstruct_editabled];
    if (editable) {
        self.txt_content.enabled = editable.boolValue;
    }
    
}
//-(TextInputAccessoryView  *)inputAccessoryView
//{
//    if (!_inputAccessoryView) {
//        _inputAccessoryView = [TextInputAccessoryView  defaultAccessoryView];
//        [_inputAccessoryView addTarget:self action:@selector(done:) forControlEvents:UIControlEventTouchUpInside];
//    }
//    return _inputAccessoryView;
//}


-(UIButton *)AcessoryButton
{
    if (!_AcessoryButton) {
        UIButton * button = [UIButton  buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, 55, 22);
        [button setTitle:@"已关注" forState:UIControlStateSelected];
        [button.titleLabel setFont:[UIFont systemFontOfSize:12] ];
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//        [button addTarget:self action:@selector(AcessoryButtonTap:) forControlEvents:UIControlEventTouchUpInside];
        _AcessoryButton = button;
    }
    return _AcessoryButton;
}


@end
