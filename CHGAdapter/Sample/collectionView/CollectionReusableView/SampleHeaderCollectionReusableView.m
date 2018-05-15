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

-(void)reusableViewForCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath kind:(NSString *)kind reusableViewData:(id)reusableViewData {
    [super reusableViewForCollectionView:collectionView indexPath:indexPath kind:kind reusableViewData:reusableViewData];
    [self.btn setTitle:reusableViewData forState:UIControlStateNormal];
}

-(IBAction)btnTap:(id)sender {
    self.eventTransmissionBlock(self, self.reusableViewData, 1, ^id(id data) {
       
        return nil;
    });
}

@end
