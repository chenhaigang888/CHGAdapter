//
//  UICollectionView+CHGCollectionViewAdapter.h
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/14.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHGTableViewAdapterDefine.h"
@class CHGCollectionViewAdapter;
@class CHGCollectionViewEmptyDataShow;

typedef void(^CHGCollectionViewDidSelectItemAtIndexPathBlock)(UICollectionView * collectionView,NSIndexPath * indexPath, id itemData);

@interface UICollectionView (CHGCollectionViewAdapter)

@property(nonatomic,weak) CHGCollectionViewAdapter * collectionViewAdapter;
///HeaderView、FooterView、Cell中的点击、触摸、输入等相关事件通过此block回传到ViewController中
@property(nonatomic,copy) CHGEventTransmissionBlock eventTransmissionBlock;
///当页面没有数据的时候的显示配置
@property(nonatomic,strong) CHGCollectionViewEmptyDataShow * collectionViewEmptyDataShow;
///collectionView item 点击时候的回调
@property(nonatomic,copy) CHGCollectionViewDidSelectItemAtIndexPathBlock collectionViewDidSelectItemAtIndexPathBlock;

///设置没有数据的显示
-(void)setEmptyDataShowWithTitle:(NSString*)title image:(NSString*)imageName;

@end
