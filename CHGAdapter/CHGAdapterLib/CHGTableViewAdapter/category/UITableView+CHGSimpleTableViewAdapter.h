//
//  UITableView+CHGSimpleTableViewAdapter.h
//  CHGAdapter
//
//  Created by chen haiGang on 2018/7/30.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHGSimpleTableViewAdapter.h"
@class CHGTableViewAdapterData;

@interface UITableView (CHGSimpleTableViewAdapter)

@property(nonatomic,strong) CHGTableViewAdapterData * adapterData;
@property(nonatomic,strong) NSArray * cellDatas;
@property(nonatomic,strong) NSArray * headerDatas;
@property(nonatomic,strong) NSArray * footerDatas;
@property(nonatomic,strong) NSArray * indexDatas;
@property(nonatomic,strong) id customData;

@end
