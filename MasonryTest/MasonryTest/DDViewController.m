//
//  DDViewController.m
//  MasonryTest
//
//  Created by xuzifu on 15/12/11.
//  Copyright © 2015年 cai. All rights reserved.
//

#import "DDViewController.h"
#import "Masonry.h"

@interface DDViewController ()

@end

@implementation DDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"DD";
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self test];
    
}

- (void)test
{
    __weak typeof(self) weakSelf = self;
    
    UIView *myView = [[UIView alloc] init];
    myView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:myView];
    
    [myView mas_makeConstraints:^(MASConstraintMaker *make) {
        // 设置当前center和父视图的center一样
        make.center.mas_equalTo(weakSelf.view);
        // 设置当前视图的大小
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor redColor];
    [myView addSubview:view1];
    
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor yellowColor];
    [myView addSubview:view2];
    
    UIView *view3 = [[UIView alloc] init];
    view3.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view3];
    
    
    int padding = 10;
    
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        // 设置中心点
        make.centerY.mas_equalTo(myView);
        // 设置左侧距离父视图10
        make.left.equalTo(myView).with.offset(padding);
        // 设置右侧距离和view2的左侧相隔10
        make.right.equalTo(view2.mas_left).with.offset(-padding);
        // 设置高度
        make.height.mas_equalTo(@150);
        // 宽度设置和view2以及view3相同
        make.width.equalTo(@[view2, view3]);
    }];
    
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(myView);
        make.height.mas_equalTo(view1);
        make.width.equalTo(@[view1, view3]);
    }];
    
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(myView);
        make.left.equalTo(view2.mas_right).with.offset(padding);
        make.right.equalTo(myView).with.offset(-padding);
        make.height.mas_equalTo(view1);
        make.width.equalTo(@[view2, view1]);
    }];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
