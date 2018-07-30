//
//  UITableView+CHGSimpleTableViewAdapter.h
//  CHGAdapter
//
//  Created by chen haiGang on 2018/7/30.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CHGTableViewAdapterData;

@interface UITableView (CHGSimpleTableViewAdapter)

@property(nonatomic,strong) CHGTableViewAdapterData * adapterData;

@end
