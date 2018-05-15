//
//  TestCollectionAdapter.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/15.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "TestCollectionAdapter.h"

@implementation TestCollectionAdapter

-(NSString*)obtainCellNameWithCellData:(id)data collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section % 2 == 0) {
        return @"SampleCollectionViewCell";
    }
    return @"Sample1CollectionViewCell";
}

@end
