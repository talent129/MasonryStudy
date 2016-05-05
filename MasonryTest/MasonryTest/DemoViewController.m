//
//  DemoViewController.m
//  MasonryTest
//
//  Created by xuzifu on 15/12/11.
//  Copyright © 2015年 cai. All rights reserved.
//

#import "DemoViewController.h"
#import "Masonry.h"

@interface DemoViewController ()//<UITextFieldDelegate>

@property (nonatomic, strong) UIButton *iconBtn;
@property (nonatomic, strong) UITextField *nameText;
@property (nonatomic, strong) UIView *tagView;

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupFrame];
    
}

- (void)setupFrame {
    
    __weak typeof(self) weakSelf = self;
    
    //上传头像
    UIButton *iconBtn = [[UIButton alloc]init];
    iconBtn.layer.cornerRadius = 50;
    iconBtn.layer.masksToBounds = YES;
    [iconBtn setBackgroundImage:[UIImage imageNamed:@"huantouxiang"] forState:UIControlStateNormal];
    [iconBtn addTarget:self action:@selector(iconButton:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:iconBtn];
    self.iconBtn = iconBtn;
    
    [self.iconBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(90, 90));
        make.centerX.equalTo(weakSelf.view);
        make.top.width.offset(90);
    }];
    
    //上传社区头像文字提醒
    UILabel *iconLabel = [[UILabel alloc]init];
    iconLabel.textColor = [UIColor grayColor];
    iconLabel.text = @"上传社团头像";
    iconLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:iconLabel];
    
    [iconLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(iconBtn);
        make.top.equalTo(iconBtn.mas_bottom).with.offset(20);
    }];
    
    //社团编辑图标
    UIImageView *editIcon = [[UIImageView alloc]init];
    editIcon.image = [UIImage imageNamed:@"bianxie"];
    [self.view addSubview:editIcon];
    
    [editIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(25, 20));
        make.left.equalTo(weakSelf.view).with.offset(10);
        make.top.equalTo(iconLabel.mas_bottom).with.offset(30);
    }];
    
    //社团名
    UITextField *nameText = [[UITextField alloc]init];
    nameText.placeholder = @"请填写社区名(社团名最多6个字)";
    [self.view addSubview:nameText];
    self.nameText = nameText;
    
    [nameText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@20);
        make.centerY.equalTo(editIcon);
        make.right.equalTo(weakSelf.view).with.offset(-10);
        make.left.equalTo(editIcon.mas_right).with.offset(5);
    }];
    
    //分割线
    UIImageView *xian = [[UIImageView alloc]init];
    xian.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:xian];
    
    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@1);
        make.left.equalTo(weakSelf.view).with.offset(10);
        make.right.equalTo(weakSelf.view).with.offset(-10);
        make.top.equalTo(editIcon.mas_bottom).with.offset(5);
    }];
    
    //选择标签
    UILabel *tagLabel = [[UILabel alloc]init];
    tagLabel.text = @"选择标签";
    tagLabel.textColor = [UIColor grayColor];
    tagLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:tagLabel];
    
    [tagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@20);
        make.width.mas_equalTo(@60);
        make.left.equalTo(weakSelf.view).with.offset(10);
        make.top.equalTo(xian).with.offset(35);
    }];
    
    //跳转标签选择
    UITextField *tagText = [[UITextField alloc]init];
    tagText.placeholder = @"美容颜";
    tagText.borderStyle=UITextBorderStyleRoundedRect;
//    tagText.delegate = self;
    [tagText addTarget:self action:@selector(textTag) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:tagText];
    
    [tagText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(tagLabel);
        make.right.equalTo(weakSelf.view).with.offset(-10);
        make.left.equalTo(tagLabel.mas_right).with.offset(5);
    }];
    
    //    //tagView
    //    self.tagView = ({
    //        SKTagView *view = [SKTagView new];
    //        view.backgroundColor = [UIColor clearColor];
    //        view.padding    = UIEdgeInsetsMake(0, 0, 0, 0);
    //        view.insets    = 15;
    //        view.lineSpace = 10;
    //        __weak SKTagView *weakView = view;
    //        view.didClickTagAtIndex = ^(NSUInteger index){
    //            //Remove tag
    //            [weakView removeTagAtIndex:index];
    //        };
    //        view;
    //    });
    self.tagView = UIView.new;
    self.tagView.backgroundColor = [UIColor brownColor];
    [self.view addSubview:self.tagView];
    [self.tagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view).with.offset(10);
        make.right.equalTo(weakSelf.view).with.offset(-10);
        make.top.equalTo(tagText.mas_bottom).with.offset(10);
    }];
    
    //label标识语
    UILabel *label = [[UILabel alloc]init];
    label.font = [UIFont systemFontOfSize:13];
    label.textColor = [UIColor redColor];
    label.text = @"PS:成员和视频越多得社团越容易被发现!";
    [self.view addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view).with.offset(10);
        make.right.equalTo(weakSelf.view).with.offset(-10);
        make.top.equalTo(self.tagView.mas_bottom).with.offset(20);
    }];
    
    UIButton *commitBtn = [[UIButton alloc]init];
    commitBtn.layer.cornerRadius = 5;
    commitBtn.layer.borderColor = [UIColor darkGrayColor].CGColor;
    commitBtn.layer.borderWidth = 1;
    [commitBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    commitBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [commitBtn setTitle:@"确认发布" forState:UIControlStateNormal];
    [commitBtn addTarget:self action:@selector(commitButton:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:commitBtn];
    
    [commitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@30);
        make.left.equalTo(weakSelf.view).with.offset(10);
        make.right.equalTo(weakSelf.view).with.offset(-10);
        make.top.equalTo(label.mas_bottom).with.offset(50);
    }];
}

- (void)iconButton:(UIButton *)btn
{
    NSLog(@"头像");
}

- (void)commitButton:(UIButton *)btn
{
    NSLog(@"确认发布");
}

- (void)textTag
{
    NSLog(@"textTag");
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
