//
//  CHGOneViewCollectionReusableView.m
//  CHGAdapter
//
//  Created by 陈 海刚 on 2019/3/10.
//  Copyright © 2019 chen haiGang. All rights reserved.
//

#import "CHGOneViewCollectionReusableView.h"

@implementation CHGOneViewCollectionReusableView

- (void)reusableViewForCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath kind:(NSString *)kind model:(id)model eventTransmissionBlock:(nonnull CHGEventTransmissionBlock)eventTransmissionBlock{
    [super reusableViewForCollectionView:collectionView indexPath:indexPath kind:kind model:model eventTransmissionBlock:eventTransmissionBlock];
    UIView * view = model;
    [self addSubview:view];
}

@end
