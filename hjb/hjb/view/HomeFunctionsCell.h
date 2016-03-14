//
//  HomeFunctionsCell.h
//  hjb
//
//  Created by zeno on 16/3/10.
//  Copyright © 2016年 peng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HBButton.h"
#import "BaseTableViewCell.h"
@class RACSubject;

static const NSString * key_cellstruct_imagenames = @"key_cellstruct_imagenames";
static const NSString * key_cellstruct_titles = @"key_cellstruct_titles";

@interface HomeFunctionsCell : BaseTableViewCell
@property (weak, nonatomic) IBOutlet HBButton *btn_1;
@property (weak, nonatomic) IBOutlet HBButton *btn_2;
@property (weak, nonatomic) IBOutlet HBButton *btn_3;
@property (weak, nonatomic) IBOutlet HBButton *btn_4;
@property (weak, nonatomic) IBOutlet HBButton *btn_5;
@property (weak, nonatomic) IBOutlet HBButton *btn_6;
@property (weak, nonatomic) IBOutlet HBButton *btn_7;
@property (weak, nonatomic) IBOutlet HBButton *btn_8;
@property (strong, nonatomic) RACSubject * delegateSignal;
@end
