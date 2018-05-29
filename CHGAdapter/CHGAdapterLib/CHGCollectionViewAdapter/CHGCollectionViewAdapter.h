//
//  CHGCollectionViewAdapter.h
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/14.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHGCollectionViewAdapterData.h"
#import "UICollectionView+CHGCollectionViewAdapter.h"

@protocol CHGCollectionAdapterProtocol<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

/**
 返回CHGCollectionViewCell子类的类名

 @param data indexPath的数据
 @param collectionView collectionView
 @param indexPath indexPath
 @return 返回CHGCollectionViewCell子类的类名
 */
-(NSString*)obtainCellNameWithCellData:(id)data collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;

/**
 返回CHGCollectionReusableView子类类名

 @param data 当前indexPath的数据
 @param collectionView collectionView
 @param kind 判断当前是Header还是Footer的View
 @param indexPath indexPath
 @return 返回CHGCollectionReusableView子类类名
 */
- (NSString *)obtainSupplementaryElementNameWithCellData:(id)data collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath;

@end

/**
 UICollectionView的Adapter
 */
@interface CHGCollectionViewAdapter : NSObject<CHGCollectionAdapterProtocol>

@property(nonatomic,strong) CHGCollectionViewAdapterData * adapterData;
@property(nonatomic,copy) NSString * rowsOfSectionKeyName;

@property(nonatomic,copy) NSString * cellName;
@property(nonatomic,copy) NSString * sectionHeaderName;
@property(nonatomic,copy) NSString * sectionFooterName;
@property(nonatomic,assign) NSInteger tag;
@property(nonatomic,weak) UIViewController * controller;

@end
