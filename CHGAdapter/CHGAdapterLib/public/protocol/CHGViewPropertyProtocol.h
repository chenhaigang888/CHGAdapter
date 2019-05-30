//
//  CHGViewPropertyProtocol.h
//  CHGAdapter
//
//  Created by DNAER5 on 2019/5/29.
//  Copyright © 2019 chen haiGang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CHGViewPropertyProtocol <NSObject>

///当前数据可通过此block向外部传递
@property(nonatomic,copy) CHGEventTransmissionBlock eventTransmissionBlock;
///当前所在的父view。cell的父view为tableView、collectionView。
@property(nonatomic,weak) UIView * targetView;
///当前cell、headerFooter、view需要显示的数据
@property(nonatomic,strong) id model;
///根据类型不一样存储不同的协议
@property(nonatomic,strong) NSMutableArray * protocols;

@end

NS_ASSUME_NONNULL_END
