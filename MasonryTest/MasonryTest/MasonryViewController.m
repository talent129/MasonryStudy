//
//  MasonryViewController.m
//  MasonryTest
//
//  Created by xuzifu on 15/12/10.
//  Copyright © 2015年 cai. All rights reserved.
//

/**
 *  masonry
 *  链接：
 *  http://www.cocoachina.com/ios/20141219/10702.html
 */
/**
 *  equalTo 和 mas_equalTo的区别在哪里呢? 其实 mas_equalTo是一个MACRO,比较的是值，equalTo比较的是view
    MACRO: 宏？！
 */
#import "MasonryViewController.h"
#import "Masonry.h"
#import "TestViewController.h"
#import "DemoViewController.h"
#import "DDViewController.h"

@interface MasonryViewController ()

@property (nonatomic, strong) UIView *leftTopView;
@property (nonatomic, strong) UIView *leftBottomView;
@property (nonatomic, strong) UIView *rightTopView;
@property (nonatomic, strong) UIView *rightBottomView;
@property (nonatomic, strong) UIView *leftView;
@property (nonatomic, strong) UIView *rightView;
@property (nonatomic, strong) UIView *edgesView;

@property (nonatomic, strong) UIButton *pushButton;
@property (nonatomic, strong) UIButton *pushBtn;

@end

@implementation MasonryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor purpleColor];
    
    self.title = @"masonry";
    
//    self.navigationController.navigationBar.translucent = NO;
    
//    self.navigationController.automaticallyAdjustsScrollViewInsets = NO;
    
    [self masonryTest];
    
    
}


- (void)masonryTest
{
    //防止block中循环引用
    __weak typeof(self) weakSelf = self;
    
    //必须先将view添加到父视图上，否则报错
    self.leftTopView = UIView.new;
    self.leftTopView.backgroundColor = [UIColor redColor];
    self.leftBottomView = UIView.new;
    self.leftBottomView.backgroundColor = [UIColor orangeColor];
    self.rightTopView = UIView.new;
    self.rightTopView.backgroundColor = [UIColor yellowColor];
    self.rightBottomView = UIView.new;
    self.rightBottomView.backgroundColor = [UIColor greenColor];
    self.leftView = [[UIView alloc] init];
    self.leftView.backgroundColor = [UIColor blueColor];
    self.rightView = UIView.new;
    self.rightView.backgroundColor = [UIColor cyanColor];
    
    self.edgesView = UIView.new;
    self.edgesView.backgroundColor = [UIColor magentaColor];
    [self.view addSubview:self.edgesView];
    
    [self.view addSubview:self.leftTopView];
    [self.view addSubview:self.leftBottomView];
    [self.view addSubview:self.rightTopView];
    [self.view addSubview:self.rightBottomView];
    [self.view addSubview:self.leftView];
    [self.view addSubview:self.rightView];
    
    //top、bottom、left、right使用equalTo
    //size、height、width、多个组合，使用mas_equalTo
    
    //左上角正方形
    [self.leftTopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view).offset(20);
        make.top.equalTo(weakSelf.view).offset(84);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    //左下角正方形
    [self.leftBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view).offset(20);
        make.bottom.equalTo(weakSelf.view).offset(-20);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    //右上角正方形
    [self.rightTopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.view).offset(-20);
        make.top.equalTo(weakSelf.view).offset(84);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    //右下角正方形
    [self.rightBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.view).offset(-20);
        make.bottom.equalTo(weakSelf.view).offset(-20);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    
//    //内边距
//    [self.edgesView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.insets(UIEdgeInsetsMake(100, 50, 100, 50));
//    }];
    
    //或者
    [self.edgesView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.top.mas_equalTo(100);
        make.trailing.bottom.mas_equalTo(-100);
    }];
    
    
    [self.leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(20);
        make.bottom.offset(-300);
        make.right.equalTo(self.rightView).offset(-210);
        make.height.mas_equalTo(100);
    }];
    
    [self.rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(weakSelf.view).offset(-60);
        make.bottom.offset(-300);
        make.size.mas_equalTo(CGSizeMake(200, 200));
    }];
    
    self.pushButton = UIButton.new;
    self.pushButton.backgroundColor = [UIColor greenColor];
    [self.pushButton setTitle:@"push" forState:UIControlStateNormal];
    self.pushButton.titleLabel.font = [UIFont systemFontOfSize:20];
    
    //这个方法不起作用
//    self.pushButton.titleLabel.textColor = [UIColor redColor];
    
    [self.pushButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    //设置圆角
    self.pushButton.layer.cornerRadius = 10;
    self.pushButton.layer.masksToBounds = YES;
    [self.view addSubview:self.pushButton];
    
    [self.pushButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.pushButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.edgesView).offset(-50);
        make.leading.equalTo(self.edgesView).offset(20);
        make.trailing.equalTo(self.edgesView).offset(-20);
        make.top.equalTo(self.rightView.mas_bottom).offset(100);
    }];
    
    
    self.pushBtn = UIButton.new;
    self.pushBtn.backgroundColor = [UIColor greenColor];
    [self.pushBtn setTitle:@"PUSH" forState:UIControlStateNormal];
    self.pushBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    
    //这个方法不起作用
    //    self.pushButton.titleLabel.textColor = [UIColor redColor];
    
    [self.pushBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    //设置圆角
    self.pushBtn.layer.cornerRadius = 10;
    self.pushBtn.layer.masksToBounds = YES;
    [self.view addSubview:self.pushBtn];
    
    [self.pushBtn addTarget:self action:@selector(bTNClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.pushBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.edgesView).offset(-120);
        make.leading.equalTo(self.edgesView).offset(20);
        make.trailing.equalTo(self.edgesView).offset(-20);
        make.top.equalTo(self.rightView.mas_bottom).offset(20);
    }];
    
    
    UIButton *btn = [[UIButton alloc] init];
    btn.backgroundColor = [UIColor greenColor];
    [btn setTitle:@"push" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    btn.layer.cornerRadius = 10;
    btn.layer.masksToBounds = YES;
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(btnbtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view).offset(150);
        make.centerX.equalTo(weakSelf.view);
        make.size.mas_equalTo(CGSizeMake(100, 50));
    }];
    
    
    
    
    
}

- (void)btnbtnClick:(UIButton *)btn
{
    DDViewController *ddVC = [[DDViewController alloc] init];
    [self.navigationController pushViewController:ddVC animated:YES];
}

- (void)btnClick:(UIButton *)btn
{
    TestViewController *testVC = [[TestViewController alloc] init];
    [self.navigationController pushViewController:testVC animated:YES];
}

- (void)bTNClick:(UIButton *)btn
{
    DemoViewController *testVC = [[DemoViewController alloc] init];
    [self.navigationController pushViewController:testVC animated:YES];
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
