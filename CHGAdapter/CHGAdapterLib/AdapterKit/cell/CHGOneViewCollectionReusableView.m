//
//  CHGOneViewCollectionReusableView.m
//  CHGAdapter
//
//  Created by 陈 海刚 on 2019/3/10.
//  Copyright © 2019 chen haiGang. All rights reserved.
//

#import "CHGOneViewCollectionReusableView.h"

@implementation CHGOneViewCollectionReusableView

- (void)reusableViewForCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath kind:(NSString *)kind reusableViewData:(id)reusableViewData {
    [super reusableViewForCollectionView:collectionView indexPath:indexPath kind:kind reusableViewData:reusableViewData];
    UIView * view = reusableViewData;
    [self addSubview:view];
}

@end
