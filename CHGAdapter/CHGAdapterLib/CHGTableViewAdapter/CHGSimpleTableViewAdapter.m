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
    return ((id<CHGTableViewCellModelProtocol>)data).getCellClass;
}

-(NSString*)obtainHeaderNameWithHeaderData:(id)data tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return ((id<CHGTableViewHeaderFooterModelProtocol>)data).getHeaderFooterClass;
}

-(NSString*)obtainFooterNameWithFooterData:(id)data tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return ((id<CHGTableViewHeaderFooterModelProtocol>)data).getHeaderFooterClass;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return ((id<CHGTableViewCellModelProtocol>)[self cellDataWithIndexPath:indexPath]).getCellHeigh;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    id <CHGTableViewHeaderFooterModelProtocol> model = [self headerFooterDataWithType:CHGTableViewHeaderFooterViewHeaderType section:section];
    if (model) {
        return model.getHeaderFooterHeigh;
    }
    return [super tableView:tableView heightForHeaderInSection:section];
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    id <CHGTableViewHeaderFooterModelProtocol> model = [self headerFooterDataWithType:CHGTableViewHeaderFooterViewFooterType section:section];
    if (model) {
        return model.getHeaderFooterHeigh;
    }
    return [super tableView:tableView heightForHeaderInSection:section];
}

@end
