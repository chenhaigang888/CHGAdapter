//
//  GoodsCollectionViewCell.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/9/12.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "GoodsCollectionViewCell.h"
#import "GoodsCategoryModel.h"

@implementation GoodsCollectionViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)cellForRowAtIndexPath:(NSIndexPath *)indexPath collectionView:(UICollectionView *)collectionView withData:(id)data {
    [super cellForRowAtIndexPath:indexPath collectionView:collectionView withData:data];
    GoodsModel * model = data;
    self.title.text = model.name;
}

@end
