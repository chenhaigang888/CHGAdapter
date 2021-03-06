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

@protocol CHGCollectionReusableViewLifeCycleProtocol <CHGViewProtocol>




-(void)reusableViewForCollectionView:(UICollectionView*)collectionView indexPath:(NSIndexPath*)indexPath kind:(NSString*)kind model:(id)model eventTransmissionBlock:(CHGEventTransmissionBlock)eventTransmissionBlock;

/**
 将被复用
 
 @param identifier identifier
 @param indexPath indexPath
 */
-(void)reusableViewWillReuseWithIdentifier:(NSString*)identifier indexPath:(NSIndexPath*)indexPath;

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
