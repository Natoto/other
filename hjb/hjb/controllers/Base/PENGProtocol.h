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
/**
 *  子CELL点击事件传出的代理
 *
 *  @param view    cell本身
 *  @param subview 触发源
 *  @param tag     触发标志
 */
-(void)hbtableViewCell:(BaseTableViewCell *)cell subView:(UIView *)view TapWithTag:(NSInteger)Tag;

/**
 *  子CELL点击事件传出的代理
 *
 *  @param view    cell本身
 *  @param subview 触发源
 *  @param object  带出的参数
 */
-(void)PENGView:(UIView *)view subView:(UIView *)subview TapWithObject:(id)object;

/**
 *  子CELL点击事件传出的代理
 *
 *  @param view    cell本身
 *  @param subview 触发源
 *  @param tag     触发标志
 */
-(void)PENGView:(UIView *)view subView:(UIView *)subview TapWithTag:(NSInteger)Tag;



/**
 *  右边AcessoryView替代方案
 *
 *  @param cell cell
 *
 *  @return 返回UIControl
 */
-(UIControl *)hb_AcessoryButton:(BaseTableViewCell *)cell;
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
