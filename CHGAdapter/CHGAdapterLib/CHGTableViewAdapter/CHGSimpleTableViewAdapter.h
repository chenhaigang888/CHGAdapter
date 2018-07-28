//
//  CHGSimpleTableViewAdapter.h
//  CHGAdapter
//
//  Created by chen haiGang on 2018/7/28.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "CHGTableViewAdapter.h"

/**
 cell的Model需要实现的协议
 */
@protocol CHGTableViewCellModelProtocol <NSObject>

/**
 绑定一个cell 类

 @return 返回类名
 */
-(NSString*)getCellClass;

/**
 返回当前cell的高度

 @return cell、headerFooter的高度
 */
-(CGFloat)getCellHeigh;

@end

/**
 header footer的model需要实现的协议
 */
@protocol CHGTableViewHeaderFooterModelProtocol <NSObject>

/**
 绑定一个cell、headerFooter 类

 @return 返回类名
 */
-(NSString*)getHeaderFooterClass;

/**
 返回当前headerFooter的高度

 @return headerFooter的高度
 */
-(CGFloat)getHeaderFooterHeigh;

@end

/**
 简单的adapter，此adapter为使用TableView进行页面布局而使用，使用此adapter 需要cellData实现CHGTableViewCellModelProtocol协议，headerData和footerData需要实现CHGTableViewHeaderFooterModelProtocol协议
 */
@interface CHGSimpleTableViewAdapter : CHGTableViewAdapter

@end
