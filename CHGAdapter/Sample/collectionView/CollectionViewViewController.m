//
//  CollectionViewViewController.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/15.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "CollectionViewViewController.h"
#import "CHGCollectionViewAdapter.h"

@interface CollectionViewViewController ()

@property(nonatomic,weak) IBOutlet UICollectionView * collectionView;
@property(nonatomic,strong) CHGCollectionViewAdapter * adapter;
@property(nonatomic,strong) CHGCollectionViewAdapterData * adapterData;

@end

@implementation CollectionViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout * layout = [UICollectionViewFlowLayout new];
    layout.itemSize = CGSizeMake(100, 100);
    layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 30);
    self.collectionView.collectionViewLayout = layout;
    self.adapter.adapterData = self.adapterData;
    self.collectionView.collectionViewAdapter = self.adapter;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(CHGCollectionViewAdapter*)adapter {
    if (!_adapter) {
        _adapter = [CHGCollectionViewAdapter new];
        _adapter.cellName = @"SampleCollectionViewCell";
    }
    return _adapter;
}

-(CHGCollectionViewAdapterData*)adapterData {
    if (!_adapterData) {
        _adapterData = [CHGCollectionViewAdapterData new];
    }
    _adapterData.cellDatas = @[@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"],@[@"",@"",@""],@[@"",@"",@"",@"",@"",@"",@"",@""],@[@"",@"",@""]];
    return _adapterData;
}


@end
