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



@synthesize section;



@synthesize type;

@synthesize model;

@synthesize protocols;

@synthesize targetView;


- (NSMutableArray *)protocols {
    if (!protocols) {
        protocols = [NSMutableArray array];
    }
    return protocols;
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
//
///**
// 将要复用
//
// @param identifier identifier
// */
//-(void)willReuseWithIdentifier:(NSString *)identifier {
//    for (id<CHGTableViewHeaderFooterLifeCycleProtocol> tableViewHeaderFooterLifeCycleProtocol in self.tableViewHeaderFooterLifeCycleProtocols) {
//        [tableViewHeaderFooterLifeCycleProtocol willReuseWithIdentifier:identifier];
//    }
//}
//
///**
// headerFooterView将要显示
// */
//-(void)headerFooterViewWillAppearWithType:(CHGTableViewHeaderFooterViewType)type {
//    for (id<CHGTableViewHeaderFooterLifeCycleProtocol> tableViewHeaderFooterLifeCycleProtocol in self.tableViewHeaderFooterLifeCycleProtocols) {
//        [tableViewHeaderFooterLifeCycleProtocol headerFooterViewWillAppearWithType:type];
//    }
//}
//
///**
// headerFooterView已经消失
// */
//-(void)headerFooterViewDidDisAppearWithType:(CHGTableViewHeaderFooterViewType)type {
//    for (id<CHGTableViewHeaderFooterLifeCycleProtocol> tableViewHeaderFooterLifeCycleProtocol in self.tableViewHeaderFooterLifeCycleProtocols) {
//        [tableViewHeaderFooterLifeCycleProtocol headerFooterViewDidDisAppearWithType:type];
//    }
//}
//
//-(void)headerFooterForSection:(NSInteger)section inTableView:(UITableView*)tableView withData:(id)data type:(CHGTableViewHeaderFooterViewType)type {
//    self.section = section;
//    self.tableView = tableView;
//    self.headerFooterData = data;
//    self.type = type;
//
//    for (id<CHGTableViewHeaderFooterLifeCycleProtocol> tableViewHeaderFooterLifeCycleProtocol in self.tableViewHeaderFooterLifeCycleProtocols) {
//        [tableViewHeaderFooterLifeCycleProtocol headerFooterForSection:section inTableView:tableView withData:data type:type];
//    }
//}

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

- (void)willReuseWithIdentifier:(nonnull NSString *)identifier {
    for (id protocol in self.protocols) {
        [protocol willReuseWithIdentifier:identifier];
    }
}

@end


