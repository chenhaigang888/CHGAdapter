//
//  Sample1CollectionViewCell.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/15.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "Sample1CollectionViewCell.h"
#import "CHGCollectionViewAdapter.h"

@implementation Sample1CollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.textField addTarget:self action:@selector(textFieldInput:) forControlEvents:UIControlEventEditingChanged];
}

-(void)cellForRowAtIndexPath:(NSIndexPath *)indexPath collectionView:(UICollectionView *)collectionView withData:(id)data {
    [super cellForRowAtIndexPath:indexPath collectionView:collectionView withData:data];
    [self.btn setTitle:[NSString stringWithFormat:@"%@",data] forState:UIControlStateNormal];
    self.textField.text = collectionView.collectionViewAdapter.adapterData.customData[indexPath];
}

-(IBAction)btnTap:(id)sender {
    __weak typeof(self) weakSelf = self;
    self.eventTransmissionBlock(self, self.cellData, 1, ^id(id data) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf.btn setTitle:data forState:UIControlStateNormal];
        return nil;
    });
}

-(void)textFieldInput:(id)sender {
    self.collectionView.collectionViewAdapter.adapterData.customData[self.indexPath] = self.textField.text;
    self.eventTransmissionBlock(self, self.textField.text, 2, nil);
}

@end
