//
//  PengDelegate.h
//  PENG
//
//  Created by zeno on 15/11/18.
//  Copyright © 2015年 nonato. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BaseTableViewCell;
/**
 *  BaseTableViewCell 按钮点击事件协议
 */
@protocol PENGCellProtocol <NSObject>

@optional
-(void)hbtableViewCell:(BaseTableViewCell *)cell subView:(UIView *)view TapWithTag:(NSInteger)Tag;


-(void)PENGView:(UIView *)view subView:(UIView *)subview TapWithTag:(NSInteger)Tag;
@end
 
//发送CELL 里面的View的点击事件出去
#define SEND_CELL_TAP_TO_DELEGATE(UIVIEWTYPE,SENDER)\
if (self.delegate && [self.delegate respondsToSelector:@selector(hbtableViewCell:subView:TapWithTag:)]) {\
UIVIEWTYPE * button = (UIVIEWTYPE *)SENDER;\
[self.delegate hbtableViewCell:self subView:button TapWithTag:button.tag];\
}

//发送UIView的点击事件出去
#define SEND_VIEW_TAP_TO_DELEGATE(UIVIEWTYPE,SENDER)\
if (self.delegate && [self.delegate respondsToSelector:@selector(PENGView:subView:TapWithTag:)]) {\
UIVIEWTYPE * button = (UIVIEWTYPE *)SENDER;\
[self.delegate PENGView:self subView:button TapWithTag:button.tag];\
}

@interface PENGProtocol : NSObject

@end
