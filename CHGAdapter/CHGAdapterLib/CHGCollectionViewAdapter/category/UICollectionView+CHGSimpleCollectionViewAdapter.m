//
//  UICollectionView+CHGSimpleCollectionViewAdapter.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/8/17.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "UICollectionView+CHGSimpleCollectionViewAdapter.h"
#import "CHGCollectionViewAdapterData.h"
#import "UICollectionView+CHGCollectionViewAdapter.h"
#import "CHGCollectionViewAdapter.h"
#import <objc/runtime.h>

@implementation UICollectionView (CHGSimpleCollectionViewAdapter)

+ (void)load {
    Method fromeInitModelMethod = class_getInstanceMethod([self class], @selector(collectionViewAdapter));
    Method toInitModelMethod = class_getInstanceMethod([self class], @selector(swizzlingCollectionViewAdapter));
    if (!class_addMethod([self class], @selector(swizzlingCollectionViewAdapter), method_getImplementation(toInitModelMethod), method_getTypeEncoding(toInitModelMethod))) {
        method_exchangeImplementations(fromeInitModelMethod, toInitModelMethod);
    }
}

- (CHGCollectionViewAdapter *)swizzlingCollectionViewAdapter {
    CHGCollectionViewAdapter * adapter = [self swizzlingCollectionViewAdapter];
    if (!adapter) {
        self.collectionViewAdapter = [CHGSimpleCollectionViewAdapter new];
        return [self swizzlingCollectionViewAdapter];
    }
    return adapter;
}

-(void)setAdapterData:(CHGCollectionViewAdapterData *)adapterData {
    self.collectionViewAdapter.adapterData = adapterData;
}

-(CHGCollectionViewAdapterData*)adapterData {
    return self.collectionViewAdapter.adapterData;
}

- (NSArray *)cellDatas {
    return self.adapterData.cellDatas;
}

- (void)setCellDatas:(NSArray *)cellDatas {
    self.adapterData.cellDatas = cellDatas;
}

- (NSArray *)headerDatas {
    return self.adapterData.headerDatas;
}

- (void)setHeaderDatas:(NSArray *)headerDatas {
    self.adapterData.headerDatas = headerDatas;
}

- (NSArray *)footerDatas {
    return self.adapterData.footerDatas;
}

- (void)setFooterDatas:(NSArray *)footerDatas {
    self.adapterData.footerDatas = footerDatas;
}

- (id)customData {
    return self.adapterData.customData;
}

- (void)setCustomData:(id)customData {
    self.adapterData.customData = customData;
}

@end
