//
//  SoloImageCell.m
//  PENG
//
//  Created by hb on 15/6/19.
//  Copyright (c) 2015年 pengpeng. All rights reserved.
//

#import "HBImageViewCell.h"
//#import "PENG_Define.h"
#import "UIViewAdditions.h"

@interface HBImageViewCell()
@property(nonatomic,assign) CGRect imageFrame;
//@property(nonatomic,retain) UIImageView * imageView;
@end
@implementation HBImageViewCell
NO_DEFAULT_TITLE
NO_DEFAULT_PLACEHOLDER

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        self.imageView.clipsToBounds = YES;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageviewTap:)];
        self.imageView.userInteractionEnabled = YES;
        [self.imageView addGestureRecognizer:tap];
    }
    return self;
}

-(IBAction)imageviewTap:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(PENGView:subView:TapWithTag:)]) {
        [self.delegate PENGView:self subView:self.imageView TapWithTag:0];
    }
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.size = [self imageViewSize];
    self.imageView.backgroundColor = [UIColor grayColor];
    self.imageView.center = CGPointMake(self.frame.size.width/2 , self.frame.size.height/2);
//    self SETALI alignmentRectInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    if ([self respondsToSelector:@selector(layoutMargins)]) {
        self.layoutMargins = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    if ([self respondsToSelector:@selector(separatorInset)]) {
        self.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    if (self.CornerRadius) {
//        KT_CORNER_PROFILE(self.imageView);
        self.imageView.layer.masksToBounds = YES;\
        [self.imageView.layer setCornerRadius:CGRectGetHeight([self.imageView bounds]) / 2];\
        self.imageView.layer.borderWidth = 0;\
        self.imageView.layer.borderColor = [[UIColor whiteColor] CGColor];
    }
}

-(void)setcellimageCornerRadius:(BOOL)CornerRadius
{
    self.CornerRadius = CornerRadius;
}
-(CGSize)imageViewSize
{
    NSValue * value = [self.dictionary objectForKey:key_soloImageView_size];
    if (value) {
        return value.CGSizeValue;
    }
    return CGSizeMake(80, 80);
}

-(void)setDictionary:(NSMutableDictionary *)dictionary
{
    [super setDictionary:dictionary];
    if (dictionary) {
    }
}
-(void)setcellProfile:(NSString *)profile
{
    [super setcellProfile:profile];
}

-(void)setcellobject:(id)object
{
    [super setcellobject:object];
    if (object && [[object class ] isSubclassOfClass:[UIImage class]]) {
        UIImage * image = (UIImage *)object;
        self.imageView.image = image;
    }
}

@end
