//
//  CHGSimpleTableViewAdapter.h
//  CHGAdapter
//
//  Created by chen haiGang on 2018/7/28.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "CHGTableViewAdapter.h"
#import "CHGTableViewAdapter.h"

#define CHGTableViewDeprecated(instead) DEPRECATED_MSG_ATTRIBUTE(" Use " # instead " instead")

/**
 cell的Model需要实现的协议
 */
@protocol CHGTableViewCellModelProtocol <NSObject>


@required
/**
 绑定一个cell 类
 
 @return 返回类名
 */
-(NSString*)cellClassNameInTableView:(UITableView*)tableView indexPath:(NSIndexPath*)indexPath;

/**
 返回当前cell的高度
 
 @return cell、headerFooter的高度
 */
-(CGFloat)cellHeighInTableView:(UITableView*)tableView indexPath:(NSIndexPath*)indexPath;

@optional
-(NSString*)getCellClass CHGTableViewDeprecated(-cellClassNameInTableView:indexPath);
-(CGFloat)getCellHeigh CHGTableViewDeprecated(-cellHeighInTableView:indexPath);

/// 是否可以编辑
/// @param tableView tableView description
/// @param indexPath indexPath description
-(BOOL)cellCanEditInTableView:(UITableView*)tableView indexPath:(NSIndexPath*)indexPath;

/// 按钮文字
/// @param tableView tableView description
/// @param indexPath indexPath description
-(NSString*)titleForDeleteConfirmationButtonInTableView:(UITableView*)tableView indexPath:(NSIndexPath*)indexPath;

-(UITableViewCellEditingStyle)editingStyleInTableView:(UITableView*)tableView indexPath:(NSIndexPath*)indexPath;

-(NSArray<UITableViewRowAction*>*) editActionsInTableView:(UITableView*)tableView indexPath:(NSIndexPath*)indexPath;

-(BOOL)shouldIndentWhileEditingInTableView:(UITableView*)tableView indexPath:(NSIndexPath*)indexPath;

@end

/**
 header footer的model需要实现的协议
 */
@protocol CHGTableViewHeaderFooterModelProtocol <NSObject>

@required
/**
 绑定一个cell、headerFooter 类
 
 @return 返回类名
 */
-(NSString*)headerFooterClassInTableView:(UITableView*)tableView section:(NSInteger)section type:(CHGAdapterViewType)type;

/**
 返回当前headerFooter的高度
 
 @return headerFooter的高度
 */
-(CGFloat)headerFooterHeighInTableView:(UITableView*)tableView section:(NSInteger)section type:(CHGAdapterViewType)type;

@optional
-(CGFloat)getHeaderFooterHeigh CHGTableViewDeprecated(-headerFooterHeighInTableView:section:type:);
-(NSString*)getHeaderFooterClass CHGTableViewDeprecated(-headerFooterClassInTableView:section:type:);

-(NSString*)subDataKeyPathWithIndexPath:(NSIndexPath*)indexPath tableView:(UITableView*)tableView;

@end

/**
 简单的adapter，此adapter为使用TableView进行页面布局而使用，使用此adapter 需要cellData实现CHGTableViewCellModelProtocol协议，headerData和footerData需要实现CHGTableViewHeaderFooterModelProtocol协议
 */
@interface CHGSimpleTableViewAdapter : CHGTableViewAdapter

@end
