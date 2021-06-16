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
    if ([headerFooterModelProtocol respondsToSelector:@selector(headerFooterClassInTableView:section:type:)]) {
        return [headerFooterModelProtocol headerFooterClassInTableView:tableView section:section type:CHGAdapterViewTypeHeaderType];
    }
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    return [headerFooterModelProtocol getHeaderFooterClass];
#pragma clang diagnostic pop
}

-(NSString*)obtainFooterNameWithFooterData:(id)data tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    id<CHGTableViewHeaderFooterModelProtocol> headerFooterModelProtocol = data;
    if ([headerFooterModelProtocol respondsToSelector:@selector(headerFooterClassInTableView:section:type:)]) {
        return [headerFooterModelProtocol headerFooterClassInTableView:tableView section:section type:CHGAdapterViewTypeFooterType];
    }
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    return [headerFooterModelProtocol getHeaderFooterClass];
#pragma clang diagnostic pop
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    id<CHGTableViewCellModelProtocol> cellModelProtocol = [self cellDataWithIndexPath:indexPath tableView:tableView];
    if ([cellModelProtocol respondsToSelector:@selector(cellHeighInTableView:indexPath:)]) {
        return [cellModelProtocol cellHeighInTableView:tableView indexPath:indexPath];
    }
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    return [cellModelProtocol getCellHeigh];
#pragma clang diagnostic pop
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    id <CHGTableViewHeaderFooterModelProtocol> headerFooterModelProtocol = [self headerFooterDataWithType:CHGAdapterViewTypeHeaderType section:section];
    if (headerFooterModelProtocol) {
        if ([headerFooterModelProtocol respondsToSelector:@selector(headerFooterHeighInTableView:section:type:)]) {
            return [headerFooterModelProtocol headerFooterHeighInTableView:tableView section:section type:CHGAdapterViewTypeHeaderType];
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
    id <CHGTableViewHeaderFooterModelProtocol> headerFooterModelProtocol = [self headerFooterDataWithType:CHGAdapterViewTypeFooterType section:section];
    if (headerFooterModelProtocol) {
        if ([headerFooterModelProtocol respondsToSelector:@selector(headerFooterHeighInTableView:section:type:)]) {
            return [headerFooterModelProtocol headerFooterHeighInTableView:tableView section:section type:CHGAdapterViewTypeFooterType];
        } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
            return [headerFooterModelProtocol getHeaderFooterHeigh];
#pragma clang diagnostic pop
        }
    }
    return [super tableView:tableView heightForFooterInSection:section];
}

- (NSString *)subDataKeyPathWithIndexPath:(NSIndexPath *)indexPath targetView:(UIScrollView *)targetView {
    id sectionData = self.adapterData.cellDatas[indexPath.section];
    if ([sectionData conformsToProtocol:@protocol(CHGTableViewHeaderFooterModelProtocol)]) {//遵守了协议
        if ([sectionData respondsToSelector:@selector(subDataKeyPathWithIndexPath:tableView:)]) {
            id<CHGTableViewHeaderFooterModelProtocol> cellModelProtocol = sectionData;
            NSString * keyPath = [cellModelProtocol subDataKeyPathWithIndexPath:indexPath
                                                                      tableView:(UITableView*)targetView];
            return keyPath.length == 0 ? [super subDataKeyPathWithIndexPath:indexPath targetView:targetView] : keyPath;
        }
    }
    return [super subDataKeyPathWithIndexPath:indexPath targetView:targetView];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    id<CHGTableViewCellModelProtocol> cellModelProtocol = [self cellDataWithIndexPath:indexPath tableView:tableView];
    if ([cellModelProtocol respondsToSelector:@selector(cellCanEditInTableView:indexPath:)]) {
        return [cellModelProtocol cellCanEditInTableView:tableView indexPath:indexPath];
    }
    return [super tableView:tableView canEditRowAtIndexPath:indexPath];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    id<CHGTableViewCellModelProtocol> cellModelProtocol = [self cellDataWithIndexPath:indexPath tableView:tableView];
    if ([cellModelProtocol respondsToSelector:@selector(editingStyleInTableView:indexPath:)]) {
        return [cellModelProtocol editingStyleInTableView:tableView indexPath:indexPath];
    }
    return [super tableView:tableView editingStyleForRowAtIndexPath:indexPath];
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    id<CHGTableViewCellModelProtocol> cellModelProtocol = [self cellDataWithIndexPath:indexPath tableView:tableView];
    if ([cellModelProtocol respondsToSelector:@selector(titleForDeleteConfirmationButtonInTableView:indexPath:)]) {
        return [cellModelProtocol titleForDeleteConfirmationButtonInTableView:tableView indexPath:indexPath];
    }
    return [super tableView:tableView titleForDeleteConfirmationButtonForRowAtIndexPath:indexPath];
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    id<CHGTableViewCellModelProtocol> cellModelProtocol = [self cellDataWithIndexPath:indexPath tableView:tableView];
    if ([cellModelProtocol respondsToSelector:@selector(editActionsInTableView:indexPath:)]) {
        return [cellModelProtocol editActionsInTableView:tableView indexPath:indexPath];
    }
    return [super tableView:tableView editActionsForRowAtIndexPath:indexPath];
}

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    id<CHGTableViewCellModelProtocol> cellModelProtocol = [self cellDataWithIndexPath:indexPath tableView:tableView];
    if ([cellModelProtocol respondsToSelector:@selector(shouldIndentWhileEditingInTableView:indexPath:)]) {
        return [cellModelProtocol shouldIndentWhileEditingInTableView:tableView indexPath:indexPath];
    }
    return [super tableView:tableView shouldIndentWhileEditingRowAtIndexPath:indexPath];
}

@end
