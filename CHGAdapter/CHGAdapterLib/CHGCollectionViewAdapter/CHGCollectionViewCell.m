//
//  CHGCollectionViewCell.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/15.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "CHGCollectionViewCell.h"
#import "CHGCollectionViewAdapter.h"
#import "CHGViewMappingObject.h"

@implementation CHGCollectionViewCell


@synthesize indexPath = _indexPath;

@synthesize targetView = _targetView;

@synthesize eventTransmissionBlock = _eventTransmissionBlock;

@synthesize model = _model;

@synthesize protocolsVMO = _protocolsVMO;

@synthesize kind = _kind;

@synthesize section = _section;

@synthesize type = _type;

- (NSMutableArray<CHGViewMappingObject *> *)protocolsVMO {
    if (!_protocolsVMO) {
        _protocolsVMO = [NSMutableArray<CHGViewMappingObject *> array];
    }
    return _protocolsVMO;
}

-(UICollectionView*)getCollectionView {
    return (UICollectionView*)self.targetView;
}

/**
 获取当前Adapter的tag
 
 @return 返回tag
 */
-(NSInteger)adapterTag {
    return [self getCollectionView].collectionViewAdapter.tag;
}

/**
 获取AdapterData中的customData
 
 @return 获取AdapterData中的customData
 */
-(id)customData {
    return [self getCollectionView].collectionViewAdapter.adapterData.customData;
}

/**
 返回当前cell所在的controller
 
 @return 返回当前cell所在的controller
 */
-(UIViewController*)controller {
    return [self getCollectionView].collectionViewAdapter.controller;
}

- (void)setLayout {
    
}


- (void)setUpSubviews {
    
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



- (void)cellForRowAtIndexPath:(NSIndexPath *)indexPath targetView:(UIView *)targetView model:(id)model eventTransmissionBlock:(CHGEventTransmissionBlock)eventTransmissionBlock{
    self.indexPath = indexPath;
    self.targetView = targetView;
    self.model = model;
    self.eventTransmissionBlock = eventTransmissionBlock;
    for (CHGViewMappingObject * vmo in self.protocolsVMO) {
        NSDictionary * mapping = vmo.mapping;
        if (mapping) {
            NSString * key = mapping[@(CHGAdapterViewTypeCellType)];
            if (key.length > 0) {
                id subModel = [model valueForKeyPath:key];
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



-(void)addAutoDistributionModelView:(id<CHGViewProtocol>)view mapping:(NSDictionary * _Nullable)mapping {
    [self.protocolsVMO addObject:[CHGViewMappingObject initWithView:view  mapping:mapping]];
}

-(void)replaceAtIndex:(NSUInteger)index autoDistributionModelView:(id<CHGViewProtocol>)view mapping:(NSDictionary * _Nullable)mapping {
    [self.protocolsVMO replaceObjectAtIndex:index withObject:[CHGViewMappingObject initWithView:view  mapping:mapping]];
}

- (void)removeAutoDistributionModelViewAtIndex:(NSUInteger)index {
    [self.protocolsVMO removeObjectAtIndex:index];
}

-(void)removeAutoDistributionModelView {
    [self.protocolsVMO removeAllObjects];
}
@end
