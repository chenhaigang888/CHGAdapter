//
//  UITableView+CHGTableViewAdapter.h
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/10.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHGTableViewAdapter.h"
#import "CHGTableViewAdapterDefine.h"
#import "CHGScrollViewDelegate.h"
@class CHGTableViewEmptyDataShow;
@class CHGTableViewAdapter;

/**
 此block对应UITableViewDelegate 中的tableView:didSelectRowAtIndexPath:方法

 @param tableView 当前tableView
 @param indexPath 当前点击的indexPath
 @param itemData 当前Cell对应的数据
 */
typedef void(^CHGTableViewDidSelectRowBlock)(UITableView * tableView, NSIndexPath * indexPath, id itemData);

typedef void(^CHGTableViewCommitEditForRowBlock)(UITableView * tableView, UITableViewCellEditingStyle editingStyle, NSIndexPath *indexPath, id itemData);

typedef void(^CHGTableViewDidEndEditingBlock)(UITableView * tableView, NSIndexPath *indexPath, id itemData);

typedef void(^CHGTableViewWillBeginEditingBlock)(UITableView * tableView, NSIndexPath *indexPath, id itemData);

@interface UITableView (CHGTableViewAdapter)

///tableView的adapter
@property(nonatomic,strong) CHGTableViewAdapter * tableViewAdapter;
///HeaderView、FooterView、Cell中的点击、触摸、输入等相关事件通过此block回传到ViewController中
@property(nonatomic,copy) CHGEventTransmissionBlock eventTransmissionBlock;
///tableView 点击cell会通过此block回传数据
@property(nonatomic,copy) CHGTableViewDidSelectRowBlock tableViewDidSelectRowBlock;
@property(nonatomic,copy) CHGTableViewCommitEditForRowBlock tableViewCommitEditForRowBlock;
@property(nonatomic,copy) CHGTableViewDidEndEditingBlock tableViewDidEndEditingBlock;
@property(nonatomic,copy) CHGTableViewWillBeginEditingBlock tableViewWillBeginEditingBlock;

///当页面没有数据的时候的显示配置
@property(nonatomic,strong) CHGTableViewEmptyDataShow * tableViewEmptyDataShow;
///所有的滚动视图
@property (atomic, copy) NSArray<id<CHGScrollViewDelegate>> *scrollViewDelegates;
///设置没有数据的显示
-(void)setEmptyDataShowWithTitle:(NSString*)title image:(NSString*)imageName;

/**
 隐藏头部
 */
-(void)hiddHeadView;

/**
 隐藏底部
 */
-(void)hiddenFooterView;

/**
 自适应高度
 */
-(void)autoHeight;

///添加滚动监听
-(void)addCHGScrollViewDelegate:(id<CHGScrollViewDelegate>)scrollViewDelegate;
///移除滚动监听
-(void)removeCHGScrollViewDelegate:(id<CHGScrollViewDelegate>)scrollViewDelegate;

@end
