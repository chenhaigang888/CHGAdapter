//
//  UITableView+CHGTableViewAdapter.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/10.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "UITableView+CHGTableViewAdapter.h"
#import <objc/runtime.h>
#import "CHGTableViewEmptyDataShow.h"

static const void * tableViewAdapterKey = &tableViewAdapterKey;
static const void * eventTransmissionBlockKey = &eventTransmissionBlockKey;
static const void * tableViewDidSelectRowBlockKey = &tableViewDidSelectRowBlockKey;
static const void * tableViewEmptyDataShowKey = &tableViewEmptyDataShowKey;

@implementation UITableView (CHGTableViewAdapter)


-(CHGTableViewAdapter*)tableViewAdapter {
    return objc_getAssociatedObject(self, tableViewAdapterKey);
}

-(void)setTableViewAdapter:(CHGTableViewAdapter *)tableViewAdapter{
    objc_setAssociatedObject(self, tableViewAdapterKey, tableViewAdapter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = tableViewAdapter;
    self.dataSource = tableViewAdapter;
}

-(void)setEventTransmissionBlock:(CHGEventTransmissionBlock)eventTransmissionBlock {
    objc_setAssociatedObject(self, eventTransmissionBlockKey, eventTransmissionBlock, OBJC_ASSOCIATION_COPY);
}

-(CHGEventTransmissionBlock)eventTransmissionBlock {
    return objc_getAssociatedObject(self, eventTransmissionBlockKey);
}

-(void)setTableViewDidSelectRowBlock:(CHGTableViewDidSelectRowBlock)tableViewDidSelectRowBlock {
    objc_setAssociatedObject(self, tableViewDidSelectRowBlockKey, tableViewDidSelectRowBlock, OBJC_ASSOCIATION_COPY);
}

-(CHGTableViewDidSelectRowBlock)tableViewDidSelectRowBlock {
    return objc_getAssociatedObject(self, tableViewDidSelectRowBlockKey);
}

-(void)setTableViewEmptyDataShow:(CHGTableViewEmptyDataShow *)tableViewEmptyDataShow {
    objc_setAssociatedObject(self, tableViewEmptyDataShowKey, tableViewEmptyDataShow, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setEmptyDataSetSource:tableViewEmptyDataShow emptyDataSetDelegate:tableViewEmptyDataShow];
}

-(CHGTableViewEmptyDataShow*)tableViewEmptyDataShow {
    return objc_getAssociatedObject(self, tableViewEmptyDataShowKey);
}

///设置没有数据的显示
-(void)setEmptyDataShowWithTitle:(NSString*)title image:(NSString*)imageName {
    CHGTableViewEmptyDataShow * tableViewEmptyDataShow = [CHGTableViewEmptyDataShow new];
    tableViewEmptyDataShow.imageName = imageName;
    tableViewEmptyDataShow.title = title;
    tableViewEmptyDataShow.emptyDataSetShouldAllowScroll = YES;
    self.tableViewEmptyDataShow = tableViewEmptyDataShow;
}

-(void)setEmptyDataSetSource:(id<DZNEmptyDataSetSource>)dataSource emptyDataSetDelegate:(id<DZNEmptyDataSetDelegate>)delegate {
    self.emptyDataSetSource = dataSource;
    self.emptyDataSetDelegate = delegate;
}

-(void)hiddHeadView {
    self.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 0.0001)];
}

-(void)hiddenFooterView {
    self.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
}

-(void)autoHeight{
    self.estimatedRowHeight = 44;
    self.rowHeight = UITableViewAutomaticDimension;
    CHGTableViewAdapter * adapter = self.tableViewAdapter;
    adapter.cellHeight = -1;
}



@end
