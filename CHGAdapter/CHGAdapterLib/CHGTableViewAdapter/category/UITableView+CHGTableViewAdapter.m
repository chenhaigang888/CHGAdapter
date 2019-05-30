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
#import "CHGTableViewCell.h"
#import "CHGTableViewHeaderFooterView.h"
#import "CHGSimpleTableViewAdapter.h"

static const void * tableViewAdapterKey = &tableViewAdapterKey;
static const void * eventTransmissionBlockKey = &eventTransmissionBlockKey;
static const void * tableViewDidSelectRowBlockKey = &tableViewDidSelectRowBlockKey;
static const void * tableViewEmptyDataShowKey = &tableViewEmptyDataShowKey;
static const void * scrollListenerKey = &scrollListenerKey;

@implementation UITableView (CHGTableViewAdapter)

+ (void)load{
    [[self class] m1];
    [[self class] m2];
    [[self class] m3];
}

+(void)m1{
    Method fromeInitModelMethod = class_getInstanceMethod([self class], @selector(dequeueReusableCellWithIdentifier:));
    Method toInitModelMethod = class_getInstanceMethod([self class], @selector(swizzlingDequeueReusableCellWithIdentifier:));
    if (!class_addMethod([self class], @selector(swizzlingDequeueReusableCellWithIdentifier:), method_getImplementation(toInitModelMethod), method_getTypeEncoding(toInitModelMethod))) {
        method_exchangeImplementations(fromeInitModelMethod, toInitModelMethod);
    }
}

+(void)m2{
    Method fromeInitModelMethod = class_getInstanceMethod([self class], @selector(dequeueReusableCellWithIdentifier:forIndexPath:));
    Method toInitModelMethod = class_getInstanceMethod([self class], @selector(swizzlingDequeueReusableCellWithIdentifier:forIndexPath:));
    if (!class_addMethod([self class], @selector(swizzlingDequeueReusableCellWithIdentifier:forIndexPath:), method_getImplementation(toInitModelMethod), method_getTypeEncoding(toInitModelMethod))) {
        method_exchangeImplementations(fromeInitModelMethod, toInitModelMethod);
    }
}

+(void)m3{
    Method fromeInitModelMethod = class_getInstanceMethod([self class], @selector(dequeueReusableHeaderFooterViewWithIdentifier:));
    Method toInitModelMethod = class_getInstanceMethod([self class], @selector(swizzlingDequeueReusableHeaderFooterViewWithIdentifier:));
    if (!class_addMethod([self class], @selector(swizzlingDequeueReusableHeaderFooterViewWithIdentifier:), method_getImplementation(toInitModelMethod), method_getTypeEncoding(toInitModelMethod))) {
        method_exchangeImplementations(fromeInitModelMethod, toInitModelMethod);
    }
}

- (nullable __kindof UITableViewCell *)swizzlingDequeueReusableCellWithIdentifier:(NSString *)identifier {
    UITableViewCell * cell = [self swizzlingDequeueReusableCellWithIdentifier:identifier];
    if ([cell isKindOfClass:[CHGTableViewCell class]]) {
        [((CHGTableViewCell*)cell) cellWillReuseWithIdentifier:identifier];
    }
    return cell;
}

- (__kindof UITableViewCell *)swizzlingDequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [self swizzlingDequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    if ([cell isKindOfClass:[CHGTableViewCell class]]) {
        [((CHGTableViewCell*)cell) cellWillReuseWithIdentifier:identifier indexPath:indexPath];
    }
    return cell;
}

- (nullable __kindof UITableViewHeaderFooterView *)swizzlingDequeueReusableHeaderFooterViewWithIdentifier:(NSString *)identifier {
    UITableViewHeaderFooterView * headerFooterView = [self swizzlingDequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if ([headerFooterView isKindOfClass:[CHGTableViewHeaderFooterView class]]) {
        [((CHGTableViewHeaderFooterView*)headerFooterView) headerFooterViewWillReuseWithIdentifier:identifier];
    }
    return headerFooterView;
}

-(CHGTableViewAdapter*)tableViewAdapter {
    return objc_getAssociatedObject(self, tableViewAdapterKey);
}

-(void)setTableViewAdapter:(CHGTableViewAdapter *)tableViewAdapter{
    objc_setAssociatedObject(self, tableViewAdapterKey, tableViewAdapter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = tableViewAdapter;
    self.dataSource = tableViewAdapter;
}

-(void)setScrollListener:(CHGScrollListener *)scrollListener {
    objc_setAssociatedObject(self, scrollListenerKey, scrollListener, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CHGScrollListener *)scrollListener {
    id obj = objc_getAssociatedObject(self, scrollListenerKey);
    if (!obj) {
        self.scrollListener = [CHGScrollListener new];
        return self.scrollListener;
    }
    return obj;
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
