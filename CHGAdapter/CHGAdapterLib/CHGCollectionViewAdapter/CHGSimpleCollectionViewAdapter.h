//
//  CHGSimpleCollectionViewAdapter.h
//  CHGAdapter
//
//  Created by chen haiGang on 2018/8/17.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "CHGCollectionViewAdapter.h"

/**
 所有UICollectionView使用CHGSimpleCollectionViewAdapter类中的Model类都应该实现此协议,此协议主要描述model在collectionView中的布局信息及对应的CHGCollectionViewCell,model用在CHGCollectionViewCell中
 
 */
@protocol CHGCollectionViewCellModelProtocol <NSObject>

@required
/**
 如果collectionView registered class 这里的返回结果作为获取CHGCollectionViewCell identifier。如果没有注册过class 这里的结果将作为CHGCollectionViewCell的class进行注册并且以此类的名称作为identifier

 @param collectionView model所在的collectionView的cell中（model可能会存在很多collectionView、collectionViewCell）
 @param indexPath model在collectionView中所处的indexPath
 @return 返回结果将作为class的名称或者identifier
 */
-(NSString*)cellClassNameInCollectionView:(UICollectionView*)collectionView atIndexPath:(NSIndexPath*)indexPath;

@optional

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

@end

/**
 所有UICollectionView使用CHGSimpleCollectionViewAdapter类中的Model类都应该实现此协议,此协议主要描述model在collectionView中的布局信息及对应的CHGCollectionReusableView，model用在CHGCollectionReusableView
 */
@protocol CHGCollectionViewSupplementaryElementModelProtocol <NSObject>

@required
/**
 如果collectionView registerd class ，这里的返回结果作为获取CHGCollectionReusableView的identifier。如果没有注册过class，这里的结果将作为CHGCollectionReusableView的class进行注册并且以此类的名称作为identifier。

 @param collectionView model所在的collectionView的reusableView中（model可能会存在很多collectionView、reusableView）
 @param kind 表示model在collectionView的headerView或者footerView中
 @param indexPath model在collectionView中所处的indexPath
 @return 返回结果将作为class的名称或者identifier
 */
-(NSString*)reusableViewInCollectionView:(UICollectionView*)collectionView supplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath;

@optional

///动态设置某个分区头视图大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section;

//动态设置某个分区尾视图大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section;

///动态设置每个分区的EdgeInsets 不包括header和footer
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;

//动态设置每行的间距大小
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section;

//动态设置每列的间距大小
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section;

-(NSString*)subDataKeyPathWithIndexPath:(NSIndexPath*)indexPath collectionView:(UICollectionView*)collectionView;
@end

@interface CHGSimpleCollectionViewAdapter : CHGCollectionViewAdapter

@end
