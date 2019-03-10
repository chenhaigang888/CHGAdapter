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
@property(nonatomic, copy) NSString * chg_tableViewCellClassName;
@property(nonatomic, assign) CGFloat chg_tableViewCelllHeight;

@property(nonatomic, copy) NSString * chg_tableViewHeaderClassName;
@property(nonatomic, assign) CGFloat chg_tableViewHeaderHeight;

@property(nonatomic, copy) NSString * chg_tableViewFooterClassName;
@property(nonatomic, assign) CGFloat chg_tableViewFooterHeight;

#pragma - mark CollectionView property
@property(nonatomic, copy) NSString * chg_collectionViewCellClassName;
@property(nonatomic, assign) CGSize chg_collectionViewCellSize;

@property(nonatomic, copy) NSString * chg_collectionViewHeaderClassName;
@property(nonatomic, assign) CGSize chg_collectionViewHeaderSize;

@property(nonatomic, copy) NSString * chg_collectionViewFooterClassName;
@property(nonatomic, assign) CGSize chg_collectionViewFooterSize;

@end

NS_ASSUME_NONNULL_END
