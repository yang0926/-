//
//  ViewController.m
//  单选
//
//  Created by yangbigbig on 16/8/21.
//  Copyright © 2016年 yangbigbig. All rights reserved.
//

#import "ViewController.h"
#import "ValueListViewController.h"
#define kTaskArr @[@"有空再看", @"正常处理", @"优先处理", @"十万火急"]


#define ESWeak(var, weakVar) __weak __typeof(&*var) weakVar = var
#define ESStrong_DoNotCheckNil(weakVar, _var) __typeof(&*weakVar) _var = weakVar
#define ESStrong(weakVar, _var) ESStrong_DoNotCheckNil(weakVar, _var); if (!_var) return;


@interface ViewController ()

@property (nonatomic, assign) NSInteger selelctIndex;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)choose:(id)sender {
    ValueListViewController *vc = [[ValueListViewController alloc] init];
    [vc setTitle:@"优先级" valueList:kTaskArr defaultSelectIndex:0 selectBlock:^(NSInteger index) {
        
        [_chooseBtn setTitle:kTaskArr[index] forState:UIControlStateNormal];
    }];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)ssjndj{
    
    
}
@end
