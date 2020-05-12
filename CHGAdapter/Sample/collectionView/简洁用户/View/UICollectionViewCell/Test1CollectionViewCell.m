//
//  Test1CollectionViewCell.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/8/17.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "Test1CollectionViewCell.h"

@implementation Test1CollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

//- (void)cellForRowAtIndexPath:(NSIndexPath *)indexPath collectionView:(UICollectionView *)collectionView model:(id)model {
//    [super cellForRowAtIndexPath:indexPath collectionView:collectionView withData:data];
//}

- (void)cellForRowAtIndexPath:(NSIndexPath *)indexPath targetView:(UIView *)targetView model:(id)model eventTransmissionBlock:(nonnull CHGEventTransmissionBlock)eventTransmissionBlock{
    [super cellForRowAtIndexPath:indexPath targetView:targetView model:model eventTransmissionBlock:eventTransmissionBlock];
    
}

@end
