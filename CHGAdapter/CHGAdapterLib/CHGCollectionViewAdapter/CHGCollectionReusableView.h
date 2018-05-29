//
//  CHGCollectionReusableView.h
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/15.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITableView+CHGTableViewAdapter.h"

@interface CHGCollectionReusableView : UICollectionReusableView

@property(nonatomic,copy) CHGEventTransmissionBlock eventTransmissionBlock;
@property(nonatomic,weak) UICollectionView * collectionView;
@property(nonatomic,strong) NSIndexPath * indexPath;
@property(nonatomic,copy) NSString * kind;
@property(nonatomic,strong) id reusableViewData;
@property(nonatomic,weak) UIViewController * controller;//当前cell所在的controller

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

-(void)reusableViewForCollectionView:(UICollectionView*)collectionView indexPath:(NSIndexPath*)indexPath kind:(NSString*)kind reusableViewData:(id)reusableViewData;

@end
