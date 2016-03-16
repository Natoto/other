//
//  TextFieldCell.h
//  hjb
//
//  Created by zeno on 16/3/16.
//  Copyright © 2016年 peng. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "EditCellProtocol.h"
@interface TextFieldCell : BaseTableViewCell

@property(nonatomic,retain) UIButton * AcessoryButton;
@property(nonatomic,strong) UITextField * txt_content;
@end
