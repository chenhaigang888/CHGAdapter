//
//  SampleHeaderCollectionReusableView.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/15.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "SampleHeaderCollectionReusableView.h"

@implementation SampleHeaderCollectionReusableView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(void)reusableViewForCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath kind:(NSString *)kind model:(id)model eventTransmissionBlock:(nonnull CHGEventTransmissionBlock)eventTransmissionBlock{
    [super reusableViewForCollectionView:collectionView indexPath:indexPath kind:kind model:model eventTransmissionBlock:eventTransmissionBlock];
    [self.btn setTitle:model forState:UIControlStateNormal];
}

-(IBAction)btnTap:(id)sender {
    self.eventTransmissionBlock(self, self.model, 1, ^id(id data) {
       
        return nil;
    });
}

@end
