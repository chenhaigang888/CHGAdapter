//
//  Sample2CollectionViewCell.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/15.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "Sample2CollectionViewCell.h"

@implementation Sample2CollectionViewCell


-(void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.title = [[UILabel alloc] init];
    [self addSubview:self.title];
    self.title.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    self.title.textAlignment = NSTextAlignmentCenter;
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
