//
//  CHGTableViewAdapter.h
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/10.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHGTableViewAdapterData.h"
#import "UITableView+CHGTableViewAdapter.h"
#import "CHGSubDataOfKeyPathDelegate.h"

///CHGTableViewHeaderFooterView类型
typedef NS_ENUM(NSUInteger, CHGTableViewHeaderFooterViewType) {
    CHGTableViewHeaderFooterViewHeaderType, //tableView的HeaderView
    CHGTableViewHeaderFooterViewFooterType  //tableView的FooterView
};

/**
 UITableViewAdapter协议
 */
@protocol CHGTableViewAdapterProtocol<UITableViewDataSource,UITableViewDelegate,CHGSubDataOfKeyPathDelegate>

@optional
/**
 获取cell的类名
 
 @param data indexPath的数据
 @param tableView tableView对象
 @param indexPath indexPath
 @return 返回indexPath的cell 类名
 */
-(NSString*)obtainCellNameWithCellData:(id)data tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

/**
 获取header的类名
 
 @param data 当前header的数据
 @param tableView tableView对象
 @param section section
 @return 返回section的类名
 */
-(NSString*)obtainHeaderNameWithHeaderData:(id)data tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;

/**
 获取footer的类名
 
 @param data 当前footer的数据
 @param tableView tableView对象
 @param section section
 @return 返回section的类名
 */
-(NSString*)obtainFooterNameWithFooterData:(id)data tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section;

@end



///UITableView的adapter
@interface CHGTableViewAdapter : NSObject<CHGTableViewAdapterProtocol>
///Adapter 的数据
@property(nonatomic,strong) CHGTableViewAdapterData * adapterData;

/**
 当 adapterData中的cellDatas 数据是model或者字典类型，并且字典或者model类型中有一个对象是Array类型，如果想用Array中的数据使用section展示，则可以使用Array类型的Key设置到此参数。
 例如：
 例如 cellDatas = @[
 @{@"orderName":@"订单":@"goods":@[@"goods1",@"goods1"]},
 @{@"orderName":@"订单":@"goods":@[@"goods1",@"goods1"]},
 @{@"orderName":@"订单":@"goods":@[@"goods1",@"goods1"]},
 @{@"orderName":@"订单":@"goods":@[@"goods1",@"goods1"]}
 ];
 这里如果想使用goods字段用一个section展示，则可以设置 rowsOfSectionKeyName = goods；
 */
@property(nonatomic,copy) NSString * keyPathOfSubData;

/**
 如果cell、headerView、footerView都只有一种风格，可以直接通过以下3个参数进行设置，否则可以通过继承CHGTableViewAdapter类重写方法实现 分别是
 obtainCellNameWithCellData:tableView:cellForRowAtIndexPath:（返回Cell的nibName）
 obtainHeaderNameWithHeaderData:tableView:viewForHeaderInSection:（返回HeaderView的nibName）
 obtainFooterNameWithFooterData:tableView:viewForFooterInSection:（返回FooterView的nibName）
 */
@property(nonatomic,copy) NSString * cellName;
@property(nonatomic,copy) NSString * headerName;
@property(nonatomic,copy) NSString * footerName;

/**
 如果cell、headerView、footerView的高度都统一可以通过直接设置以下参数进行设置
 */
@property(nonatomic,assign) CGFloat cellHeight;
@property(nonatomic,assign) CGFloat headerHeight;
@property(nonatomic,assign) CGFloat footerHeight;

/**
 点击cell是否有动画
 */
@property(nonatomic,assign) BOOL tableViewDeselectRowAtIndexPathAnimation;
@property(nonatomic,assign) NSInteger tag;
@property(nonatomic,weak) UIViewController * controller;

/**
 获取cell的data
 
 @param indexPath indexPath
 @return 返回cell的data
 */
-(id)cellDataWithIndexPath:(NSIndexPath*)indexPath tableView:(UITableView*)tableView;

/**
 获取headerFooter的数据
 
 @param type header或者footer类型
 @param section section
 @return 返回headerFooter的数据
 */
-(id)headerFooterDataWithType:(CHGTableViewHeaderFooterViewType)type section:(NSInteger)section;


@end
