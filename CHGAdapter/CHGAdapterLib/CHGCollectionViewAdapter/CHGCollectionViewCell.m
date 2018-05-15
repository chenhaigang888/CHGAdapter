//
//  CHGCollectionViewCell.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/15.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "CHGCollectionViewCell.h"

@implementation CHGCollectionViewCell



-(void)cellForRowAtIndexPath:(NSIndexPath *)indexPath collectionView:(UICollectionView*)collectionView withData:(id)data {
    self.indexPath = indexPath;
    self.collectionView = collectionView;
    self.cellData = data;
}

@end
