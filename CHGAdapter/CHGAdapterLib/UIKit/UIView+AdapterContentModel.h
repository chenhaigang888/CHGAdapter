//
//  UIView+AdapterContentModel.h
//  CHGAdapter
//
//  Created by 陈 海刚 on 2019/3/10.
//  Copyright © 2019 chen haiGang. All rights reserved.
//


//#import "CHGSimpleTableViewAdapter.h"
//#import "CHGTableViewAdapter.h"
#import "CHGAdapter.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (AdapterContentModel)<CHGTableViewCellModelProtocol,CHGTableViewHeaderFooterModelProtocol,CHGCollectionViewCellModelProtocol,CHGCollectionViewSupplementaryElementModelProtocol>
#pragma - mark TableView property
@property(nonatomic, copy) NSString * tableViewCellClassName;
@property(nonatomic, assign) CGFloat tableViewCelllHeight;

@property(nonatomic, copy) NSString * tableViewHeaderClassName;
@property(nonatomic, assign) CGFloat tableViewHeaderHeight;

@property(nonatomic, copy) NSString * tableViewFooterClassName;
@property(nonatomic, assign) CGFloat tableViewFooterHeight;

#pragma - mark CollectionView property
@property(nonatomic, copy) NSString * collectionViewCellClassName;
@property(nonatomic, assign) CGSize collectionViewCellSize;

@property(nonatomic, copy) NSString * collectionViewHeaderClassName;
@property(nonatomic, assign) CGSize collectionViewHeaderSize;

@property(nonatomic, copy) NSString * collectionViewFooterClassName;
@property(nonatomic, assign) CGSize collectionViewFooterSize;

@end

NS_ASSUME_NONNULL_END
