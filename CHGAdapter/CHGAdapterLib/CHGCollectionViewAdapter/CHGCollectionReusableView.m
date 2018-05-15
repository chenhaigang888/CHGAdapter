//
//  CHGCollectionReusableView.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/15.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "CHGCollectionReusableView.h"

@implementation CHGCollectionReusableView

-(void)reusableViewForCollectionView:(UICollectionView*)collectionView indexPath:(NSIndexPath*)indexPath kind:(NSString*)kind reusableViewData:(id)reusableViewData {
    self.collectionView = collectionView;
    self.indexPath = indexPath;
    self.kind = kind;
    self.reusableViewData = reusableViewData;
}

@end
