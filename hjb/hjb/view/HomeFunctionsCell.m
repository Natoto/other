//
//  HomeFunctionsCell.m
//  hjb
//
//  Created by zeno on 16/3/10.
//  Copyright © 2016年 peng. All rights reserved.
//

#import "HomeFunctionsCell.h"
#import "UIViewAdditions.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
@implementation HomeFunctionsCell

- (void)awakeFromNib {
    // Initialization code    
    [self changehbbuttons:@[self.btn_1,self.btn_2,self.btn_3,self.btn_4,self.btn_5,self.btn_6,self.btn_7]];
}


-(void)changehbbuttons:(NSArray<HBButton *> *)buttons
{    
    [buttons enumerateObjectsUsingBlock:^(HBButton * _Nonnull button, NSUInteger idx, BOOL * _Nonnull stop) {
        [button addTarget:self action:@selector(HBButtonTap:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 0x11f + idx;
    }];
}

-(void)setcelldictionary:(NSMutableDictionary *)dictionary
{
    [super setcelldictionary:dictionary];
    NSArray * images = [dictionary objectForKey:key_cellstruct_imagenames];
    NSArray * titles = [dictionary objectForKey:key_cellstruct_titles];
    if (titles && images && titles.count == images.count) {
        [titles enumerateObjectsUsingBlock:^(NSString *  atitle, NSUInteger idx, BOOL * _Nonnull stop) {
            HBButton * button = [self.contentView viewWithTag: 0x11f + idx];
            if (button) {
                NSString * imgname =  images[idx];
                [button setImage:[UIImage imageNamed:imgname] andTitle:atitle];
            }
        }];
    }
    
    
}
-(IBAction)HBButtonTap:(HBButton *)sender
{
    NSInteger tag = sender.tag - 0x11f;
    if (self.delegateSignal) {
        [self.delegateSignal sendNext:@(tag)];
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(RACSubject *)delegateSignal
{
    if (!_delegateSignal) {
        _delegateSignal = [RACSubject subject];
    }
    return _delegateSignal;
}


@end
