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

@end

@implementation CountryModel

+(instancetype)initWithName:(NSString*)name citys:(NSArray<CityModel*>*)citys {
    CountryModel * model = [CountryModel new];
    model.name = name;
    model.citys = citys;
    return model;
}

- (NSString *)headerFooterClassInTableViw:(UITableView *)tableView section:(NSInteger)section type:(CHGTableViewHeaderFooterViewType)type {
    return @"CountryHeaderFooterView";
}

- (CGFloat)headerFooterHeighInTableViw:(UITableView *)tableView section:(NSInteger)section type:(CHGTableViewHeaderFooterViewType)type {
    return 30;
}

- (NSString *)subDataKeyPathWithIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView {
    return @"citys";
}

@end
