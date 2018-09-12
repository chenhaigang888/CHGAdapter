//
//  GoodsCategoryModel.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/9/12.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "GoodsCategoryModel.h"


@implementation GoodsModel

+(instancetype)initWithName:(NSString*)name price:(NSNumber*)price {
    GoodsModel * goods = [GoodsModel new];
    goods.name = name;
    goods.price = price;
    return goods;
}

- (NSString *)cellClassNameInTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    return @"GoodsTableViewCell";
}

- (CGFloat)cellHeighInTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    return -1;
}

- (NSString *)cellClassNameInCollectionView:(UICollectionView *)collectionView atIndexPath:(NSIndexPath *)indexPath {
    return @"GoodsCollectionViewCell";
}

@end

@implementation GoodsCategoryModel

+(instancetype)initWithName:(NSString*)name goods:(NSArray<GoodsModel*>*) goods {
    GoodsCategoryModel * gc = [GoodsCategoryModel new];
    gc.name = name;
    gc.goods = goods;
    return gc;
}

- (NSString *)headerFooterClassInTableViw:(UITableView *)tableView section:(NSInteger)section type:(CHGTableViewHeaderFooterViewType)type {
    return @"GoodsCategoryHeaderFooterView";
}

- (CGFloat)headerFooterHeighInTableViw:(UITableView *)tableView section:(NSInteger)section type:(CHGTableViewHeaderFooterViewType)type {
    return 30;
}

- (NSString *)subDataKeyPathWithIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView {
    return @"goods";
}

- (NSString *)reusableViewInCollectionView:(UICollectionView *)collectionView supplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    return @"GoodsCategoryCollectionReusableView";
}

- (NSString *)subDataKeyPathWithIndexPath:(NSIndexPath *)indexPath collectionView:(UICollectionView *)collectionView {
    return @"goods";
}

@end
