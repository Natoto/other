//
//  RightUpDownLabelCell.h
//  hjb
//
//  Created by BooB on 16/3/17.
//  Copyright © 2016年 peng. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface LeftUpDownRightLabelCell : BaseTableViewCell

@property(nonatomic,strong) UILabel * lbl_rightup;
@property(nonatomic,strong) UILabel * lbl_leftup;
@property(nonatomic,strong) UILabel * lbl_leftdown;
@end


@interface LeftRightUpDownLabelCell : LeftUpDownRightLabelCell

//@property(nonatomic,strong) UILabel * lbl_rightup;
@property(nonatomic,strong) UILabel * lbl_rightdown;

//@property(nonatomic,strong) UILabel * lbl_leftup;
//@property(nonatomic,strong) UILabel * lbl_leftdown;
@end
