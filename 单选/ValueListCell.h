//
//  ValueListCell.h
//  单选
//
//  Created by yangbigbig on 16/8/21.
//  Copyright © 2016年 yangbigbig. All rights reserved.
//

#define kCellIdentifier_ValueList @"ValueListCell"
#import <UIKit/UIKit.h>

@interface ValueListCell : UITableViewCell

- (void)setTitleStr:(NSString *)title imageStr:(NSString *)imageName isSelected:(BOOL)selected;

@end
