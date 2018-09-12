//
//  CollectionViewViewController.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/15.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "CollectionViewViewController.h"
#import "TestCollectionAdapter.h"
#import "SampleLayout.h"


@interface CollectionViewViewController ()

@property(nonatomic,weak) IBOutlet UICollectionView * collectionView;
@property(nonatomic,strong) TestCollectionAdapter * adapter;
@property(nonatomic,strong) CHGCollectionViewAdapterData * adapterData;

@end

@implementation CollectionViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置layout
    UICollectionViewFlowLayout * layout = [UICollectionViewFlowLayout new];
    layout.itemSize = CGSizeMake(100, 100);
    layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 30);
    layout.footerReferenceSize = CGSizeMake(self.view.frame.size.width, 30);
    self.collectionView.collectionViewLayout = layout;
    
    //设置adapter
    self.adapter.adapterData = self.adapterData;
    self.collectionView.collectionViewAdapter = self.adapter;
    
    //没有数据的展示
    [self.collectionView setEmptyDataShowWithTitle:@"没有任何数据" image:@"icon_dl_xsmm"];
    self.collectionView.collectionViewEmptyDataShow.emptyDataDidTapViewBlock = ^(UIScrollView *scrollView, UIView *view) {
        
    };
    
    //cell、headerFooterView 中按钮、输入、滑动删除等事件传输block
    self.collectionView.eventTransmissionBlock = ^id(id target, id params, NSInteger tag, CHGCallBack callBack) {
        NSLog(@"paramsjjj:%@",params);
        return nil;
    };

    //item 被点击
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
        _adapter.keyPathOfSubData = @"test";//当需要使用item的某一个字段作为数组的时候使用
    }
    return _adapter;
}

-(CHGCollectionViewAdapterData*)adapterData {
    
    if (!_adapterData) {
        _adapterData = [CHGCollectionViewAdapterData new];
    }
    _adapterData.customData = [NSMutableDictionary dictionary];
    _adapterData.cellDatas =
    // data type 1
    @[
      @{@"test":@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"]},
      @{@"test":@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"]}
      ];
    
// data type 2
//    @[
//      @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"]
//      @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"]
//      ];
    
// data type 3
//        @[
//          @"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"
//          ];
    _adapterData.headerDatas = @[@"h1",@"h2"];
    _adapterData.footerDatas = @[@"f1",@"f2",@"f3",@"f4"];
    return _adapterData;
}

@end
