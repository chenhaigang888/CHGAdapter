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

static const void * collectionViewAdapterKey = &collectionViewAdapterKey;
static const void * eventTransmissionBlockKey = &eventTransmissionBlockKey;
static const void * collectionViewEmptyDataShowKey = &collectionViewEmptyDataShowKey;
static const void * collectionViewDidSelectItemAtIndexPathBlockKey = &collectionViewDidSelectItemAtIndexPathBlockKey;

@implementation UICollectionView (CHGCollectionViewAdapter)

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
    return objc_getAssociatedObject(self, collectionViewEmptyDataShowKey);
}

-(void)setCollectionViewDidSelectItemAtIndexPathBlock:(CHGCollectionViewDidSelectItemAtIndexPathBlock)collectionViewDidSelectItemAtIndexPathBlock {
    objc_setAssociatedObject(self, collectionViewDidSelectItemAtIndexPathBlockKey, collectionViewDidSelectItemAtIndexPathBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(CHGCollectionViewDidSelectItemAtIndexPathBlock)collectionViewDidSelectItemAtIndexPathBlock {
    return objc_getAssociatedObject(self, collectionViewDidSelectItemAtIndexPathBlockKey);
}

///设置没有数据的显示
-(void)setEmptyDataShowWithTitle:(NSString*)title image:(NSString*)imageName {
    CHGCollectionViewEmptyDataShow * collectionViewEmptyDataShow = [CHGCollectionViewEmptyDataShow new];
    collectionViewEmptyDataShow.imageName = imageName;
    collectionViewEmptyDataShow.title = title;
    collectionViewEmptyDataShow.emptyDataSetShouldAllowScroll = YES;
    self.collectionViewEmptyDataShow = collectionViewEmptyDataShow;
}

-(void)setEmptyDataSetSource:(id<DZNEmptyDataSetSource>)dataSource emptyDataSetDelegate:(id<DZNEmptyDataSetDelegate>)delegate {
    self.emptyDataSetSource = dataSource;
    self.emptyDataSetDelegate = delegate;
}


@end
