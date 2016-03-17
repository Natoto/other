//
//  BaseTableViewCell.h
//  PENG
//
//  Created by zeno on 15/12/14.
//  Copyright © 2015年 nonato. All rights reserved.
//

#import <HBKit/HBKit.h>
#import "PENGProtocol.h"
//#import "UIImage+LocalImage.h"

// NSValue * edgeinsetsValue
// [cellstruct.dictionary setObject:[NSValue valueWithUIEdgeInsets:UIEdgeInsetsMake(10, 0, 0, 10)] forKey:key_cellstruct_contentInsets];
static NSString * key_cellstruct_contentInsets = @"key_cellstruct_contentInsets";
static NSString * key_cellstruct_showleftlayer = @"key_cellstruct_showleftlayer";
static NSString * key_cellstruct_showrightlayer = @"key_cellstruct_showrightlayer";

static NSString * key_cellstruct_detailuicolor = @"key_cellstruct_detailuicolor";
static NSString * key_cellstruct_detailuifont = @"key_cellstruct_detailuifont";
static NSString * key_cellstruct_titleuicolor = @"key_cellstruct_titleuicolor";
static NSString * key_cellstruct_titleuifont = @"key_cellstruct_titleuifont";

@protocol BaseTableViewCellProtol 
-(UIButton *)hb_AcessoryButton:(BaseTableViewCell *)cell;
@end

@interface BaseTableViewCell : HBBaseTableViewCell<BaseTableViewCellProtol>
@property(nonatomic,strong) UIButton * AcessoryButton;
@end
