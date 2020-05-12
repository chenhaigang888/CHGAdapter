//
//  CHGCollectionReusableView.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/15.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "CHGCollectionReusableView.h"
#import "CHGCollectionViewAdapter.h"
#import "CHGViewMappingObject.h"

@implementation CHGCollectionReusableView


@synthesize eventTransmissionBlock = _eventTransmissionBlock;

@synthesize indexPath = _indexPath;

@synthesize kind = _kind;

@synthesize protocolsVMO = _protocolsVMO;

@synthesize model = _model;

@synthesize targetView = _targetView;

- (NSMutableArray<CHGViewMappingObject *> *)protocolsVMO {
    if (!_protocolsVMO) {
        _protocolsVMO = [NSMutableArray<CHGViewMappingObject *> array];
    }
    return _protocolsVMO;
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



- (void)reusableViewForCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath kind:(NSString *)kind model:(id)model eventTransmissionBlock:(CHGEventTransmissionBlock)eventTransmissionBlock{
    self.targetView = collectionView;
    self.indexPath = indexPath;
    self.kind = kind;
    self.model = model;
    self.eventTransmissionBlock = eventTransmissionBlock;
    CHGAdapterViewType type = [kind isEqualToString:@"UICollectionElementKindSectionHeader"] ? CHGAdapterViewTypeHeaderType : CHGAdapterViewTypeFooterType;
    
    for (CHGViewMappingObject * vmo in self.protocolsVMO) {
        NSDictionary * mapping = vmo.mapping;
        if (mapping) {
            NSString * key = mapping[@(type)];
            if (key.length > 0) {
                id subModel = [model objectForKey:key];
                [((id<CHGCollectionReusableViewLifeCycleProtocol>)vmo.view) reusableViewForCollectionView:collectionView indexPath:indexPath kind:kind model:subModel eventTransmissionBlock:eventTransmissionBlock];
            }
        } else {
            [((id<CHGCollectionReusableViewLifeCycleProtocol>)vmo.view) reusableViewForCollectionView:collectionView indexPath:indexPath kind:kind model:model eventTransmissionBlock:eventTransmissionBlock];
        }
    }
}

- (void)reusableViewDidDisappear {
    for (CHGViewMappingObject * vmo in self.protocolsVMO) {
        [((id<CHGCollectionReusableViewLifeCycleProtocol>)vmo.view) reusableViewDidDisappear];
    }
}

- (void)reusableViewWillAppear {
    for (CHGViewMappingObject * vmo in self.protocolsVMO) {
        [((id<CHGCollectionReusableViewLifeCycleProtocol>)vmo.view) reusableViewWillAppear];
    }
}

- (void)reusableViewWillReuseWithIdentifier:(nonnull NSString *)identifier indexPath:(nonnull NSIndexPath *)indexPath {
    for (CHGViewMappingObject * vmo in self.protocolsVMO) {
        [((id<CHGCollectionReusableViewLifeCycleProtocol>)vmo.view) reusableViewWillReuseWithIdentifier:identifier indexPath:indexPath];
    }
}


@end



