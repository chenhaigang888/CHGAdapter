//
//  UIViewModelCollectionViewController.m
//  CHGAdapter
//
//  Created by 陈 海刚 on 2019/3/10.
//  Copyright © 2019 chen haiGang. All rights reserved.
//

#import "UIViewModelCollectionViewController.h"
#import "CHGAdapter.h"

@interface UIViewModelCollectionViewController ()

@property(nonatomic, strong) UICollectionView * collectionView;
@property(nonatomic, strong) UIView * view1;
@property(nonatomic, strong) UISwitch * switchBtn;

@property(nonatomic, strong) UIView * headerView;
@property(nonatomic, strong) UIView * footerView;

@end

@implementation UIViewModelCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.collectionView];
    self.collectionView.headerDatas = @[self.headerView];
    self.collectionView.cellDatas = @[@[self.view1, self.switchBtn]];
    self.collectionView.footerDatas = @[self.footerView];
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout * layout = [UICollectionViewFlowLayout new];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:layout];
        _collectionView.backgroundColor = UIColor.redColor;
    }
    return _collectionView;
}

- (UIView *)view1 {
    if (!_view1) {
        _view1 = [UIView new];
        _view1.frame = CGRectMake(5, 5, 50, 50);
        _view1.chg_collectionViewCellSize = CGSizeMake(60, 60);
        _view1.backgroundColor = UIColor.yellowColor;
        
        _view1.chg_collectionViewHeaderSize = CGSizeMake(self.view.frame.size.width, 60);
        _view1.chg_collectionViewFooterSize = CGSizeMake(self.view.frame.size.width, 60);
    }
    return _view1;
}

- (UIView *)headerView {
    if (!_headerView) {
        _headerView = [UIView new];
        _headerView.frame = CGRectMake(5, 5, self.view.frame.size.width - 10, 50);
        _headerView.backgroundColor = UIColor.greenColor;
        _headerView.chg_collectionViewHeaderSize = CGSizeMake(self.view.frame.size.width, 60);
    }
    return _headerView;
}

- (UIView *)footerView {
    if (!_footerView) {
        _footerView = [UIView new];
        _footerView.frame = CGRectMake(5, 5, self.view.frame.size.width - 10, 50);
        _footerView.backgroundColor = UIColor.purpleColor;
        _footerView.chg_collectionViewFooterSize = CGSizeMake(self.view.frame.size.width, 60);
    }
    return _footerView;
}

- (UISwitch *)switchBtn {
    if (!_switchBtn) {
        _switchBtn = [[UISwitch alloc] initWithFrame:CGRectMake(5, 5, 50, 50)];
        _switchBtn.chg_collectionViewCellSize = CGSizeMake(60, 60);
        _switchBtn.backgroundColor = UIColor.whiteColor;
    }
    return _switchBtn;
}

@end
