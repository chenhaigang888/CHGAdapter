//
//  CHGCollectionViewAdapter.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/14.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "CHGCollectionViewAdapter.h"
#import "CHGCollectionViewCell.h"
#import "CHGCollectionReusableView.h"

@implementation CHGCollectionViewAdapter

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.adapterData = [CHGCollectionViewAdapterData new];
    }
    return self;
}

-(NSString*)obtainCellNameWithCellData:(id)data collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.cellName;
}

- (NSString *)obtainSupplementaryElementNameWithCellData:(id)data collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    return [kind isEqualToString:UICollectionElementKindSectionHeader]
    ?
    self.sectionHeaderName
    :
    self.sectionFooterName;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    [collectionView.collectionViewLayout invalidateLayout];
    NSArray * cellDatas = self.adapterData.cellDatas;
    if (!cellDatas || cellDatas.count == 0) {
        return 0;
    }
    return cellDatas.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    id cellDatas = self.adapterData.cellDatas;
    if ([cellDatas count] == 0) {
        return 0;
    }
    NSString * keyPathOfSubDataTemp = [self subDataKeyPathWithIndexPath:[NSIndexPath indexPathForRow:0 inSection:section] targetView:collectionView];
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

- (NSString *)subDataKeyPathWithIndexPath:(NSIndexPath *)indexPath targetView:(UIScrollView *)targetView {
    return self.keyPathOfSubData;
}

/**
 获取cell的data
 
 @param indexPath indexPath
 @return 返回cell的data
 */
-(id)cellDataWithIndexPath:(NSIndexPath*)indexPath collectionView:(UICollectionView*)collectionView{
    if (self.adapterData.cellDatas.count == 0) {
        return nil;
    }
    id sectionData = self.adapterData.cellDatas[indexPath.section];
    NSString * keyPathOfSubDataTemp = [self subDataKeyPathWithIndexPath:indexPath targetView:collectionView];
    if (keyPathOfSubDataTemp && ![sectionData isKindOfClass:[NSArray class]]) {
        return [sectionData valueForKeyPath:keyPathOfSubDataTemp][indexPath.row];
    } else {
        return [sectionData isKindOfClass:[NSArray class]] ? sectionData[indexPath.row] : sectionData;
    }
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    id cellData = [self cellDataWithIndexPath:indexPath collectionView:collectionView];
    //获取cell
    NSString * identifier = [self obtainCellNameWithCellData:cellData collectionView:collectionView cellForItemAtIndexPath:indexPath];
    if (identifier.length == 0) {
        return nil;
    }
    
    if ([self fileIsExit:identifier]) {
        [collectionView registerNib:[UINib nibWithNibName:identifier bundle:nil] forCellWithReuseIdentifier:identifier];
    } else {
        [collectionView registerClass:NSClassFromString(identifier) forCellWithReuseIdentifier:identifier];
    }
    CHGCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    [cell cellForRowAtIndexPath:indexPath targetView:collectionView model:cellData eventTransmissionBlock:collectionView.eventTransmissionBlock];
    return cell;
}

-(UICollectionReusableView*)defaultReusableViewWithCollectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath headerFooterData:(id)headerFooterData {
    [collectionView registerClass:[CHGCollectionReusableView class] forSupplementaryViewOfKind:kind withReuseIdentifier:@"CHGCollectionReusableView"];
    CHGCollectionReusableView * reusableView = (CHGCollectionReusableView*)[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"CHGCollectionReusableView" forIndexPath:indexPath];
    
    [reusableView reusableViewForCollectionView:collectionView indexPath:indexPath kind:kind model:headerFooterData eventTransmissionBlock:collectionView.eventTransmissionBlock];
    return reusableView;
}

/**
 返回headerFooter数据
 
 @param kind 当前传入的是Header或者footer的标志(UICollectionElementKindSectionHeader,UICollectionElementKindSectionFooter)
 @param indexPath indexPath
 @return 返回数据
 */
-(id)headerFooterDataWithrSupplementaryElementOfKind:(NSString *)kind indexPath:(NSIndexPath *)indexPath {
    NSArray * reusableViewData =
    [kind isEqualToString:UICollectionElementKindSectionHeader]
    ?
    self.adapterData.headerDatas
    :
    self.adapterData.footerDatas;
    if (!reusableViewData || [reusableViewData count] == 0 || indexPath.section >= reusableViewData.count) {
        return nil;
    }
    return reusableViewData[indexPath.section];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    NSArray * reusableViewData =
    [kind isEqualToString:UICollectionElementKindSectionHeader]
    ?
    self.adapterData.headerDatas
    :
    self.adapterData.footerDatas;
    id headerFooterData = [self headerFooterDataWithrSupplementaryElementOfKind:kind indexPath:indexPath];
    if (!reusableViewData || [reusableViewData count] == 0 || indexPath.section >= reusableViewData.count) {
        return [self defaultReusableViewWithCollectionView:collectionView viewForSupplementaryElementOfKind:kind atIndexPath:indexPath headerFooterData:headerFooterData];
    }
    
    NSString * identifier = [self obtainSupplementaryElementNameWithCellData:headerFooterData collectionView:collectionView viewForSupplementaryElementOfKind:kind atIndexPath:indexPath];
    if (identifier.length == 0){
        return [self defaultReusableViewWithCollectionView:collectionView viewForSupplementaryElementOfKind:kind atIndexPath:indexPath headerFooterData:headerFooterData];
    }
    if ([self fileIsExit:identifier]) {
        [collectionView registerNib:[UINib nibWithNibName:identifier bundle:nil] forSupplementaryViewOfKind:kind withReuseIdentifier:identifier];
    } else {
        [collectionView registerClass:NSClassFromString(identifier) forSupplementaryViewOfKind:kind withReuseIdentifier:identifier];
    }
    CHGCollectionReusableView * reusableView = (CHGCollectionReusableView*)[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:identifier forIndexPath:indexPath];
    
    [reusableView reusableViewForCollectionView:collectionView indexPath:indexPath kind:kind model:headerFooterData eventTransmissionBlock:collectionView.eventTransmissionBlock];
    return reusableView;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (collectionView.collectionViewDidSelectItemAtIndexPathBlock) {
        collectionView.collectionViewDidSelectItemAtIndexPathBlock(collectionView, indexPath, [self cellDataWithIndexPath:indexPath collectionView:collectionView]);
    }
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(8_0) {
    if([cell isKindOfClass:[CHGCollectionViewCell class]]){
        [((CHGCollectionViewCell*)cell) cellWillAppear];
    }
}

- (void)collectionView:(UICollectionView *)collectionView willDisplaySupplementaryView:(UICollectionReusableView *)view forElementKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(8_0) {
    if([view isKindOfClass:[CHGCollectionReusableView class]]){
        [((CHGCollectionReusableView*)view) reusableViewWillAppear];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell isKindOfClass:[CHGCollectionViewCell class]]) {
        [((CHGCollectionViewCell*)cell) cellDidDisappear];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingSupplementaryView:(UICollectionReusableView *)view forElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {
    if([view isKindOfClass:[CHGCollectionReusableView class]]){
        [((CHGCollectionReusableView*)view) reusableViewDidDisappear];
    }
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
