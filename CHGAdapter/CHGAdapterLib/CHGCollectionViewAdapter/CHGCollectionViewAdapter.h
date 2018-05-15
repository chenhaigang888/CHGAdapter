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

-(NSString*)obtainCellNameWithCellData:(id)data collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;

- (NSString *)obtainSupplementaryElementNameWithCellData:(id)data collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath;

@end



@interface CHGCollectionViewAdapter : NSObject<CHGCollectionAdapterProtocol>

@property(nonatomic,strong) CHGCollectionViewAdapterData * adapterData;

@property(nonatomic,copy) NSString * rowsOfSectionKeyName;

@property(nonatomic,copy) NSString * cellName;
@property(nonatomic,copy) NSString * sectionHeaderName;
@property(nonatomic,copy) NSString * sectionFooterName;

@end
