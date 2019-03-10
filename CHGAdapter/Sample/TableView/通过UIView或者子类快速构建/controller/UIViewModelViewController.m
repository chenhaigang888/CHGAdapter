//
//  UIViewModelViewController.m
//  CHGAdapter
//
//  Created by 陈 海刚 on 2019/3/10.
//  Copyright © 2019 chen haiGang. All rights reserved.
//

#import "UIViewModelViewController.h"
#import "CHGAdapter.h"


@interface UIViewModelViewController ()

@property(nonatomic, strong)  UITableView * tableView;

#pragma - mark cellData
@property(nonatomic, strong) UIView * view1;
@property(nonatomic, strong) UIButton * btn;
@property(nonatomic, strong) UITextField * textField;

#pragma - mark headerData
@property(nonatomic, strong) UILabel * headerTitle;
@property(nonatomic, strong) UITextView * footerDesc;


@end

@implementation UIViewModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.tableView];
    
    self.tableView.headerDatas = @[self.headerTitle];
    self.tableView.cellDatas = @[
                                 @[
                                    self.view1,
                                    self.btn,
                                    self.textField
                                    ]
                                 ];
    self.tableView.footerDatas = @[self.footerDesc];
}

- (UILabel *)headerTitle {
    if (!_headerTitle) {
        _headerTitle = [UILabel new];
        _headerTitle.text = @"标题";
        _headerTitle.chg_tableViewHeaderHeight = 50;
        _headerTitle.frame = CGRectMake(5, 5, self.view.frame.size.width - 10, 30);
    }
    return _headerTitle;
}

- (UITextView *)footerDesc {
    if (!_footerDesc) {
        _footerDesc = [UITextView new];
        _footerDesc.chg_tableViewFooterHeight = 200;
        _footerDesc.frame = CGRectMake(5, 5, self.view.frame.size.width - 10, 190);
        _footerDesc.text = @"footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容footer 内容";
    }
    return _footerDesc;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    }
    return _tableView;
}

- (UIView *)view1 {
    if (!_view1) {
        _view1 = [UIView new];
        _view1.frame = CGRectMake(5, 5, 100, 100);
        _view1.chg_tableViewCelllHeight = 110;
        _view1.backgroundColor = UIColor.redColor;
    }
    return _view1;
}

- (UIButton *)btn {
    if (!_btn) {
        _btn = [[UIButton alloc] init];
        _btn.frame = CGRectMake(5, 5, self.view.frame.size.width - 10, 40);
        _btn.chg_tableViewCelllHeight = 50;
        [_btn setTitle:@"按钮" forState:UIControlStateNormal];
        [_btn setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
        [_btn addTarget:self action:@selector(btnTap:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}

- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(5, 5, self.view.frame.size.width- 10, 40)];
        _textField.chg_tableViewCelllHeight = 50;
        _textField.placeholder = @"请输入文本";
    }
    return _textField;
}

-(void)btnTap:(id)sender {
    NSLog(@"按钮点击");
}

@end
