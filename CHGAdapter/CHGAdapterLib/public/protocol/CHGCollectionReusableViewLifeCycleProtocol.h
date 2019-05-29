//
//  CHGCollectionReusableViewLifeCycleProtocol.h
//  CHGAdapter
//
//  Created by DNAER5 on 2019/5/25.
//  Copyright © 2019 chen haiGang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHGTableViewAdapterDefine.h"
#import "CHGViewPropertyProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@protocol CHGCollectionReusableViewLifeCycleProtocol <CHGViewPropertyProtocol>

//@property(nonatomic,copy) CHGEventTransmissionBlock eventTransmissionBlock;
//@property(nonatomic,weak) UICollectionView * collectionView;
@property(nonatomic,strong) NSIndexPath * indexPath;
@property(nonatomic,copy) NSString * kind;
//@property(nonatomic,strong) id reusableViewData;
//@property(nonatomic,strong) NSMutableArray<CHGCollectionReusableViewLifeCycleProtocol> * collectionReusableViewLifeCycleProtocols;

-(void)reusableViewForCollectionView:(UICollectionView*)collectionView indexPath:(NSIndexPath*)indexPath kind:(NSString*)kind reusableViewData:(id)reusableViewData;

/**
 将被复用
 
 @param identifier identifier
 @param indexPath indexPath
 */
-(void)willReuseWithIdentifier:(NSString*)identifier indexPath:(NSIndexPath*)indexPath;

/**
 cell将要显示
 */
-(void)reusableViewWillAppear;

/**
 cell已经消失
 */
-(void)reusableViewDidDisappear;

@end

NS_ASSUME_NONNULL_END
