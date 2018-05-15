//
//  CollectionViewViewController.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/15.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "CollectionViewViewController.h"
#import "TestCollectionAdapter.h"

@interface CollectionViewViewController ()

@property(nonatomic,weak) IBOutlet UICollectionView * collectionView;
@property(nonatomic,strong) TestCollectionAdapter * adapter;
@property(nonatomic,strong) CHGCollectionViewAdapterData * adapterData;

@end

@implementation CollectionViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout * layout = [UICollectionViewFlowLayout new];
    layout.itemSize = CGSizeMake(100, 100);
    layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 30);
    layout.footerReferenceSize = CGSizeMake(self.view.frame.size.width, 30);
    self.collectionView.collectionViewLayout = layout;
    self.adapter.adapterData = self.adapterData;
    self.collectionView.collectionViewAdapter = self.adapter;
    [self.collectionView setEmptyDataShowWithTitle:@"没有任何数据" image:@"icon_dl_xsmm"];
    self.collectionView.eventTransmissionBlock = ^id(id target, id params, NSInteger tag, CHGCallBack callBack) {
        NSLog(@"paramsjjj:%@",params);
        return nil;
    };

    self.collectionView.collectionViewDidSelectItemAtIndexPathBlock = ^(UICollectionView *collectionView, NSIndexPath *indexPath, id itemData) {
        NSLog(@"itemData:%@",itemData);
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(TestCollectionAdapter*)adapter {
    if (!_adapter) {
        _adapter = [TestCollectionAdapter new];
        _adapter.cellName = @"Sample1CollectionViewCell";
        _adapter.sectionHeaderName = @"SampleHeaderCollectionReusableView";
        _adapter.sectionFooterName = @"SampleHeaderCollectionReusableView";
    }
    return _adapter;
}

-(CHGCollectionViewAdapterData*)adapterData {
    if (!_adapterData) {
        _adapterData = [CHGCollectionViewAdapterData new];
    }
    _adapterData.cellDatas =
    @[
      @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"],
      @[@"1",@"2",@"3"],
      @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"],
      @[@"1",@"2",@"3"]
      ];
    _adapterData.headerDatas = @[@"h1",@"h2"];
//    _adapterData.footerDatas = @[@"f1",@"f2",@"f3",@"f4"];
    return _adapterData;
}


@end
