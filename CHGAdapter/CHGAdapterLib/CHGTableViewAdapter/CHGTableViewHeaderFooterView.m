//
//  CHGTableViewHeaderFooterView.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/10.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "CHGTableViewHeaderFooterView.h"

@implementation CHGTableViewHeaderFooterView

@synthesize eventTransmissionBlock = _eventTransmissionBlock;

@synthesize section = _section;

@synthesize type = _type;

@synthesize model = _model;

@synthesize protocols = _protocols;

@synthesize targetView = _targetView;


- (NSMutableArray *)protocols {
    if (!_protocols) {
        _protocols = [NSMutableArray array];
    }
    return _protocols;
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

- (void)headerFooterForSection:(NSInteger)section inTableView:(nonnull UITableView *)tableView withData:(nonnull id)data type:(CHGTableViewHeaderFooterViewType)type {
    self.section = section;
    self.targetView = tableView;
    self.model = data;
    self.type = type;
    for (id protocol in self.protocols) {
        [protocol headerFooterForSection:section inTableView:tableView withData:data type:type];
    }
}

- (void)headerFooterViewDidDisAppearWithType:(CHGTableViewHeaderFooterViewType)type {
    for (id protocol in self.protocols) {
        [protocol headerFooterViewDidDisAppearWithType:type];
    }
}

- (void)headerFooterViewWillAppearWithType:(CHGTableViewHeaderFooterViewType)type {
    for (id protocol in self.protocols) {
        [protocol headerFooterViewWillAppearWithType:type];
    }
}

- (void)headerFooterViewWillReuseWithIdentifier:(nonnull NSString *)identifier {
    for (id protocol in self.protocols) {
        [protocol headerFooterViewWillReuseWithIdentifier:identifier];
    }
}

- (void)setEventTransmissionBlock:(CHGEventTransmissionBlock)eventTransmissionBlock {
    _eventTransmissionBlock = eventTransmissionBlock;
    for (id protocol in self.protocols) {
        [protocol setEventTransmissionBlock:eventTransmissionBlock];
    }
}


@end


