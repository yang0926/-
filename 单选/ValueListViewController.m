//
//  ValueListViewController.m
//  单选
//
//  Created by yangbigbig on 16/8/21.
//  Copyright © 2016年 yangbigbig. All rights reserved.
//

#import "ValueListViewController.h"
#import "ValueListCell.h"
#define kScreen_Bounds [UIScreen mainScreen].bounds
#define kScreen_Height [UIScreen mainScreen].bounds.size.height
#define kScreen_Width [UIScreen mainScreen].bounds.size.width
@interface ValueListViewController ()
@property (copy, nonatomic) IndexSelectedBlock selectBlock;
@property (nonatomic, strong) UITableView * myTableView;
@property (nonatomic, strong) NSString * titleStr;
@property (nonatomic, strong) NSArray  * dataList;
@property (nonatomic, assign) NSInteger selectIndex;


@end

@implementation ValueListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.titleStr;
    
    //初始化tableview，尝试新的写法
    _myTableView = ({
        UITableView * tablewView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height) style:UITableViewStyleGrouped];
        tablewView.dataSource = self;
        tablewView.delegate = self;
        [tablewView registerClass:[ValueListCell class] forCellReuseIdentifier:kCellIdentifier_ValueList];
        tablewView.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.00];
        [self.view addSubview:tablewView];
        tablewView;
    });
    
}
- (void)setTitle:(NSString *)title valueList:(NSArray *)list defaultSelectIndex:(NSInteger)index selectBlock:(IndexSelectedBlock)selectBlock{
    self.titleStr = title;
    self.dataList = list;
    self.selectIndex = index;
    self.selectBlock = selectBlock;
}

#pragma mark ---UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ValueListCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier_ValueList forIndexPath:indexPath];
    NSInteger row = indexPath.row;
    [cell setTitleStr:[_dataList objectAtIndex:row] imageStr:nil isSelected:(_selectIndex == row)];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 30)];
    headerView.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.00];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSInteger value = indexPath.row;
    self.selectIndex = value;
    if (_selectBlock) {
        _selectBlock(self.selectIndex);
    }
    [self.myTableView reloadData];
}

@end
