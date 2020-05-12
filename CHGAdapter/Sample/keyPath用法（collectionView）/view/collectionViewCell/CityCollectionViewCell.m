//
//  CityCollectionViewCell.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/9/12.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "CityCollectionViewCell.h"
#import "CountryModel.h"

@implementation CityCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

//- (void)cellForRowAtIndexPath:(NSIndexPath *)indexPath collectionView:(UICollectionView *)collectionView model:(id)model {
//    [super cellForRowAtIndexPath:indexPath collectionView:collectionView withData:data];
//    CityModel * model = data;
//    self.title.text = model.name;
//}

- (void)cellForRowAtIndexPath:(NSIndexPath *)indexPath targetView:(UIView *)targetView model:(id)model eventTransmissionBlock:(nonnull CHGEventTransmissionBlock)eventTransmissionBlock{
    [super cellForRowAtIndexPath:indexPath targetView:targetView model:model eventTransmissionBlock:eventTransmissionBlock];
    CityModel * dataModel = model;
    self.title.text = dataModel.name;
}

@end
