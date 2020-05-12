//
//  CHGTableViewHeaderFooterView.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/10.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "CHGTableViewHeaderFooterView.h"
#import "CHGViewMappingObject.h"

@implementation CHGTableViewHeaderFooterView

@synthesize eventTransmissionBlock = _eventTransmissionBlock;

@synthesize section = _section;

@synthesize type = _type;

@synthesize model = _model;

@synthesize protocolsVMO = _protocolsVMO;

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
    return ((UITableView*)self.targetView).tableViewAdapter.tag;
}

/**
 获取AdapterData中的customData
 
 @return 获取AdapterData中的customData
 */
-(id)customData {
    return ((UITableView*)self.targetView).tableViewAdapter.adapterData.customData;
}

/**
 返回当前cell所在的controller

 @return 返回当前cell所在的controller
 */
-(UIViewController*)controller {
    return ((UITableView*)self.targetView).tableViewAdapter.controller;
}



- (void)headerFooterForSection:(NSInteger)section inTableView:(UITableView *)tableView model:(id)model type:(CHGAdapterViewType)type eventTransmissionBlock:(CHGEventTransmissionBlock)eventTransmissionBlock{
    self.section = section;
    self.targetView = tableView;
    self.model = model;
    self.type = type;
    self.eventTransmissionBlock = eventTransmissionBlock;
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

@end


