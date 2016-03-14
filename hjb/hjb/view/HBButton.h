//
//  HBButton.h
//  hjb
//
//  Created by zeno on 16/3/10.
//  Copyright © 2016年 peng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, HBUIButtonLayoutStyle) {
    HBImageLeftTitleRightStyle = 0, //默认的方式 image左 title右
    HBTitleLeftImageRightStyle = 1, // image右,title左
    HBImageTopTitleBootomStyle = 2, //image上，title下
    HBTitleTopImageBootomStyle = 3, // image下,title上
};

@interface HBButton : UIButton

-(void)setImage:(UIImage *)image andTitle:(NSString *)title;
@end

@interface UIButton(hblayoutstyle)

- (void)setHBLayout:(HBUIButtonLayoutStyle )aLayoutStyle
          spacing:(CGFloat)aSpacing;
@end
