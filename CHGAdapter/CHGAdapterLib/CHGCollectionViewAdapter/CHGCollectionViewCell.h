//
//  CHGCollectionViewCell.h
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/15.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICollectionView+CHGCollectionViewAdapter.h"

@interface CHGCollectionViewCell : UICollectionViewCell

@property(nonatomic,copy) CHGEventTransmissionBlock eventTransmissionBlock;
@property(nonatomic,strong) NSIndexPath * indexPath;
@property(nonatomic,weak) UICollectionView * collectionView;
@property(nonatomic,strong) id cellData;

/**
 获取当前Adapter的tag
 
 @return 返回tag
 */
-(NSInteger)adapterTag;

/**
 获取AdapterData中的customData
 
 @return 获取AdapterData中的customData
 */
-(id)customData;

/**
 返回当前cell所在的controller
 
 @return 返回当前cell所在的controller
 */
-(UIViewController*)controller;

/**
 必须重写这个方法 子类应该在这个方法中给cell中的各个view设定value
 @param indexPath 当前cell在UITableView中的位置
 @param collectionView 当前cell所在的UICollectionView
 @param data 当前Cell的数据
 */
-(void)cellForRowAtIndexPath:(NSIndexPath *)indexPath collectionView:(UICollectionView*)collectionView withData:(id)data NS_REQUIRES_SUPER;


/**
 将被复用
 
 @param identifier identifier
 @param indexPath indexPath
 */
-(void)willReuseWithIdentifier:(NSString*)identifier indexPath:(NSIndexPath*)indexPath;

/**
 cell将要显示
 */
-(void)cellWillAppear;

/**
 cell已经消失
 */
-(void)cellDidDisappear;

@end
