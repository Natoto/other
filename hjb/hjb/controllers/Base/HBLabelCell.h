//
//  HBLabelCell.h
//  hjb
//
//  Created by zeno on 16/3/17.
//  Copyright © 2016年 peng. All rights reserved.
//

#import "BaseTableViewCell.h"

typedef void(^HBLabelCellTextAction)(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect);

@class YYLabel;
@interface HBLabelCell : BaseTableViewCell
@property(nonatomic,  strong) YYLabel * label ;
//@property (nonatomic, copy)   HBLabelCellTextAction highlightLabelTapAction;
@end
