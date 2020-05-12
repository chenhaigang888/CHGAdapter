//
//  GoodsCategoryCollectionReusableView.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/9/12.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "GoodsCategoryCollectionReusableView.h"
#import "GoodsCategoryModel.h"

@implementation GoodsCategoryCollectionReusableView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)reusableViewForCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath kind:(NSString *)kind model:(id)model eventTransmissionBlock:(nonnull CHGEventTransmissionBlock)eventTransmissionBlock{
    
    [super reusableViewForCollectionView:collectionView indexPath:indexPath kind:kind model:model eventTransmissionBlock:eventTransmissionBlock];
    GoodsCategoryModel * dataModel = model;
    self.title.text = dataModel.name;
}
@end
