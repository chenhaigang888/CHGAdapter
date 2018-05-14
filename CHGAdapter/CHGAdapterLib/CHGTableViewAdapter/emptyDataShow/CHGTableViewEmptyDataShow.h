//
//  CHGTableViewEmptyDataShow.h
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/11.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIScrollView+EmptyDataSet.h"


@interface CHGTableViewEmptyDataShow : NSObject<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

@property(nonatomic,strong) NSString * _Nullable imageName;
@property(nonatomic,strong) NSString * _Nullable title;
@property(nonatomic,assign) CGFloat verticalOffset;//垂直偏移量
@property(nonatomic,assign) BOOL emptyDataSetShouldAllowScroll;

//+(_Nonnull instancetype) sharedInstance;
//+(_Nonnull instancetype) alloc __attribute__((unavailable("alloc not available, call sharedInstance instead")));
//-(_Nonnull instancetype) init __attribute__((unavailable("init not available, call sharedInstance instead")));
//+(_Nonnull instancetype) new __attribute__((unavailable("new not available, call sharedInstance instead")));

@end
