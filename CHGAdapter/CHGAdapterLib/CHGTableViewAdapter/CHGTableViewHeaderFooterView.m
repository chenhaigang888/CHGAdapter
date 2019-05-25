//
//  CHGTableViewHeaderFooterView.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/10.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "CHGTableViewHeaderFooterView.h"

@implementation CHGTableViewHeaderFooterView

@synthesize controller;

@synthesize eventTransmissionBlock;

@synthesize headerFooterData;

@synthesize section;

@synthesize tableView;

@synthesize tableViewHeaderFooterLifeCycleProtocols;

@synthesize type;

- (NSMutableArray<CHGTableViewHeaderFooterLifeCycleProtocol> *)tableViewHeaderFooterLifeCycleProtocols {
    if (!tableViewHeaderFooterLifeCycleProtocols) {
        tableViewHeaderFooterLifeCycleProtocols = [NSMutableArray<CHGTableViewHeaderFooterLifeCycleProtocol> array];
    }
    return tableViewHeaderFooterLifeCycleProtocols;
}



/**
 获取当前Adapter的tag
 
 @return 返回tag
 */
-(NSInteger)adapterTag {
    return self.tableView.tableViewAdapter.tag;
}

/**
 获取AdapterData中的customData
 
 @return 获取AdapterData中的customData
 */
-(id)customData {
    return self.tableView.tableViewAdapter.adapterData.customData;
}

/**
 返回当前cell所在的controller
 
 @return 返回当前cell所在的controller
 */
-(UIViewController*)controller {
    return self.tableView.tableViewAdapter.controller;
}

/**
 将要复用
 
 @param identifier identifier
 */
-(void)willReuseWithIdentifier:(NSString *)identifier {
    for (id<CHGTableViewHeaderFooterLifeCycleProtocol> tableViewHeaderFooterLifeCycleProtocol in self.tableViewHeaderFooterLifeCycleProtocols) {
        [tableViewHeaderFooterLifeCycleProtocol willReuseWithIdentifier:identifier];
    }
}

/**
 headerFooterView将要显示
 */
-(void)headerFooterViewWillAppearWithType:(CHGTableViewHeaderFooterViewType)type {
    for (id<CHGTableViewHeaderFooterLifeCycleProtocol> tableViewHeaderFooterLifeCycleProtocol in self.tableViewHeaderFooterLifeCycleProtocols) {
        [tableViewHeaderFooterLifeCycleProtocol headerFooterViewWillAppearWithType:type];
    }
}

/**
 headerFooterView已经消失
 */
-(void)headerFooterViewDidDisAppearWithType:(CHGTableViewHeaderFooterViewType)type {
    for (id<CHGTableViewHeaderFooterLifeCycleProtocol> tableViewHeaderFooterLifeCycleProtocol in self.tableViewHeaderFooterLifeCycleProtocols) {
        [tableViewHeaderFooterLifeCycleProtocol headerFooterViewDidDisAppearWithType:type];
    }
}

-(void)headerFooterForSection:(NSInteger)section inTableView:(UITableView*)tableView withData:(id)data type:(CHGTableViewHeaderFooterViewType)type {
    self.section = section;
    self.tableView = tableView;
    self.headerFooterData = data;
    self.type = type;
    
    for (id<CHGTableViewHeaderFooterLifeCycleProtocol> tableViewHeaderFooterLifeCycleProtocol in self.tableViewHeaderFooterLifeCycleProtocols) {
        [tableViewHeaderFooterLifeCycleProtocol headerFooterForSection:section inTableView:tableView withData:data type:type];
    }
}



@end
