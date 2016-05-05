//
//  TestViewController.m
//  MasonryTest
//
//  Created by xuzifu on 15/12/11.
//  Copyright © 2015年 cai. All rights reserved.
//

#import "TestViewController.h"
#import "Masonry.h"

@interface TestViewController ()

@property (nonatomic, strong) UIView *centerView;
@property (nonatomic, strong) UIView *edgesView;
@property (nonatomic, strong) UIView *view1;
@property (nonatomic, strong) UIView *view2;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"test";
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self testMasonry];
    
}

- (void)testMasonry
{
    //防止循环引用
    __weak typeof(self) weakSelf = self;
    
    //添加约束前必须要把view添加到视图上
    //视图的先后  是依据添加到父视图上的先后顺序而定的
    self.edgesView = UIView.new;
    self.edgesView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.edgesView];
    
    self.centerView = UIView.new;
    self.centerView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.centerView];
    
    self.view1 = UIView.new;
    self.view1.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.view1];
    
    self.view2 = UIView.new;
    self.view2.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.view2];
    
    
    
    
    
    //居中一个view
    [self.centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf.view);
        make.size.mas_equalTo(CGSizeMake(200, 200));
    }];
    
    //基于父视图 间距为10
//    [self.edgesView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.mas_equalTo(weakSelf.view);
//        make.edges.mas_equalTo(UIEdgeInsetsMake(100, 100, 100, 100));
//    }];
    
    //或者
//    [self.edgesView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.leading.mas_equalTo(100);
//        make.bottom.trailing.mas_equalTo(-100);
//    }];
    
    //或者
    [self.edgesView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view).with.offset(100);
        make.left.equalTo(weakSelf.view).with.offset(100);
        make.bottom.equalTo(weakSelf.view).with.offset(-100);
        make.right.equalTo(weakSelf.view).with.offset(-100);
    }];
    
    //多个view
    //2个view横向居中，第二个view距离第一个view间距为10
    [self.view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.view);
        make.size.mas_equalTo(CGSizeMake(100, 100));
        make.top.equalTo(weakSelf.view).offset(120);
//        make.top.width.offset(90);
    }];
    
    [self.view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view1);
        make.size.mas_equalTo(self.view1);
//        make.bottom.equalTo(self.view1).offset(110);
//        make.top.equalTo(self.view1).offset(110);
        make.top.equalTo(self.view1.mas_bottom).offset(10);
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
