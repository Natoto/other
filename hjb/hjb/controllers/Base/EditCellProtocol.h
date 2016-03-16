//
//  EditCellProtocol.h
//  PENG
//
//  Created by zeno on 15/8/27.
//  Copyright (c) 2015年 nonato. All rights reserved.
//

//#ifndef PENG_EditCellProtocol_h
//#define PENG_EditCellProtocol_h
//#endif
#import "BaseTableViewCell.h"

@class BaseTableViewCell;
/**
 *  含有 Testfield 编辑框的cell的协议
 */
@protocol EditTableViewCellDelegate

-(BOOL)EditTableViewCell:(BaseTableViewCell *)EditTableViewCell textFieldShouldReturn:(UITextField *)textField;
-(BOOL)EditTableViewCell:(BaseTableViewCell *)EditTableViewCell textField:(UITextField *)textField textChange:(NSString *)resultingString;
@optional
-(BOOL)EditTableViewCell:(BaseTableViewCell *)EditTableViewCell  textFieldShouldBeginEditing:(UITextField *)textField;
-(void)EditTableViewCell:(BaseTableViewCell *)EditTableViewCell textFieldDidEndEditing:(UITextField *)textField;
-(void)EditTableViewCell:(BaseTableViewCell *)EditTableViewCell textFieldDidBeginEditing:(UITextField *)textField;
@end

/*
 #pragma mark textfield delegate
 
 -(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
 {
 if (self.delegate && [self.delegate respondsToSelector:@selector(EditTableViewCell:textFieldShouldBeginEditing:)]) {
 return [self.delegate EditTableViewCell:self textFieldShouldBeginEditing:textField];
 }
 return YES;
 }
 -(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
 {
 if (self.delegate && [self.delegate respondsToSelector:@selector(EditTableViewCell:textField:textChange:)]) {
 NSString *resultingString = [textField.text stringByReplacingCharactersInRange:range withString: string];
 //        NSLog(@"shouldChangeCharactersInRange: %@", resultingString);
 [self.delegate EditTableViewCell:self textField:textField textChange:resultingString];
 }
 return YES;
 }
 -(void)textFieldDidBeginEditing:(UITextField *)textField
 {
 if (self.delegate && [self.delegate respondsToSelector:@selector(EditTableViewCell:textFieldDidBeginEditing:)]) {
 [self.delegate EditTableViewCell:self textFieldDidBeginEditing:textField];
 }
 }
 -(void)textFieldDidEndEditing:(UITextField *)textField
 {
 if (self.delegate && [self.delegate respondsToSelector:@selector(EditTableViewCell:textFieldDidEndEditing:)]) {
 [self.delegate EditTableViewCell:self textFieldDidEndEditing:textField];
 }
 }
 
 -(BOOL)textFieldShouldReturn:(UITextField *)textField
 {
 if (self.delegate && [self.delegate respondsToSelector:@selector(EditTableViewCell:textFieldShouldReturn:)]) {
 return [self.delegate EditTableViewCell:self textFieldShouldReturn:textField];
 }
 return YES;
 }
 
 */