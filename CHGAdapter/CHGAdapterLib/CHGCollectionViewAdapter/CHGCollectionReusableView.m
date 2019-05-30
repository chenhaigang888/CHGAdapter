//
//  CHGCollectionReusableView.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/15.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "CHGCollectionReusableView.h"
#import "CHGCollectionViewAdapter.h"

@implementation CHGCollectionReusableView


@synthesize eventTransmissionBlock = _eventTransmissionBlock;

@synthesize indexPath = _indexPath;

@synthesize kind = _kind;

@synthesize protocols = _protocols;

@synthesize model = _model;

@synthesize targetView = _targetView;

- (NSMutableArray *)protocols {
    if (!_protocols) {
        _protocols = [NSMutableArray array];
    }
    return _protocols;
}

- (void)setEventTransmissionBlock:(CHGEventTransmissionBlock)eventTransmissionBlock {
    _eventTransmissionBlock = eventTransmissionBlock;
    for (id protocol in self.protocols) {
        [protocol setEventTransmissionBlock:eventTransmissionBlock];
    }
}

/**
 获取当前Adapter的tag
 
 @return 返回tag
 */
-(NSInteger)adapterTag {
    return ((UICollectionView*)self.targetView).collectionViewAdapter.tag;
}

/**
 获取AdapterData中的customData
 
 @return 获取AdapterData中的customData
 */
-(id)customData {
    return ((UICollectionView*)self.targetView).collectionViewAdapter.adapterData.customData;
}

/**
 返回当前cell所在的controller
 
 @return 返回当前cell所在的controller
 */
-(UIViewController*)controller {
    return ((UICollectionView*)self.targetView).collectionViewAdapter.controller;
}


- (void)reusableViewForCollectionView:(nonnull UICollectionView *)collectionView indexPath:(nonnull NSIndexPath *)indexPath kind:(nonnull NSString *)kind reusableViewData:(nonnull id)reusableViewData {
    self.targetView = collectionView;
    self.indexPath = indexPath;
    self.kind = kind;
    self.model = reusableViewData;
    for (id protocol in self.protocols) {
        [protocol reusableViewForCollectionView:collectionView indexPath:indexPath kind:kind reusableViewData:reusableViewData];
    }
}

- (void)reusableViewWillAppear {
    for (id protocol in self.protocols) {
        [protocol reusableViewWillAppear];
    }
}

- (void)reusableViewDidDisappear {
    for (id protocol in self.protocols) {
        [protocol reusableViewDidDisappear];
    }
}

- (void)reusableViewWillReuseWithIdentifier:(nonnull NSString *)identifier indexPath:(nonnull NSIndexPath *)indexPath {
    for (id protocol in self.protocols) {
        [protocol reusableViewWillReuseWithIdentifier:identifier indexPath:indexPath];
    }
}


@end



