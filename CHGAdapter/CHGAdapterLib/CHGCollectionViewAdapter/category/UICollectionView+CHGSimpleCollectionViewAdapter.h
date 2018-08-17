//
//  UICollectionView+CHGSimpleCollectionViewAdapter.h
//  CHGAdapter
//
//  Created by chen haiGang on 2018/8/17.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHGSimpleCollectionViewAdapter.h"
@class CHGCollectionViewAdapterData;

@interface UICollectionView (CHGSimpleCollectionViewAdapter)

@property(nonatomic,strong) CHGCollectionViewAdapterData * adapterData;
@property(nonatomic,strong) NSArray * cellDatas;
@property(nonatomic,strong) NSArray * headerDatas;
@property(nonatomic,strong) NSArray * footerDatas;
@property(nonatomic,strong) id customData;

@end
