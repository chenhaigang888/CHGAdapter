//
//  CHGCollectionViewAdapterData.h
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/14.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHGCollectionViewAdapterData : NSObject

@property(nonatomic,copy) NSArray * cellDatas;
@property(nonatomic,copy) NSArray * headerDatas;
@property(nonatomic,copy) NSArray * footerDatas;
/**
 自定义数据,可以通过此参数保留一些数据，方便在Adapter中、cell、headerView、footerView中获取这些数据
 */
@property(nonatomic,strong) id customData;

@end
