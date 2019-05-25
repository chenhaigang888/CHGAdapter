//
//  CHGBaseView.m
//  CHGAdapter
//
//  Created by DNAER5 on 2019/5/25.
//  Copyright © 2019 chen haiGang. All rights reserved.
//

#import "CHGBaseView.h"

#pragma - mark CHGViewLifeCycleProtocol method

@implementation CHGBaseView

@synthesize cellData;

@synthesize indexPath;

@synthesize targetView;

@synthesize eventTransmissionBlock;

@synthesize viewLifeCycleProtocols;

- (NSMutableArray<CHGViewLifeCycleProtocol> *)viewLifeCycleProtocols {
    if (!viewLifeCycleProtocols) {
        viewLifeCycleProtocols = [NSMutableArray<CHGViewLifeCycleProtocol> array];
    }
    return viewLifeCycleProtocols;
}

- (void)cellWillAppear {
    for (id<CHGViewLifeCycleProtocol> viewLifeCycleProtocol in self.viewLifeCycleProtocols) {
        [viewLifeCycleProtocol cellWillAppear];
    }
}

- (void)cellDidDisappear {
    for (id<CHGViewLifeCycleProtocol> viewLifeCycleProtocol in self.viewLifeCycleProtocols) {
        [viewLifeCycleProtocol cellDidDisappear];
    }
}

- (void)cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath targetView:(nonnull UIView *)targetView withData:(nonnull id)data {
    self.indexPath = indexPath;
    self.targetView = targetView;
    self.cellData = data;
    for (id<CHGViewLifeCycleProtocol> viewLifeCycleProtocol in self.viewLifeCycleProtocols) {
        [viewLifeCycleProtocol cellForRowAtIndexPath:indexPath targetView:targetView withData:data];
    }
}

- (void)willReuseWithIdentifier:(nonnull NSString *)identifier {
    for (id<CHGViewLifeCycleProtocol> viewLifeCycleProtocol in self.viewLifeCycleProtocols) {
        [viewLifeCycleProtocol willReuseWithIdentifier:identifier];
    }
}

- (void)willReuseWithIdentifier:(nonnull NSString *)identifier indexPath:(nonnull NSIndexPath *)indexPath {
    for (id<CHGViewLifeCycleProtocol> viewLifeCycleProtocol in self.viewLifeCycleProtocols) {
        [viewLifeCycleProtocol willReuseWithIdentifier:identifier indexPath:indexPath];
    }
}



#pragma - mark CHGTableViewHeaderFooterLifeCycleProtocol method

@synthesize controller;

@synthesize headerFooterData;

@synthesize section;

@synthesize tableView;

@synthesize tableViewHeaderFooterLifeCycleProtocols;

@synthesize type;

- (void)headerFooterForSection:(NSInteger)section inTableView:(nonnull UITableView *)tableView withData:(nonnull id)data type:(id)type {
    self.section = section;
    self.tableView = tableView;
    self.headerFooterData = data;
    self.type = type;
    
    for (id<CHGTableViewHeaderFooterLifeCycleProtocol> tableViewHeaderFooterLifeCycleProtocol in self.tableViewHeaderFooterLifeCycleProtocols) {
        [tableViewHeaderFooterLifeCycleProtocol headerFooterForSection:section inTableView:tableView withData:data type:type];
    }
}

- (void)headerFooterViewDidDisAppearWithType:(id)type {
    for (id<CHGTableViewHeaderFooterLifeCycleProtocol> tableViewHeaderFooterLifeCycleProtocol in self.tableViewHeaderFooterLifeCycleProtocols) {
        [tableViewHeaderFooterLifeCycleProtocol headerFooterViewDidDisAppearWithType:type];
    }
}

- (void)headerFooterViewWillAppearWithType:(id)type {
    for (id<CHGTableViewHeaderFooterLifeCycleProtocol> tableViewHeaderFooterLifeCycleProtocol in self.tableViewHeaderFooterLifeCycleProtocols) {
        [tableViewHeaderFooterLifeCycleProtocol headerFooterViewWillAppearWithType:type];
    }
}

@end
