//
//  CHGTableViewCell.h
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/10.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITableView+CHGTableViewAdapter.h"

@interface CHGTableViewCell : UITableViewCell

@property(nonatomic,copy) CHGEventTransmissionBlock eventTransmissionBlock;
@property(nonatomic,strong) NSIndexPath * indexPath;
@property(nonatomic,weak) UITableView * tableView;
@property(nonatomic,strong) id cellData;


/**
 初始化子view
 */
-(void)setUpSubviews;

/**
 布局子view
 */
-(void)setLayout;

/**
 必须重写这个方法 子类应该在这个方法中给cell中的各个view设定value
 @param indexPath 当前cell在UITableView中的位置
 @param tableView 当前cell所在的UITableView
 @param data 当前Cell的数据
 */
-(void)cellForRowAtIndexPath:(NSIndexPath *)indexPath tableView:(UITableView*)tableView withData:(id)data NS_REQUIRES_SUPER;

@end
