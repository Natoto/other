//
//  ImageCollectionCell.m
//  samurai-peng
//
//  Created by zeno on 16/3/7.
//  Copyright © 2016年 peng. All rights reserved.
//

#import "BaseCollectionViewCell.h"
#import "UIImageView+HBWebCache.h"
@implementation BaseCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setcellProfile:(NSString *)profile
{
    if (profile && [profile hasPrefix:@"http"]) {
        [self.imageView hb_setImageWithURL:[NSURL URLWithString:profile]];
    }
    else
    {
        self.imageView.image = [UIImage imageNamed:profile];
    }
}

-(UIImageView *)imageView
{
    if (!_imageView) {
        UIImageView * imgview = [UIImageView new];
        imgview.autoresizingMask = UIViewAutoresizingFlexibleWidth|
        UIViewAutoresizingFlexibleHeight;
        imgview.contentMode = UIViewContentModeScaleAspectFill;
        imgview.clipsToBounds = YES;
        [self.contentView addSubview:imgview];
        imgview.frame = self.contentView.bounds;
        _imageView = imgview;
    }
    return _imageView;
}
@end
