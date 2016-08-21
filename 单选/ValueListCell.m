//
//  ValueListCell.m
//  单选
//
//  Created by yangbigbig on 16/8/21.
//  Copyright © 2016年 yangbigbig. All rights reserved.
//

#define kValueListCell_ImageWidth 21.0
#define kValueListCell_CheckMarkWidth 22.0
#define kValueListCell_LeftPading 20.0
#define kScreen_Bounds [UIScreen mainScreen].bounds
#define kScreen_Height [UIScreen mainScreen].bounds.size.height
#define kScreen_Width [UIScreen mainScreen].bounds.size.width
#import "UIView+Frame.h"
#import "ValueListCell.h"

@interface ValueListCell ()

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIImageView *leftIconView, *checkMarkView;

@end

@implementation ValueListCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
   
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        if (!_titleLabel) {
            _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(kValueListCell_LeftPading, 7, (kScreen_Width - 120), 30)];
            _titleLabel.backgroundColor = [UIColor clearColor];
            _titleLabel.font = [UIFont systemFontOfSize:16];
            _titleLabel.textColor = [UIColor blackColor];
            [self.contentView addSubview:_titleLabel];
        }
    }
    return self;
}

- (void)setTitleStr:(NSString *)title imageStr:(NSString *)imageName isSelected:(BOOL)selected{
    
    if (imageName) {
        if (!_leftIconView) {
            _leftIconView = [[UIImageView alloc] initWithFrame:CGRectMake(kValueListCell_LeftPading, (44-kValueListCell_ImageWidth)/2, kValueListCell_ImageWidth, kValueListCell_ImageWidth)];
            [self.contentView addSubview:_leftIconView];
        }
        _leftIconView.image = [UIImage imageNamed:imageName];
        [_titleLabel setX:kValueListCell_LeftPading +40];
        _leftIconView.hidden = NO;
    }else{
        [_titleLabel setX:kValueListCell_LeftPading];
        _leftIconView.hidden = YES;
    }
    
    if (selected) {
        if (!_checkMarkView) {
            _checkMarkView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreen_Width-15 -kValueListCell_CheckMarkWidth, (44-kValueListCell_CheckMarkWidth)/2, kValueListCell_CheckMarkWidth, kValueListCell_CheckMarkWidth)];
            [self.contentView addSubview:_checkMarkView];
            _checkMarkView.image = [UIImage imageNamed:@"cell_checkmark"];
        }
        _checkMarkView.hidden = NO;
    }else{
        _checkMarkView.hidden = YES;
    }
    _titleLabel.text = title;
}




@end
