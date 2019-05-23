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
        self.adapterData = [CHGTableViewAdapterData new];
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

- (NSString *)subDataKeyPathWithIndexPath:(NSIndexPath *)indexPath targetView:(UIScrollView *)targetView {
    return self.keyPathOfSubData;
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
    
    NSString * keyPathOfSubDataTemp = [self subDataKeyPathWithIndexPath:[NSIndexPath indexPathForRow:0 inSection:section] targetView:tableView];
    
    if (keyPathOfSubDataTemp && ![cellDatas[section] isKindOfClass:[NSArray class]]) {
        return [[cellDatas[section] valueForKeyPath:keyPathOfSubDataTemp] count];
    }
    id cellData = [cellDatas objectAtIndex:section];
    if ([cellData isKindOfClass:[NSArray class]]) {
        return cellData == nil ? 0 : [cellData count];
    } else {
        return 1;
    }
}

//添加索引栏标题数组
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.adapterData.indexDatas;
}


//点击索引栏标题时执行
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return [[UILocalizedIndexedCollation currentCollation] sectionForSectionIndexTitleAtIndex:index];
}

/**
 获取cell的data
 
 @param indexPath indexPath
 @return 返回cell的data
 */
-(id)cellDataWithIndexPath:(NSIndexPath*)indexPath tableView:(UITableView*)tableView {
    if (self.adapterData.cellDatas.count == 0) {
        return nil;
    }
    id sectionData = self.adapterData.cellDatas[indexPath.section];
    NSString * keyPathOfSubDataTemp = [self subDataKeyPathWithIndexPath:indexPath targetView:tableView];
    if (keyPathOfSubDataTemp && ![sectionData isKindOfClass:[NSArray class]]) {
        return [sectionData valueForKeyPath:keyPathOfSubDataTemp][indexPath.row];
    } else {
        return [sectionData isKindOfClass:[NSArray class]] ? sectionData[indexPath.row] : sectionData;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id cellData = [self cellDataWithIndexPath:indexPath tableView:tableView];
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
    [cell cellForRowAtIndexPath:indexPath targetView:tableView withData:cellData];
//    [cell cellForRowAtIndexPath:indexPath tableView:tableView withData:cellData];
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
        tableView.tableViewDidSelectRowBlock(tableView, indexPath, [self cellDataWithIndexPath:indexPath tableView:tableView]);
    }
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    UITableView * tableView = (UITableView *)scrollView;
    if(tableView.scrollListener && tableView.scrollListener.scrollViewDidScrollBlock){
        tableView.scrollListener.scrollViewDidScrollBlock(scrollView);
    }
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView NS_AVAILABLE_IOS(3_2){
    UITableView * tableView = (UITableView *)scrollView;
    if(tableView.scrollListener && tableView.scrollListener.scrollViewDidZoomBlock){
        tableView.scrollListener.scrollViewDidZoomBlock(scrollView);
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    UITableView * tableView = (UITableView *)scrollView;
    if(tableView.scrollListener && tableView.scrollListener.scrollViewWillBeginDraggingBlock){
        tableView.scrollListener.scrollViewWillBeginDraggingBlock(scrollView);
    }
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset NS_AVAILABLE_IOS(5_0){
    UITableView * tableView = (UITableView *)scrollView;
    if(tableView.scrollListener && tableView.scrollListener.scrollViewWillEndDraggingBlock){
        tableView.scrollListener.scrollViewWillEndDraggingBlock(scrollView, velocity, *targetContentOffset);
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    UITableView * tableView = (UITableView *)scrollView;
    if(tableView.scrollListener && tableView.scrollListener.scrollViewDidEndDraggingBlock){
        tableView.scrollListener.scrollViewDidEndDraggingBlock(scrollView, decelerate);
    }
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    UITableView * tableView = (UITableView *)scrollView;
    if(tableView.scrollListener && tableView.scrollListener.scrollViewWillBeginDeceleratingBlock){
        tableView.scrollListener.scrollViewWillBeginDeceleratingBlock(scrollView);
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    UITableView * tableView = (UITableView *)scrollView;
    if(tableView.scrollListener && tableView.scrollListener.scrollViewDidEndDeceleratingBlock){
        tableView.scrollListener.scrollViewDidEndDeceleratingBlock(scrollView);
    }
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    UITableView * tableView = (UITableView *)scrollView;
    if(tableView.scrollListener && tableView.scrollListener.scrollViewDidEndScrollingAnimationBlock){
        tableView.scrollListener.scrollViewDidEndScrollingAnimationBlock(scrollView);
    }
}

- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    UITableView * tableView = (UITableView *)scrollView;
    if(tableView.scrollListener && tableView.scrollListener.viewForZoomingBlock){
        return tableView.scrollListener.viewForZoomingBlock(scrollView);
    }
    return nil;
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view NS_AVAILABLE_IOS(3_2){
    UITableView * tableView = (UITableView *)scrollView;
    if(tableView.scrollListener && tableView.scrollListener.scrollViewWillBeginZoomingBlock){
        tableView.scrollListener.scrollViewWillBeginZoomingBlock(scrollView, view);
    }
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view atScale:(CGFloat)scale{
    UITableView * tableView = (UITableView *)scrollView;
    if(tableView.scrollListener && tableView.scrollListener.scrollViewDidEndZoomingBlock){
        tableView.scrollListener.scrollViewDidEndZoomingBlock(scrollView, view, scale);
    }
}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView{
    UITableView * tableView = (UITableView *)scrollView;
    if(tableView.scrollListener && tableView.scrollListener.scrollViewShouldScrollToTopBlock){
        return tableView.scrollListener.scrollViewShouldScrollToTopBlock(scrollView);
    }
    return scrollView.scrollsToTop;
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView{
    UITableView * tableView = (UITableView *)scrollView;
    if(tableView.scrollListener && tableView.scrollListener.scrollViewDidScrollToTopBlock){
        tableView.scrollListener.scrollViewDidScrollToTopBlock(scrollView);
    }
}

- (void)scrollViewDidChangeAdjustedContentInset:(UIScrollView *)scrollView API_AVAILABLE(ios(11.0), tvos(11.0)) {
    UITableView * tableView = (UITableView *)scrollView;
    if(tableView.scrollListener && tableView.scrollListener.scrollViewDidChangeAdjustedContentInsetBlock){
        tableView.scrollListener.scrollViewDidChangeAdjustedContentInsetBlock(scrollView);
    }
}



@end
