//
//  CHGTableViewHeaderFooterView.h
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/10.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITableView+CHGTableViewAdapter.h"

@interface CHGTableViewHeaderFooterView : UITableViewHeaderFooterView

@property(nonatomic,copy) CHGEventTransmissionBlock eventTransmissionBlock;
@property(nonatomic,assign) NSInteger section;
@property(nonatomic,weak) UITableView * tableView;
@property(nonatomic,strong) id headerFooterData;
@property(nonatomic,assign) CHGTableViewHeaderFooterViewType type;

/**
 必须重写这个方法 子类应该在这个方法中给HeaderFooterView中的各个view设定value
 @param section 当前HeaderFooterView在UITableView中的位置
 @param tableView 当前HeaderFooterView所在的UITableView
 @param data 当前HeaderFooterView的数据
 @param type 当前类型是header或者footer
 */
-(void)headerFooterForSection:(NSInteger)section inTableView:(UITableView*)tableView withData:(id)data type:(CHGTableViewHeaderFooterViewType)type NS_REQUIRES_SUPER;

@end