//
//  CountryModel.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/9/12.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "CountryModel.h"

@implementation CityModel

+ (instancetype)initWithName:(NSString *)name {
    CityModel * model = [CityModel new];
    model.name = name;
    return model;
}

- (NSString *)cellClassNameInTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    return @"CityTableViewCell";
}

- (CGFloat)cellHeighInTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    return -1;
}

- (NSString *)cellClassNameInCollectionView:(UICollectionView *)collectionView atIndexPath:(NSIndexPath *)indexPath {
    return @"CityCollectionViewCell";
}

@end

@implementation CountryModel

+(instancetype)initWithName:(NSString*)name citys:(NSArray<CityModel*>*)citys {
    CountryModel * model = [CountryModel new];
    model.name = name;
    model.citys = citys;
    return model;
}

- (NSString *)headerFooterClassInTableView:(UITableView *)tableView section:(NSInteger)section type:(CHGAdapterViewType)type {
    return @"CountryHeaderFooterView";
}

- (CGFloat)headerFooterHeighInTableView:(UITableView *)tableView section:(NSInteger)section type:(CHGAdapterViewType)type {
    return 30;
}

- (NSString *)subDataKeyPathWithIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView {
    return @"citys";
}

- (NSString *)reusableViewInCollectionView:(UICollectionView *)collectionView supplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    return @"CountryCollectionReusableView";
}

- (NSString *)subDataKeyPathWithIndexPath:(NSIndexPath *)indexPath collectionView:(UICollectionView *)collectionView {
    return @"citys";
}


@end
