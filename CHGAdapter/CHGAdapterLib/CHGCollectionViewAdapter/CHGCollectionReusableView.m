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


@synthesize eventTransmissionBlock;

@synthesize indexPath;

@synthesize kind;

@synthesize controller;

@synthesize protocols;

@synthesize model;

@synthesize targetView;

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

///**
// 将被复用
//
// @param identifier identifier
// @param indexPath indexPath
// */
//-(void)willReuseWithIdentifier:(NSString*)identifier indexPath:(NSIndexPath*)indexPath {
//
//}
//
//- (void)reusableViewForCollectionView:(nonnull UICollectionView *)collectionView indexPath:(nonnull NSIndexPath *)indexPath kind:(nonnull NSString *)kind reusableViewData:(nonnull id)reusableViewData {
//    self.collectionView = collectionView;
//    self.indexPath = indexPath;
//    self.kind = kind;
//    self.reusableViewData = reusableViewData;
//    for (id<CHGCollectionReusableViewLifeCycleProtocol> collectionReusableViewLifeCycleProtocol in self.collectionReusableViewLifeCycleProtocols) {
//        [collectionReusableViewLifeCycleProtocol reusableViewForCollectionView:collectionView indexPath:indexPath kind:kind reusableViewData:reusableViewData];
//    }
//}
//
//- (void)reusableViewWillAppear {
//    for (id<CHGCollectionReusableViewLifeCycleProtocol> collectionReusableViewLifeCycleProtocol in self.collectionReusableViewLifeCycleProtocols) {
//        [collectionReusableViewLifeCycleProtocol reusableViewWillAppear];
//    }
//}
//
//- (void)reusableViewDidDisappear {
//    for (id<CHGCollectionReusableViewLifeCycleProtocol> collectionReusableViewLifeCycleProtocol in self.collectionReusableViewLifeCycleProtocols) {
//        [collectionReusableViewLifeCycleProtocol reusableViewDidDisappear];
//    }
//}







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

- (void)willReuseWithIdentifier:(nonnull NSString *)identifier indexPath:(nonnull NSIndexPath *)indexPath {
    for (id protocol in self.protocols) {
        [protocol willReuseWithIdentifier:identifier indexPath:indexPath];
    }
}

@end



