//
//  UICollectionView+CHGCollectionViewAdapter.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/14.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "UICollectionView+CHGCollectionViewAdapter.h"
#import "CHGCollectionViewAdapter.h"
#import <objc/runtime.h>
#import "CHGCollectionViewEmptyDataShow.h"
#import "CHGCollectionViewCell.h"
#import "CHGCollectionReusableView.h"

static const void * collectionViewAdapterKey = &collectionViewAdapterKey;
static const void * eventTransmissionBlockKey = &eventTransmissionBlockKey;
static const void * collectionViewEmptyDataShowKey = &collectionViewEmptyDataShowKey;
static const void * collectionViewDidSelectItemAtIndexPathBlockKey = &collectionViewDidSelectItemAtIndexPathBlockKey;
static const void * scrollViewDelegatesKey = &scrollViewDelegatesKey;

@implementation UICollectionView (CHGCollectionViewAdapter)


+ (void)load{
    [[self class] m1];
    [[self class] m2];
}

+(void)m1{
    Method fromeInitModelMethod = class_getInstanceMethod([self class], @selector(dequeueReusableCellWithReuseIdentifier:forIndexPath:));
    Method toInitModelMethod = class_getInstanceMethod([self class], @selector(swizzlingDequeueReusableCellWithReuseIdentifier:forIndexPath:));
    if (!class_addMethod([self class], @selector(swizzlingDequeueReusableCellWithReuseIdentifier:forIndexPath:), method_getImplementation(toInitModelMethod), method_getTypeEncoding(toInitModelMethod))) {
        method_exchangeImplementations(fromeInitModelMethod, toInitModelMethod);
    }
}

+(void)m2{
    Method fromeInitModelMethod = class_getInstanceMethod([self class], @selector(dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:));
    Method toInitModelMethod = class_getInstanceMethod([self class], @selector(swizzlingDequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:));
    if (!class_addMethod([self class], @selector(swizzlingDequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:), method_getImplementation(toInitModelMethod), method_getTypeEncoding(toInitModelMethod))) {
        method_exchangeImplementations(fromeInitModelMethod, toInitModelMethod);
    }
}

- (__kindof UICollectionViewCell *)swizzlingDequeueReusableCellWithReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell * cell = [self swizzlingDequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    if ([cell isKindOfClass:[CHGCollectionViewCell class]]) {
        [((CHGCollectionViewCell*)cell) cellWillReuseWithIdentifier:identifier indexPath:indexPath];
    }
    return cell;
}

- (__kindof UICollectionReusableView *)swizzlingDequeueReusableSupplementaryViewOfKind:(NSString *)elementKind withReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView * reusableView = [self swizzlingDequeueReusableSupplementaryViewOfKind:elementKind withReuseIdentifier:identifier forIndexPath:indexPath];
    if ([reusableView isKindOfClass:[CHGCollectionReusableView class]]) {
        [((CHGCollectionReusableView*)reusableView) reusableViewWillReuseWithIdentifier:identifier indexPath:indexPath];
    }
    return reusableView;
}


-(void)setCollectionViewAdapter:(CHGCollectionViewAdapter *)collectionViewAdapter {
    objc_setAssociatedObject(self, collectionViewAdapterKey, collectionViewAdapter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = collectionViewAdapter;
    self.dataSource = collectionViewAdapter;
}

-(CHGCollectionViewAdapter*)collectionViewAdapter {
    return objc_getAssociatedObject(self, collectionViewAdapterKey);
}

-(void)setEventTransmissionBlock:(CHGEventTransmissionBlock)eventTransmissionBlock {
    objc_setAssociatedObject(self, eventTransmissionBlockKey, eventTransmissionBlock, OBJC_ASSOCIATION_COPY);
}

-(CHGEventTransmissionBlock)eventTransmissionBlock {
    return objc_getAssociatedObject(self, eventTransmissionBlockKey);
}

-(void)setCollectionViewEmptyDataShow:(CHGCollectionViewEmptyDataShow *)collectionViewEmptyDataShow {
    objc_setAssociatedObject(self, collectionViewEmptyDataShowKey, collectionViewEmptyDataShow, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setEmptyDataSetSource:collectionViewEmptyDataShow emptyDataSetDelegate:collectionViewEmptyDataShow];
}

-(CHGCollectionViewEmptyDataShow*)collectionViewEmptyDataShow {
    CHGCollectionViewEmptyDataShow * collectionViewEmptyDataShow = objc_getAssociatedObject(self, collectionViewEmptyDataShowKey);
    if (!collectionViewEmptyDataShow) {
        self.collectionViewEmptyDataShow = [CHGCollectionViewEmptyDataShow new];
        return self.collectionViewEmptyDataShow;
    }
    return collectionViewEmptyDataShow;
}

-(void)setCollectionViewDidSelectItemAtIndexPathBlock:(CHGCollectionViewDidSelectItemAtIndexPathBlock)collectionViewDidSelectItemAtIndexPathBlock {
    objc_setAssociatedObject(self, collectionViewDidSelectItemAtIndexPathBlockKey, collectionViewDidSelectItemAtIndexPathBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(CHGCollectionViewDidSelectItemAtIndexPathBlock)collectionViewDidSelectItemAtIndexPathBlock {
    return objc_getAssociatedObject(self, collectionViewDidSelectItemAtIndexPathBlockKey);
}

///设置没有数据的显示
-(void)setEmptyDataShowWithTitle:(NSString*)title image:(NSString*)imageName {
    self.collectionViewEmptyDataShow.imageName = imageName;
    self.collectionViewEmptyDataShow.title = title;
}

-(void)setEmptyDataSetSource:(id<DZNEmptyDataSetSource>)dataSource emptyDataSetDelegate:(id<DZNEmptyDataSetDelegate>)delegate {
    self.emptyDataSetSource = dataSource;
    self.emptyDataSetDelegate = delegate;
}


- (void)setScrollViewDelegates:(NSArray<id<CHGScrollViewDelegate>> *)scrollViewDelegates {
    objc_setAssociatedObject(self, scrollViewDelegatesKey, scrollViewDelegates, OBJC_ASSOCIATION_COPY);
}


- (NSArray<id<CHGScrollViewDelegate>> *)scrollViewDelegates {
    id obj = objc_getAssociatedObject(self, scrollViewDelegatesKey);
    if (!obj) {
        self.scrollViewDelegates = [NSMutableArray<id<CHGScrollViewDelegate>> array];
        return self.scrollViewDelegates;
    }
    return obj;
}

///添加滚动监听
-(void)addCHGScrollViewDelegate:(id<CHGScrollViewDelegate>)scrollViewDelegate {
    if (scrollViewDelegate && ![self.scrollViewDelegates containsObject:scrollViewDelegate]) {
        NSMutableArray * temp = [self.scrollViewDelegates mutableCopy];
        [temp addObject:scrollViewDelegate];
        self.scrollViewDelegates = temp;
    }
}

-(void)removeCHGScrollViewDelegate:(id<CHGScrollViewDelegate>)scrollViewDelegate {
    NSMutableArray * temp = [self.scrollViewDelegates mutableCopy];
    [temp removeObject:scrollViewDelegate];
    self.scrollViewDelegates = temp;
}



@end
