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

-(void)cellForRowAtIndexPath:(NSIndexPath *)indexPath collectionView:(UICollectionView *)collectionView withData:(id)data {
    [super cellForRowAtIndexPath:indexPath collectionView:collectionView withData:data];
    self.title.text = data;
}

@end
