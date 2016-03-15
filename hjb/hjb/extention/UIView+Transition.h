//
//  UIView+Transition.h
//  pengmi
//
//  Created by 星盛 on 15/3/26.
//  Copyright (c) 2015年 星盛. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    HBUITransitionDirectionRight,
    HBUITransitionDirectionLeft,
    HBUITransitionDirectionTop,
    HBUITransitionDirectionBottom
} HBUITransitionDirection;

typedef enum
{
    HBUITransitionTypeDefault,
    HBUITransitionTypeCube,
    HBUITransitionTypeFade,
    HBUITransitionTypeFlip,
    HBUITransitionTypePush
} HBUITransitionType;

@interface UIView(Transition)
//@property (nonatomic, retain) HBUITransition *	transition;

- (void)transitionFade;
- (void)transitionFade:(HBUITransitionDirection)from;

- (void)transitionCube;
- (void)transitionCube:(HBUITransitionDirection)from;

- (void)transitionPush;
- (void)transitionPush:(HBUITransitionDirection)from;

- (void)transitionFlip;
- (void)transitionFlip:(HBUITransitionDirection)from;
@end
