//
//  CHGCollectionReusableView.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/15.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "CHGCollectionReusableView.h"
#import "CHGCollectionViewAdapter.h"

@implementation CHGCollectionReusableView

-(void)reusableViewForCollectionView:(UICollectionView*)collectionView indexPath:(NSIndexPath*)indexPath kind:(NSString*)kind reusableViewData:(id)reusableViewData {
    self.collectionView = collectionView;
    self.indexPath = indexPath;
    self.kind = kind;
    self.reusableViewData = reusableViewData;
}

/**
 获取当前Adapter的tag
 
 @return 返回tag
 */
-(NSInteger)adapterTag {
    return self.collectionView.collectionViewAdapter.tag;
}

/**
 获取AdapterData中的customData
 
 @return 获取AdapterData中的customData
 */
-(id)customData {
    return self.collectionView.collectionViewAdapter.adapterData.customData;
}

/**
 返回当前cell所在的controller
 
 @return 返回当前cell所在的controller
 */
-(UIViewController*)controller {
    return self.collectionView.collectionViewAdapter.controller;
}

@end
