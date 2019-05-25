//
//  CHGCollectionViewCell.h
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/15.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICollectionView+CHGCollectionViewAdapter.h"
#import "CHGViewLifeCycleProtocol.h"

@interface CHGCollectionViewCell : UICollectionViewCell<CHGViewLifeCycleProtocol>

-(UICollectionView*)getCollectionView;

/**
 初始化子view
 */
-(void)setUpSubviews;

/**
 布局子view
 */
-(void)setLayout;

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

@end
