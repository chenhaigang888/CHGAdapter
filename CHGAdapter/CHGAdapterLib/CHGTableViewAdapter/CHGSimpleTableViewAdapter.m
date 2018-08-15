//
//  CHGSimpleTableViewAdapter.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/7/28.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "CHGSimpleTableViewAdapter.h"

@implementation CHGSimpleTableViewAdapter

-(NSString*)obtainCellNameWithCellData:(id)data tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id<CHGTableViewCellModelProtocol> cellModelProtocol = data;
    if ([cellModelProtocol respondsToSelector:@selector(cellClassNameInTableView:indexPath:)]) {
        return [cellModelProtocol cellClassNameInTableView:tableView indexPath:indexPath];
    }
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    return [cellModelProtocol getCellClass];
#pragma clang diagnostic pop
}

-(NSString*)obtainHeaderNameWithHeaderData:(id)data tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    id<CHGTableViewHeaderFooterModelProtocol> headerFooterModelProtocol = data;
    if ([headerFooterModelProtocol respondsToSelector:@selector(headerFooterClassInTableViw:section:type:)]) {
        return [headerFooterModelProtocol headerFooterClassInTableViw:tableView section:section type:CHGTableViewHeaderFooterViewHeaderType];
    }
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    return [headerFooterModelProtocol getHeaderFooterClass];
#pragma clang diagnostic pop
}

-(NSString*)obtainFooterNameWithFooterData:(id)data tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    id<CHGTableViewHeaderFooterModelProtocol> headerFooterModelProtocol = data;
    if ([headerFooterModelProtocol respondsToSelector:@selector(headerFooterClassInTableViw:section:type:)]) {
        return [headerFooterModelProtocol headerFooterClassInTableViw:tableView section:section type:CHGTableViewHeaderFooterViewFooterType];
    }
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    return [headerFooterModelProtocol getHeaderFooterClass];
#pragma clang diagnostic pop
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    id<CHGTableViewCellModelProtocol> cellModelProtocol = [self cellDataWithIndexPath:indexPath];
    if ([cellModelProtocol respondsToSelector:@selector(cellHeighInTableView:indexPath:)]) {
        return [cellModelProtocol cellHeighInTableView:tableView indexPath:indexPath];
    }
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    return [cellModelProtocol getCellHeigh];
#pragma clang diagnostic pop
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    id <CHGTableViewHeaderFooterModelProtocol> headerFooterModelProtocol = [self headerFooterDataWithType:CHGTableViewHeaderFooterViewHeaderType section:section];
    if (headerFooterModelProtocol) {
        if ([headerFooterModelProtocol respondsToSelector:@selector(headerFooterHeighInTableViw:section:type:)]) {
            return [headerFooterModelProtocol headerFooterHeighInTableViw:tableView section:section type:CHGTableViewHeaderFooterViewHeaderType];
        } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
            return [headerFooterModelProtocol getHeaderFooterHeigh];
#pragma clang diagnostic pop
        }
    }
    return [super tableView:tableView heightForHeaderInSection:section];
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    id <CHGTableViewHeaderFooterModelProtocol> headerFooterModelProtocol = [self headerFooterDataWithType:CHGTableViewHeaderFooterViewFooterType section:section];
    if (headerFooterModelProtocol) {
        if ([headerFooterModelProtocol respondsToSelector:@selector(headerFooterHeighInTableViw:section:type:)]) {
            return [headerFooterModelProtocol headerFooterHeighInTableViw:tableView section:section type:CHGTableViewHeaderFooterViewFooterType];
        } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
            return [headerFooterModelProtocol getHeaderFooterHeigh];
#pragma clang diagnostic pop
        }
    }
    return [super tableView:tableView heightForHeaderInSection:section];
}

@end
