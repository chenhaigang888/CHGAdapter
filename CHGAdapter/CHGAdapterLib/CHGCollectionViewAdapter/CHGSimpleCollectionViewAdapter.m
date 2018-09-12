//
//  CHGSimpleCollectionViewAdapter.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/8/17.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "CHGSimpleCollectionViewAdapter.h"

@implementation CHGSimpleCollectionViewAdapter

#pragma mark 构造view
-(NSString*)obtainCellNameWithCellData:(id)data collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    id<CHGCollectionViewCellModelProtocol> cellModelProtocol = [self cellDataWithIndexPath:indexPath collectionView:collectionView];
    return [cellModelProtocol cellClassNameInCollectionView:collectionView atIndexPath:indexPath];
}

-(NSString*)obtainSupplementaryElementNameWithCellData:(id)data collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    id<CHGCollectionViewSupplementaryElementModelProtocol> supplementaryElementModelProtocol = [self headerFooterDataWithrSupplementaryElementOfKind:kind indexPath:indexPath];
    return [supplementaryElementModelProtocol reusableViewInCollectionView:collectionView supplementaryElementOfKind:kind atIndexPath:indexPath];
}

///动态设置每个分区的EdgeInsets 不包括header和footer
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout*)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section {
    id<CHGCollectionViewSupplementaryElementModelProtocol> supplementaryElementModelProtocol =
    [self headerFooterDataWithrSupplementaryElementOfKind:UICollectionElementKindSectionHeader indexPath:[NSIndexPath indexPathForRow:0 inSection:section]];
    if ([supplementaryElementModelProtocol respondsToSelector:@selector(collectionView:layout:insetForSectionAtIndex:)]) {
        return [supplementaryElementModelProtocol collectionView:collectionView
                                                          layout:collectionViewLayout
                                          insetForSectionAtIndex:section];
    } else if ([collectionViewLayout isKindOfClass:[UICollectionViewFlowLayout class]]) {
        UICollectionViewFlowLayout * layout = (UICollectionViewFlowLayout *)collectionViewLayout;
        return layout.sectionInset;
    }
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

//动态设置每行的间距大小
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    id<CHGCollectionViewSupplementaryElementModelProtocol> supplementaryElementModelProtocol =
    [self headerFooterDataWithrSupplementaryElementOfKind:UICollectionElementKindSectionHeader indexPath:[NSIndexPath indexPathForRow:0 inSection:section]];
    if ([supplementaryElementModelProtocol respondsToSelector:@selector(collectionView:layout:minimumLineSpacingForSectionAtIndex:)]) {
        return [supplementaryElementModelProtocol collectionView:collectionView
                                                          layout:collectionViewLayout
                             minimumLineSpacingForSectionAtIndex:section];
    } else if([collectionViewLayout isKindOfClass:[UICollectionViewFlowLayout class]]) {
        UICollectionViewFlowLayout * layout = (UICollectionViewFlowLayout *)collectionViewLayout;
        return layout.minimumLineSpacing;
    }
    return 0;
}

//动态设置每列的间距大小
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    id<CHGCollectionViewSupplementaryElementModelProtocol> supplementaryElementModelProtocol =
    [self headerFooterDataWithrSupplementaryElementOfKind:UICollectionElementKindSectionHeader indexPath:[NSIndexPath indexPathForRow:0 inSection:section]];
    if ([supplementaryElementModelProtocol respondsToSelector:@selector(collectionView:layout:minimumInteritemSpacingForSectionAtIndex:)]) {
        return [supplementaryElementModelProtocol collectionView:collectionView
                                                          layout:collectionViewLayout
                        minimumInteritemSpacingForSectionAtIndex:section];
    } else if([collectionViewLayout isKindOfClass:[UICollectionViewFlowLayout class]]) {
        UICollectionViewFlowLayout * layout = (UICollectionViewFlowLayout *)collectionViewLayout;
        return layout.minimumInteritemSpacing;
    }
    return 0;
}

#pragma mark 设置view大小
///动态设置某个分区头视图大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    id<CHGCollectionViewSupplementaryElementModelProtocol> supplementaryElementModelProtocol =
    [self headerFooterDataWithrSupplementaryElementOfKind:UICollectionElementKindSectionHeader
                                                indexPath:[NSIndexPath indexPathForRow:0 inSection:section]];
    if ([supplementaryElementModelProtocol respondsToSelector:@selector(collectionView:layout:referenceSizeForHeaderInSection:)]) {
        return [supplementaryElementModelProtocol collectionView:collectionView
                                                          layout:collectionViewLayout
                                 referenceSizeForHeaderInSection:section];
    } else if ([collectionViewLayout isKindOfClass:[UICollectionViewFlowLayout class]]){
        UICollectionViewFlowLayout * layout = (UICollectionViewFlowLayout *)collectionViewLayout;
        return layout.headerReferenceSize;
    }
    
    return CGSizeMake(collectionView.frame.size.width, 30);
}

///动态设置每个Item的尺寸大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    id<CHGCollectionViewCellModelProtocol> cellModelProtocol = [self cellDataWithIndexPath:indexPath collectionView:collectionView];
    if ([cellModelProtocol respondsToSelector:@selector(collectionView:layout:sizeForItemAtIndexPath:)]) {
        return [cellModelProtocol collectionView:collectionView
                                          layout:collectionViewLayout
                          sizeForItemAtIndexPath:indexPath];
    } else if ([collectionViewLayout isKindOfClass:[UICollectionViewFlowLayout class]]){
        UICollectionViewFlowLayout * layout = (UICollectionViewFlowLayout *)collectionViewLayout;
        return layout.itemSize;
    }
    return CGSizeMake(30, 30);
}

//动态设置某个分区尾视图大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    id<CHGCollectionViewSupplementaryElementModelProtocol> supplementaryElementModelProtocol =
    [self headerFooterDataWithrSupplementaryElementOfKind:UICollectionElementKindSectionFooter indexPath:[NSIndexPath indexPathForRow:0 inSection:section]];
    if ([supplementaryElementModelProtocol respondsToSelector:@selector(collectionView:layout:referenceSizeForFooterInSection:)]) {
        return [supplementaryElementModelProtocol collectionView:collectionView layout:collectionViewLayout referenceSizeForFooterInSection:section];
    } else if ([collectionViewLayout isKindOfClass:[UICollectionViewFlowLayout class]]){
        UICollectionViewFlowLayout * layout = (UICollectionViewFlowLayout *)collectionViewLayout;
        return layout.footerReferenceSize;
    }
    return CGSizeMake(collectionView.frame.size.width, 30);
}

- (NSString *)subDataKeyPathWithIndexPath:(NSIndexPath *)indexPath targetView:(UIScrollView *)targetView {
    id sectionData = self.adapterData.cellDatas[indexPath.section];
    if ([sectionData conformsToProtocol:@protocol(CHGCollectionViewSupplementaryElementModelProtocol)]) {//遵守了协议
        if ([sectionData respondsToSelector:@selector(subDataKeyPathWithIndexPath:collectionView:)]) {
            id<CHGCollectionViewSupplementaryElementModelProtocol> supplementaryElementModelProtocol = sectionData;
            NSString * keyPath = [supplementaryElementModelProtocol subDataKeyPathWithIndexPath:indexPath
                                                                                 collectionView:(UICollectionView*)targetView];
            return keyPath.length == 0 ? [super subDataKeyPathWithIndexPath:indexPath targetView:targetView] : keyPath;
        }
    }
    return [super subDataKeyPathWithIndexPath:indexPath targetView:targetView];
}

@end
