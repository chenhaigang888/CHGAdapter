//
//  Test2ReuseableViewModel.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/8/17.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "Test2ReuseableViewModel.h"

@implementation Test2ReuseableViewModel

- (NSString *)reusableViewInCollectionView:(UICollectionView *)collectionView supplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    return @"Test2CollectionReusableView";
}

@end
