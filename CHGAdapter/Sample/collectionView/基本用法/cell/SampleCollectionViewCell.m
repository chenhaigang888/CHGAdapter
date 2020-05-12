//
//  SampleCollectionViewCell.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/15.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "SampleCollectionViewCell.h"

@implementation SampleCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

//-(void)cellForRowAtIndexPath:(NSIndexPath *)indexPath collectionView:(UICollectionView *)collectionView model:(id)model {
//    [super cellForRowAtIndexPath:indexPath collectionView:collectionView withData:data];
//    self.title.text = [NSString stringWithFormat:@"%@",data];
//}

- (void)cellForRowAtIndexPath:(NSIndexPath *)indexPath targetView:(UIView *)targetView model:(id)model eventTransmissionBlock:(nonnull CHGEventTransmissionBlock)eventTransmissionBlock{
    [super cellForRowAtIndexPath:indexPath targetView:targetView model:model eventTransmissionBlock:eventTransmissionBlock];
    self.title.text = [NSString stringWithFormat:@"%@",model];
}

@end
