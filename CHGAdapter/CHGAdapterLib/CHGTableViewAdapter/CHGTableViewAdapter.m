//
//  CHGTableViewAdapter.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/10.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "CHGTableViewAdapter.h"
#import "CHGTableViewCell.h"
#import "CHGTableViewHeaderFooterView.h"


@implementation CHGTableViewAdapter

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tableViewDeselectRowAtIndexPathAnimation = YES;
        self.cellHeight = -1;
        self.headerHeight = 30;
        self.footerHeight = 30;
    }
    return self;
}


/**
 判断文件是否存在
 
 @param fileName 文件名称
 @return 返回文件是否存在的结果
 */
-(BOOL)fileIsExit:(NSString*)fileName {
    NSString * xib = [[NSBundle mainBundle] pathForResource:fileName ofType:@"nib"];
    return xib;
}

-(NSString*)obtainCellNameWithCellData:(id)data tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.cellName;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.cellHeight;
}

-(NSString*)obtainHeaderNameWithHeaderData:(id)data tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return self.headerName;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return self.headerHeight;
}

-(NSString*)obtainFooterNameWithFooterData:(id)data tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return self.footerName;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return self.footerHeight;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSArray * cellDatas = self.adapterData.cellDatas;
    if (!cellDatas || cellDatas.count == 0) {
        return 0;
    }
    return cellDatas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id cellDatas = self.adapterData.cellDatas;
    if ([cellDatas count] == 0) {
        return 0;
    }
    if (self.rowsOfSectionKeyName && ![cellDatas[section] isKindOfClass:[NSArray class]]) {
        return [[cellDatas[section] valueForKey:self.rowsOfSectionKeyName] count];
    }
    id cellData = [cellDatas objectAtIndex:section];
    if ([cellData isKindOfClass:[NSArray class]]) {
        return cellData == nil ? 0 : [cellData count];
    } else {
        return 1;
    }
}

/**
 获取cell的data
 
 @param indexPath indexPath
 @return 返回cell的data
 */
-(id)cellDataWithIndexPath:(NSIndexPath*)indexPath {
    if (self.adapterData.cellDatas.count == 0) {
        return nil;
    }
    id sectionData = self.adapterData.cellDatas[indexPath.section];
    if (self.rowsOfSectionKeyName && ![sectionData isKindOfClass:[NSArray class]]) {
        return [sectionData valueForKey:self.rowsOfSectionKeyName][indexPath.row];
    } else {
        return [sectionData isKindOfClass:[NSArray class]] ? sectionData[indexPath.row] : sectionData;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id cellData = [self cellDataWithIndexPath:indexPath];
    //获取cell
    NSString * identifier = [self obtainCellNameWithCellData:cellData tableView:tableView cellForRowAtIndexPath:indexPath];
    if (identifier.length == 0) {
        return nil;
    }
    CHGTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        if ([self fileIsExit:identifier]) {
            [tableView registerNib:[UINib nibWithNibName:identifier bundle:nil] forCellReuseIdentifier:identifier];
        } else {
            [tableView registerClass:NSClassFromString(identifier) forCellReuseIdentifier:identifier];
        }
        cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    }
    //将cell的数据赋予cell
    cell.eventTransmissionBlock = tableView.eventTransmissionBlock;
    [cell cellForRowAtIndexPath:indexPath tableView:tableView withData:cellData];
    return cell;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [self tableView:tableView tableViewHeaderFooterViewType:CHGTableViewHeaderFooterViewHeaderType viewForHeaderInSection:section];
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [self tableView:tableView tableViewHeaderFooterViewType:CHGTableViewHeaderFooterViewFooterType viewForHeaderInSection:section];
}

/**
 获取headerFooter的数据

 @param type header或者footer类型
 @param section section
 @return 返回headerFooter的数据
 */
-(id)headerFooterDataWithType:(CHGTableViewHeaderFooterViewType)type section:(NSInteger)section{
    NSArray * headerFooterDatas =
    type == CHGTableViewHeaderFooterViewHeaderType
    ?
    self.adapterData.headerDatas
    :
    self.adapterData.footerDatas;
    if (!headerFooterDatas || [headerFooterDatas count] != 0) {
        if (section >= headerFooterDatas.count) {
            return nil;
        }
        return headerFooterDatas[section];
    }
    return nil;
}

/**
 获取header或者footer的View
 
 @param tableView tableView
 @param type 类型
 @param section section
 @return 繁华view
 */
-(UIView*)tableView:(UITableView*)tableView tableViewHeaderFooterViewType:(CHGTableViewHeaderFooterViewType)type viewForHeaderInSection:(NSInteger)section {
    id headerFooterData = [self headerFooterDataWithType:type section:section];
    NSString * identifier =
    type == CHGTableViewHeaderFooterViewHeaderType
    ?
    [self obtainHeaderNameWithHeaderData:headerFooterData tableView:tableView viewForHeaderInSection:section]
    :
    [self obtainFooterNameWithFooterData:headerFooterData tableView:tableView viewForFooterInSection:section];
    if ([identifier length] == 0) return nil;
    CHGTableViewHeaderFooterView * view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if (!view) {
        if ([self fileIsExit:identifier]) {
            [tableView registerNib:[UINib nibWithNibName:identifier bundle:nil] forHeaderFooterViewReuseIdentifier:identifier];
        } else {
            [tableView registerClass:NSClassFromString(identifier) forHeaderFooterViewReuseIdentifier:identifier];
        }
        view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    }
    view.eventTransmissionBlock = tableView.eventTransmissionBlock;
    view.frame = CGRectMake(0, 0, tableView.frame.size.width, [self tableView:tableView heightForHeaderInSection:section]);
    [view headerFooterForSection:section inTableView:tableView withData:headerFooterData type:type];
    return view;
}

//headerView将显示
-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    if ([view isKindOfClass:[CHGTableViewHeaderFooterView class]]) {
        [((CHGTableViewHeaderFooterView*)view) headerFooterViewWillAppearWithType:CHGTableViewHeaderFooterViewHeaderType];
    }
}

//cell将显示
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell isKindOfClass:[CHGTableViewCell class]]) {
        [((CHGTableViewCell*)cell) cellWillAppear];
    }
}

//footerView将显示
-(void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section {
    if ([view isKindOfClass:[CHGTableViewHeaderFooterView class]]) {
        [((CHGTableViewHeaderFooterView*)view) headerFooterViewWillAppearWithType:CHGTableViewHeaderFooterViewFooterType];
    }
}

//HeaderView已经消失
-(void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section {
    if ([view isKindOfClass:[CHGTableViewHeaderFooterView class]]) {
        [((CHGTableViewHeaderFooterView*)view) headerFooterViewDidDisAppearWithType:CHGTableViewHeaderFooterViewHeaderType];
    }
}

//cell已经消失
-(void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell isKindOfClass:[CHGTableViewCell class]]) {
        [((CHGTableViewCell*)cell) cellDidDisappear];
    }
}

//footerView已经消失
-(void)tableView:(UITableView *)tableView didEndDisplayingFooterView:(UIView *)view forSection:(NSInteger)section {
    if ([view isKindOfClass:[CHGTableViewHeaderFooterView class]]) {
        [((CHGTableViewHeaderFooterView*)view) headerFooterViewDidDisAppearWithType:CHGTableViewHeaderFooterViewFooterType];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:self.tableViewDeselectRowAtIndexPathAnimation];
    if (tableView.tableViewDidSelectRowBlock) {
        tableView.tableViewDidSelectRowBlock(tableView, indexPath, [self cellDataWithIndexPath:indexPath]);
    }
}

@end
