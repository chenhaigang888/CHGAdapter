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
#import "CHGScrollViewDelegate.h"

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
    
    
    [cell cellForRowAtIndexPath:indexPath targetView:tableView model:cellData eventTransmissionBlock:tableView.eventTransmissionBlock];
//    [cell cellForRowAtIndexPath:indexPath tableView:tableView withData:cellData];
    return cell;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [self tableView:tableView tableViewHeaderFooterViewType:CHGAdapterViewTypeHeaderType viewForHeaderInSection:section];
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [self tableView:tableView tableViewHeaderFooterViewType:CHGAdapterViewTypeFooterType viewForHeaderInSection:section];
}

/**
 获取headerFooter的数据
 
 @param type header或者footer类型
 @param section section
 @return 返回headerFooter的数据
 */
-(id)headerFooterDataWithType:(CHGAdapterViewType)type section:(NSInteger)section{
    NSArray * headerFooterDatas =
    type == CHGAdapterViewTypeHeaderType
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
-(UIView*)tableView:(UITableView*)tableView tableViewHeaderFooterViewType:(CHGAdapterViewType)type viewForHeaderInSection:(NSInteger)section {
    id headerFooterData = [self headerFooterDataWithType:type section:section];
    NSString * identifier =
    type == CHGAdapterViewTypeHeaderType
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
    view.frame = CGRectMake(0, 0, tableView.frame.size.width, [self tableView:tableView heightForHeaderInSection:section]);
    [view headerFooterForSection:section inTableView:tableView model:headerFooterData type:type eventTransmissionBlock:tableView.eventTransmissionBlock];
    return view;
}

//headerView将显示
-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    if ([view isKindOfClass:[CHGTableViewHeaderFooterView class]]) {
        [((CHGTableViewHeaderFooterView*)view) headerFooterViewWillAppearWithType:CHGAdapterViewTypeHeaderType];
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
        [((CHGTableViewHeaderFooterView*)view) headerFooterViewWillAppearWithType:CHGAdapterViewTypeFooterType];
    }
}

//HeaderView已经消失
-(void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section {
    if ([view isKindOfClass:[CHGTableViewHeaderFooterView class]]) {
        [((CHGTableViewHeaderFooterView*)view) headerFooterViewDidDisAppearWithType:CHGAdapterViewTypeHeaderType];
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
        [((CHGTableViewHeaderFooterView*)view) headerFooterViewDidDisAppearWithType:CHGAdapterViewTypeFooterType];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:self.tableViewDeselectRowAtIndexPathAnimation];
    if (tableView.tableViewDidSelectRowBlock) {
        tableView.tableViewDidSelectRowBlock(tableView, indexPath, [self cellDataWithIndexPath:indexPath tableView:tableView]);
    }
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    for (id<CHGScrollViewDelegate> scrollViewDelegate in ((UITableView *)scrollView).scrollViewDelegates) {
        if ([scrollViewDelegate respondsToSelector:@selector(chg_scrollViewDidScroll:)]) {
            [scrollViewDelegate chg_scrollViewDidScroll:scrollView];
        }
    }
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView NS_AVAILABLE_IOS(3_2){
    for (id<CHGScrollViewDelegate> scrollViewDelegate in ((UITableView *)scrollView).scrollViewDelegates) {
        if ([scrollViewDelegate respondsToSelector:@selector(chg_scrollViewDidZoom:)]) {
            [scrollViewDelegate chg_scrollViewDidZoom:scrollView];
        }
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    for (id<CHGScrollViewDelegate> scrollViewDelegate in ((UITableView *)scrollView).scrollViewDelegates) {
        if ([scrollViewDelegate respondsToSelector:@selector(chg_scrollViewWillBeginDragging:)]) {
            [scrollViewDelegate chg_scrollViewWillBeginDragging:scrollView];
        }
    }
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset NS_AVAILABLE_IOS(5_0){
    for (id<CHGScrollViewDelegate> scrollViewDelegate in ((UITableView *)scrollView).scrollViewDelegates) {
        if ([scrollViewDelegate respondsToSelector:@selector(chg_scrollViewWillEndDragging:withVelocity:targetContentOffset:)]) {
            [scrollViewDelegate chg_scrollViewWillEndDragging:scrollView withVelocity:velocity targetContentOffset:targetContentOffset];
        }
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    for (id<CHGScrollViewDelegate> scrollViewDelegate in ((UITableView *)scrollView).scrollViewDelegates) {
        if ([scrollViewDelegate respondsToSelector:@selector(chg_scrollViewDidEndDragging:willDecelerate:)]) {
            [scrollViewDelegate chg_scrollViewDidEndDragging:scrollView willDecelerate:decelerate];
        }
    }
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    for (id<CHGScrollViewDelegate> scrollViewDelegate in ((UITableView *)scrollView).scrollViewDelegates) {
        if ([scrollViewDelegate respondsToSelector:@selector(chg_scrollViewWillBeginDecelerating:)]) {
            [scrollViewDelegate chg_scrollViewWillBeginDecelerating:scrollView];
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    for (id<CHGScrollViewDelegate> scrollViewDelegate in ((UITableView *)scrollView).scrollViewDelegates) {
        if ([scrollViewDelegate respondsToSelector:@selector(chg_scrollViewDidEndDecelerating:)]) {
            [scrollViewDelegate chg_scrollViewDidEndDecelerating:scrollView];
        }
    }
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    for (id<CHGScrollViewDelegate> scrollViewDelegate in ((UITableView *)scrollView).scrollViewDelegates) {
        if ([scrollViewDelegate respondsToSelector:@selector(chg_scrollViewDidEndScrollingAnimation:)]) {
            [scrollViewDelegate chg_scrollViewDidEndScrollingAnimation:scrollView];
        }
    }
}

- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    for (id<CHGScrollViewDelegate> scrollViewDelegate in ((UITableView *)scrollView).scrollViewDelegates) {
        if ([scrollViewDelegate respondsToSelector:@selector(chg_viewForZoomingInScrollView:)]) {
            return [scrollViewDelegate chg_viewForZoomingInScrollView:scrollView];
        }
    }
    return nil;
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view NS_AVAILABLE_IOS(3_2){
    for (id<CHGScrollViewDelegate> scrollViewDelegate in ((UITableView *)scrollView).scrollViewDelegates) {
        if ([scrollViewDelegate respondsToSelector:@selector(chg_scrollViewWillBeginZooming:withView:)]) {
            [scrollViewDelegate chg_scrollViewWillBeginZooming:scrollView withView:view];
        }
    }
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view atScale:(CGFloat)scale{
    for (id<CHGScrollViewDelegate> scrollViewDelegate in ((UITableView *)scrollView).scrollViewDelegates) {
        if ([scrollViewDelegate respondsToSelector:@selector(chg_scrollViewDidEndZooming:withView:atScale:)]) {
            [scrollViewDelegate chg_scrollViewDidEndZooming:scrollView withView:view atScale:scale];
        }
    }
}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView{
    for (id<CHGScrollViewDelegate> scrollViewDelegate in ((UITableView *)scrollView).scrollViewDelegates) {
        if ([scrollViewDelegate respondsToSelector:@selector(chg_scrollViewShouldScrollToTop:)]) {
            return [scrollViewDelegate chg_scrollViewShouldScrollToTop:scrollView];
        }
    }
    return scrollView.scrollsToTop;
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView{
    for (id<CHGScrollViewDelegate> scrollViewDelegate in ((UITableView *)scrollView).scrollViewDelegates) {
        if ([scrollViewDelegate respondsToSelector:@selector(chg_scrollViewDidScrollToTop:)]) {
            [scrollViewDelegate chg_scrollViewDidScrollToTop:scrollView];
        }
    }
}

- (void)scrollViewDidChangeAdjustedContentInset:(UIScrollView *)scrollView API_AVAILABLE(ios(11.0), tvos(11.0)) {
    for (id<CHGScrollViewDelegate> scrollViewDelegate in ((UITableView *)scrollView).scrollViewDelegates) {
        if ([scrollViewDelegate respondsToSelector:@selector(chg_scrollViewDidChangeAdjustedContentInset:)]) {
            [scrollViewDelegate chg_scrollViewDidChangeAdjustedContentInset:scrollView];
        }
    }
}



@end
