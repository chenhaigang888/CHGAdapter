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

- (void)reusableViewForCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath kind:(NSString *)kind reusableViewData:(id)reusableViewData {
    [super reusableViewForCollectionView:collectionView indexPath:indexPath kind:kind reusableViewData:reusableViewData];
    GoodsCategoryModel * model = reusableViewData;
    self.title.text = model.name;
}
@end
