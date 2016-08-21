//
//  ValueListViewController.h
//  单选
//
//  Created by yangbigbig on 16/8/21.
//  Copyright © 2016年 yangbigbig. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^IndexSelectedBlock) (NSInteger index);

@interface ValueListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

- (void)setTitle:(NSString *)title valueList:(NSArray *)list defaultSelectIndex:(NSInteger)index selectBlock:(IndexSelectedBlock)selectBlock;


@end
