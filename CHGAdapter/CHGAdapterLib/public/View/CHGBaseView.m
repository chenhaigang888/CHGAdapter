//
//  CHGBaseView.m
//  CHGAdapter
//
//  Created by DNAER5 on 2019/5/25.
//  Copyright © 2019 chen haiGang. All rights reserved.
//

#import "CHGBaseView.h"
#import "CHGViewMappingObject.h"


@implementation CHGBaseView

#pragma -mark CHGViewPropertyProtocol propertys and method

@synthesize eventTransmissionBlock = _eventTransmissionBlock;

@synthesize indexPath = _indexPath;

@synthesize model = _model;

@synthesize protocolsVMO = _protocolsVMO;

@synthesize targetView = _targetView;

#pragma - mark CHGViewLifeCycleProtocol method
- (NSMutableArray<CHGViewMappingObject*> *)protocolsVMO {
    if (!_protocolsVMO) {
        _protocolsVMO = [NSMutableArray<CHGViewMappingObject *> array];
    }
    return _protocolsVMO;
}

/**
 cell将要显示
 */
-(void)cellWillAppear {
    for (CHGViewMappingObject * vmo in self.protocolsVMO) {
        [((id<CHGViewLifeCycleProtocol>)vmo.view) cellWillAppear];
    }
}

/**
 cell已经消失
 */
-(void)cellDidDisappear {
    for (CHGViewMappingObject * vmo in self.protocolsVMO) {
        [((id<CHGViewLifeCycleProtocol>)vmo.view) cellDidDisappear];
    }
}

- (void)cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath targetView:(nonnull UIView *)targetView model:(nonnull id)model eventTransmissionBlock:(nonnull CHGEventTransmissionBlock)eventTransmissionBlock{
    self.indexPath = indexPath;
    self.targetView = targetView;
    self.model = model;
    
    for (CHGViewMappingObject * vmo in self.protocolsVMO) {
        NSDictionary * mapping = vmo.mapping;
        if (mapping) {
            NSString * key = mapping[@(CHGAdapterViewTypeCellType)];
            if (key.length > 0) {
                id subModel = [model objectForKey:key];
                
                [((id<CHGViewLifeCycleProtocol>)vmo.view) cellForRowAtIndexPath:indexPath targetView:targetView model:subModel eventTransmissionBlock:eventTransmissionBlock];
            } else {
                [((id<CHGViewLifeCycleProtocol>)vmo.view) cellForRowAtIndexPath:indexPath targetView:targetView model:model eventTransmissionBlock:eventTransmissionBlock];
            }
        } else {
            [((id<CHGViewLifeCycleProtocol>)vmo.view) cellForRowAtIndexPath:indexPath targetView:targetView model:model eventTransmissionBlock:eventTransmissionBlock];
        }
    }
}

- (void)cellWillReuseWithIdentifier:(nonnull NSString *)identifier {
    for (CHGViewMappingObject * vmo in self.protocolsVMO) {
        [((id<CHGViewLifeCycleProtocol>)vmo.view) cellWillReuseWithIdentifier:identifier];
    }
}


- (void)cellWillReuseWithIdentifier:(nonnull NSString *)identifier indexPath:(nonnull NSIndexPath *)indexPath {
    for (CHGViewMappingObject * vmo in self.protocolsVMO) {
        [((id<CHGViewLifeCycleProtocol>)vmo.view) cellWillReuseWithIdentifier:identifier indexPath:indexPath];
    }
}

#pragma -mark CHGTableViewHeaderFooterLifeCycleProtocol method

@synthesize section = _section;

@synthesize type = _type;

- (void)headerFooterForSection:(NSInteger)section inTableView:(nonnull UITableView *)tableView model:(nonnull id)model type:(CHGAdapterViewType)type eventTransmissionBlock:(nonnull CHGEventTransmissionBlock)eventTransmissionBlock{
    self.section = section;
    self.targetView = tableView;
    self.model = model;
    self.type = type;
    
    for (CHGViewMappingObject * vmo in self.protocolsVMO) {
        NSDictionary * mapping = vmo.mapping;
        if (mapping) {
            NSString * key = mapping[@(type)];
            if (key.length > 0) {
                id subModel = [model objectForKey:key];
                [((id<CHGTableViewHeaderFooterLifeCycleProtocol>)vmo.view) headerFooterForSection:section inTableView:tableView model:subModel type:type eventTransmissionBlock:eventTransmissionBlock];
            } else {
                [((id<CHGTableViewHeaderFooterLifeCycleProtocol>)vmo.view) headerFooterForSection:section inTableView:tableView model:model type:type eventTransmissionBlock:eventTransmissionBlock];
            }
        } else {
            [((id<CHGTableViewHeaderFooterLifeCycleProtocol>)vmo.view) headerFooterForSection:section inTableView:tableView model:model type:type eventTransmissionBlock:eventTransmissionBlock];
        }
    }
}

- (void)headerFooterViewDidDisAppearWithType:(CHGAdapterViewType)type {
    for (CHGViewMappingObject * vmo in self.protocolsVMO) {
        [((id<CHGTableViewHeaderFooterLifeCycleProtocol>)vmo.view) headerFooterViewDidDisAppearWithType:type];
    }
}

- (void)headerFooterViewWillAppearWithType:(CHGAdapterViewType)type {
    for (CHGViewMappingObject * vmo in self.protocolsVMO) {
        [((id<CHGTableViewHeaderFooterLifeCycleProtocol>)vmo.view) headerFooterViewWillAppearWithType:type];
    }
}

- (void)headerFooterViewWillReuseWithIdentifier:(nonnull NSString *)identifier {
    for (CHGViewMappingObject * vmo in self.protocolsVMO) {
        [((id<CHGTableViewHeaderFooterLifeCycleProtocol>)vmo.view) headerFooterViewWillReuseWithIdentifier:identifier];
    }
}


#pragma -mark CHGCollectionReusableViewLifeCycleProtocol method

@synthesize kind = _kind;

- (void)reusableViewForCollectionView:(nonnull UICollectionView *)collectionView indexPath:(nonnull NSIndexPath *)indexPath kind:(nonnull NSString *)kind model:(nonnull id)model eventTransmissionBlock:(nonnull CHGEventTransmissionBlock)eventTransmissionBlock{
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
            } else {
                [((id<CHGCollectionReusableViewLifeCycleProtocol>)vmo.view) reusableViewForCollectionView:collectionView indexPath:indexPath kind:kind model:model eventTransmissionBlock:eventTransmissionBlock];
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





