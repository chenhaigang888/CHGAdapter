//
//  CHGTableViewHeaderFooterLifeCycle.h
//  CHGAdapter
//
//  Created by DNAER5 on 2019/5/25.
//  Copyright © 2019 chen haiGang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHGTableViewAdapterDefine.h"
#import "CHGTableViewAdapter.h"
#import "CHGViewPropertyProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@protocol CHGTableViewHeaderFooterLifeCycleProtocol <CHGViewPropertyProtocol>

@property(nonatomic,assign) NSInteger section;
@property(nonatomic,assign) CHGTableViewHeaderFooterViewType type;

/**
 必须重写这个方法 子类应该在这个方法中给HeaderFooterView中的各个view设定value
 @param section 当前HeaderFooterView在UITableView中的位置
 @param tableView 当前HeaderFooterView所在的UITableView
 @param data 当前HeaderFooterView的数据
 @param type 当前类型是header或者footer
 */
-(void)headerFooterForSection:(NSInteger)section inTableView:(UITableView*)tableView withData:(id)data type:(CHGTableViewHeaderFooterViewType)type;

/**
 将要复用
 
 @param identifier identifier
 */
-(void)headerFooterViewWillReuseWithIdentifier:(NSString *)identifier;

/**
 headerFooterView将要显示
 */
-(void)headerFooterViewWillAppearWithType:(CHGTableViewHeaderFooterViewType)type;

/**
 headerFooterView已经消失
 */
-(void)headerFooterViewDidDisAppearWithType:(CHGTableViewHeaderFooterViewType)type;

@end

NS_ASSUME_NONNULL_END
