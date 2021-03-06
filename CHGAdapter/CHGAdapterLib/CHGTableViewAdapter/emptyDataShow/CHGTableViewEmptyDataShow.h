//
//  CHGTableViewEmptyDataShow.h
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/11.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIScrollView+EmptyDataSet.h"

typedef void(^CHGEmptyDataDidTapViewBlock)(UIScrollView * _Nullable scrollView,UIView * _Nullable view);
typedef void(^CHGEmptyDataDidTapButtonBlock)(UIScrollView * _Nullable scrollView,UIButton * _Nullable button);

/**
 定义没有数据时候的简单显示及操作，如需更多功能可扩展此类以及实现DZNEmptyDataSetSource,DZNEmptyDataSetDelegate中的方法
 */
@interface CHGTableViewEmptyDataShow : NSObject<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

/**
 没有内容时候显示的提示图片
 */
@property(nonatomic,strong) NSString * _Nullable imageName;

/**
没有内容时候显示的提示文本
*/
@property(nonatomic,strong) NSAttributedString * _Nullable titleAttributedText;

/**
 没有内容时候显示的提示文本
 */
@property(nonatomic,strong) NSString * _Nullable title;

///文字颜色
@property (nonatomic, strong) UIColor * _Nullable titleColor;

///文字font
@property (nonatomic, strong) UIFont * _Nullable titleFont;

/**
 没有数据提示内容的纵向偏移量
 */
@property(nonatomic,assign) CGFloat verticalOffset;//垂直偏移量

/**
 没有数据的时候是否可以滚动
 */
@property(nonatomic,assign) BOOL emptyDataSetShouldAllowScroll;

/**
 没有数据的时候点击提示内容的回调
 */
@property(nonatomic,copy) CHGEmptyDataDidTapViewBlock _Nullable emptyDataDidTapViewBlock;

/**
 没有数据的时候点击按钮的回调
 */
@property(nonatomic,copy) CHGEmptyDataDidTapButtonBlock _Nullable emptyDataDidTapButtonBlock;

@end
