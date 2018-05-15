//
//  CHGCollectionViewCell.h
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/15.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITableView+CHGTableViewAdapter.h"

@interface CHGCollectionViewCell : UICollectionViewCell

@property(nonatomic,copy) CHGEventTransmissionBlock eventTransmissionBlock;
@property(nonatomic,strong) NSIndexPath * indexPath;
@property(nonatomic,weak) UICollectionView * collectionView;
@property(nonatomic,strong) id cellData;

/**
 必须重写这个方法 子类应该在这个方法中给cell中的各个view设定value
 @param indexPath 当前cell在UITableView中的位置
 @param collectionView 当前cell所在的UICollectionView
 @param data 当前Cell的数据
 */
-(void)cellForRowAtIndexPath:(NSIndexPath *)indexPath collectionView:(UICollectionView*)collectionView withData:(id)data NS_REQUIRES_SUPER;

@end
