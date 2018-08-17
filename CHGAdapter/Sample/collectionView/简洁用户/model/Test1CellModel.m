//
//  Test1CellModel.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/8/17.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "Test1CellModel.h"

@implementation Test1CellModel

- (NSString *)cellClassNameInCollectionView:(UICollectionView *)collectionView atIndexPath:(NSIndexPath *)indexPath {
    return @"Test1CollectionViewCell";
}

///一下方法可以不实现
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.row == 1) {
//        return CGSizeMake(200, 200);
//    }
//    return CGSizeMake(100, 100);
//}

@end
