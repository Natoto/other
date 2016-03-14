//
//  HBButton.m
//  hjb
//
//  Created by zeno on 16/3/10.
//  Copyright © 2016年 peng. All rights reserved.
//

#import "HBButton.h"

@implementation HBButton

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self  = [super initWithCoder:aDecoder];
    if (self) {
    }
    return self;
}

-(void)setImage:(UIImage *)image andTitle:(NSString *)title
{
    [self setImage:image forState:UIControlStateNormal];
    [self setTitle:title forState:UIControlStateNormal];
    [self setHBLayout:HBImageTopTitleBootomStyle spacing:5];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:14];
}


@end


@implementation  UIButton(hblayoutstyle)

- (void)setHBLayout:(HBUIButtonLayoutStyle )aLayoutStyle
          spacing:(CGFloat)aSpacing
{
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    
    CGFloat totalHeight = (imageSize.height + titleSize.height + aSpacing);
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets titleEdgeInsets = UIEdgeInsetsZero;
    if (aLayoutStyle == HBImageLeftTitleRightStyle) {
        imageEdgeInsets = UIEdgeInsetsMake(0, -(aSpacing / 2.0f), 0, 0 );
        titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, - (aSpacing / 2.0f));
    }
    else if (aLayoutStyle == HBTitleLeftImageRightStyle) {
        imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -(titleSize.width * 2 + aSpacing / 2.0f));
        titleEdgeInsets = UIEdgeInsetsMake(0, -(imageSize.width * 2 + aSpacing / 2.0f), 0, 0);
    }else if (aLayoutStyle == HBImageTopTitleBootomStyle){
        imageEdgeInsets = UIEdgeInsetsMake( -(totalHeight - imageSize.height),
                                           0.0,
                                           0.0,
                                           - titleSize.width);
        titleEdgeInsets  = UIEdgeInsetsMake(0.0,
                                            -imageSize.width,
                                            - (totalHeight - titleSize.height),
                                            0.0);
    }else if (aLayoutStyle == HBTitleTopImageBootomStyle){
        imageEdgeInsets = UIEdgeInsetsMake(0.0,
                                           0.0,
                                           -(totalHeight - imageSize.height),
                                           - titleSize.width);
        
        titleEdgeInsets = UIEdgeInsetsMake(-(totalHeight - titleSize.height),
                                           0.0,
                                           -imageSize.width,
                                           0.0);
    }
    self.imageEdgeInsets = imageEdgeInsets;
    self.titleEdgeInsets = titleEdgeInsets;
}

@end