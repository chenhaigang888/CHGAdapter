//
//  CHGCellLifeCycleProtocol.h
//  CHGAdapter
//
//  Created by DNAER5 on 2019/5/23.
//  Copyright © 2019 chen haiGang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHGTableViewAdapterDefine.h"
#import "CHGViewPropertyProtocol.h"

NS_ASSUME_NONNULL_BEGIN

/**
 cell的生命周期协议
 */
@protocol CHGViewLifeCycleProtocol <CHGViewPropertyProtocol>

@required

//@property(nonatomic,copy) CHGEventTransmissionBlock eventTransmissionBlock;//当前数据可通过此block向外部传递
@property(nonatomic,strong) NSIndexPath * indexPath;//当前cell的indexPath信息
//@property(nonatomic,weak) UIView * targetView;//当前所在的父view。cell的父view为tableView、collectionView。
//@property(nonatomic,strong) id cellData;//当前cell需要显示的数据
//@property(nonatomic,strong) NSMutableArray<CHGViewLifeCycleProtocol> * viewLifeCycleProtocols;




/**
 必须重写这个方法 子类应该在这个方法中给cell中的各个view设定value
 @param indexPath 当前cell在UITableView中的位置
 @param targetView 当前cell所在的UITableView、UICollectionView
 @param data 当前Cell的数据
 */
-(void)cellForRowAtIndexPath:(NSIndexPath *)indexPath targetView:(UIView*)targetView withData:(id)data;

/**
 将被复用
 
 @param identifier identifier
 */
-(void)cellWillReuseWithIdentifier:(NSString*)identifier;

/**
 将被复用
 
 @param identifier identifier
 @param indexPath indexPath
 */
-(void)cellWillReuseWithIdentifier:(NSString*)identifier indexPath:(NSIndexPath*)indexPath;

/**
 cell将要显示
 */
-(void)cellWillAppear;

/**
 cell已经消失
 */
-(void)cellDidDisappear;

@end

NS_ASSUME_NONNULL_END
