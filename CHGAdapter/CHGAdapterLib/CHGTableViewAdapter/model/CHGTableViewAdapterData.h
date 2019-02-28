//
//  CHGTableViewAdapterData.h
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/10.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Adapter 的数据
 */
@interface CHGTableViewAdapterData : NSObject

/**
 存放所有cell的数据
 cellDatas中的数据可以放2种类型
 1.cellDatas中的数据是数组类型，
 例如 cellDatas = @[
 @[],
 @[],
 @[]
 ];
 
 2.cellDatas中的数据为字典类型
 例如 cellDatas = @[
 @{},
 @{},
 @{},
 @{},
 ];
 3.cellDatas中的数据为model
 例如 cellDatas = @[
 model1,
 model2,
 model3,
 model4,
 ];
 如果 cellDatas中的数据是model，model的类型可以相同也可以不同。
 */
@property(nonatomic,copy) NSArray * cellDatas;

/**
 存放所有header的数据
 */
@property(nonatomic,copy) NSArray * headerDatas;

/**
 存放所有footer的数据
 */
@property(nonatomic,copy) NSArray * footerDatas;

/**
 存放索引数据
 */
@property(nonatomic,copy) NSArray * indexDatas;

/**
 自定义数据,可以通过此参数保留一些数据，方便在Adapter中、cell、headerView、footerView中获取这些数据
 */
@property(nonatomic,strong) id customData;

@end
