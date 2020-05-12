//
//  CHGOneViewCollectionViewCell.m
//  CHGAdapter
//
//  Created by 陈 海刚 on 2019/3/10.
//  Copyright © 2019 chen haiGang. All rights reserved.
//

#import "CHGOneViewCollectionViewCell.h"

@implementation CHGOneViewCollectionViewCell

//- (void)cellForRowAtIndexPath:(NSIndexPath *)indexPath collectionView:(UICollectionView *)collectionView model:(id)model {
//    [super cellForRowAtIndexPath:indexPath collectionView:collectionView withData:data];
//    UIView * view = data;
//    [self.contentView addSubview:view];
//}



- (void)cellForRowAtIndexPath:(NSIndexPath *)indexPath targetView:(UIView *)targetView model:(id)model eventTransmissionBlock:(CHGEventTransmissionBlock)eventTransmissionBlock{
    [super cellForRowAtIndexPath:indexPath targetView:targetView model:model eventTransmissionBlock:eventTransmissionBlock];
    UIView * view = model;
    [self.contentView addSubview:view];
}

@end
