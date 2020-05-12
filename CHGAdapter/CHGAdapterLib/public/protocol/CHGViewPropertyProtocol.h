//
//  CHGViewPropertyProtocol.h
//  CHGAdapter
//
//  Created by DNAER5 on 2019/5/29.
//  Copyright © 2019 chen haiGang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHGTableViewAdapterDefine.h"
@class CHGViewMappingObject;

NS_ASSUME_NONNULL_BEGIN

@protocol CHGViewPropertyProtocol <NSObject>

///当前数据可通过此block向外部传递
@property(nonatomic,copy) CHGEventTransmissionBlock eventTransmissionBlock;
///当前所在的父view。cell的父view为tableView、collectionView。
@property(nonatomic,weak) UIView * targetView;
///当前cell、headerFooter、view需要显示的数据
@property(nonatomic,strong) id model;
///根据类型不一样存储不同的协议
@property(nonatomic,strong) NSMutableArray<CHGViewMappingObject*> * protocolsVMO;

@property(nonatomic,assign) NSInteger section;

@property(nonatomic,assign) CHGAdapterViewType type;

@property(nonatomic,strong) NSIndexPath * indexPath;

@property(nonatomic,copy) NSString * kind;

@end


@protocol CHGViewProtocol <CHGViewPropertyProtocol>


/// 添加需要自动分配数据的view
/// @param view view必须是实现CHGViewProtocol协议的view或者为CHGBaseView的子类
/// @param mapping   ddd
-(void)addAutoDistributionModelView:(id<CHGViewProtocol>)view mapping:(NSDictionary * _Nullable)mapping;

/// 更换自动分配数据的参数
/// @param index 更换位置，为添加的位置
/// @param view view必须是实现CHGViewProtocol协议的view或者为CHGBaseView的子类
/// @param mapping ddd
-(void)replaceAtIndex:(NSUInteger)index autoDistributionModelView:(id<CHGViewProtocol>)view mapping:(NSDictionary * _Nullable)mapping;

/// 移除指定位置的数据
/// @param index index
-(void)removeAutoDistributionModelViewAtIndex:(NSUInteger)index;

/// 移除所有
-(void)removeAutoDistributionModelView;

@end

NS_ASSUME_NONNULL_END
