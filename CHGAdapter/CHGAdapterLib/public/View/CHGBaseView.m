//
//  CHGBaseView.m
//  CHGAdapter
//
//  Created by DNAER5 on 2019/5/25.
//  Copyright © 2019 chen haiGang. All rights reserved.
//

#import "CHGBaseView.h"



@implementation CHGBaseView

#pragma -mark CHGViewPropertyProtocol propertys and method

@synthesize eventTransmissionBlock = _eventTransmissionBlock;

@synthesize indexPath = _indexPath;

@synthesize model = _model;

@synthesize protocols = _protocols;

@synthesize targetView = _targetView;

- (void)setEventTransmissionBlock:(CHGEventTransmissionBlock)eventTransmissionBlock {
    _eventTransmissionBlock = eventTransmissionBlock;
    for (id protocol in self.protocols) {
        [protocol setEventTransmissionBlock:eventTransmissionBlock];
    }
}

#pragma - mark CHGViewLifeCycleProtocol method
- (NSMutableArray *)protocols {
    if (!_protocols) {
        _protocols = [NSMutableArray array];
    }
    return _protocols;
}

/**
 cell将要显示
 */
-(void)cellWillAppear {
    for (id protocol in self.protocols) {
        [protocol cellWillAppear];
    }
}

/**
 cell已经消失
 */
-(void)cellDidDisappear {
    for (id protocol in self.protocols) {
        [protocol cellDidDisappear];
    }
}

- (void)cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath targetView:(nonnull UIView *)targetView withData:(nonnull id)data {
    self.indexPath = indexPath;
    self.targetView = targetView;
    self.model = data;
    for (id protocol in self.protocols) {
        [protocol cellForRowAtIndexPath:indexPath targetView:targetView withData:data];
    }
}

- (void)cellWillReuseWithIdentifier:(nonnull NSString *)identifier {
    for (id protocol in self.protocols) {
        [protocol cellWillReuseWithIdentifier:identifier];
    }
}


- (void)cellWillReuseWithIdentifier:(nonnull NSString *)identifier indexPath:(nonnull NSIndexPath *)indexPath {
    for (id protocol in self.protocols) {
        [protocol cellWillReuseWithIdentifier:identifier indexPath:indexPath];
    }
}

#pragma -mark CHGTableViewHeaderFooterLifeCycleProtocol method

@synthesize section = _section;

@synthesize type = _type;

- (void)headerFooterForSection:(NSInteger)section inTableView:(nonnull UITableView *)tableView withData:(nonnull id)data type:(CHGTableViewHeaderFooterViewType)type {
    self.section = section;
    self.targetView = tableView;
    self.model = data;
    self.type = type;
    for (id protocol in self.protocols) {
        [protocol headerFooterForSection:section inTableView:tableView withData:data type:type];
    }
}

- (void)headerFooterViewDidDisAppearWithType:(CHGTableViewHeaderFooterViewType)type {
    for (id protocol in self.protocols) {
        [protocol headerFooterViewDidDisAppearWithType:type];
    }
}

- (void)headerFooterViewWillAppearWithType:(CHGTableViewHeaderFooterViewType)type {
    for (id protocol in self.protocols) {
        [protocol headerFooterViewWillAppearWithType:type];
    }
}

- (void)headerFooterViewWillReuseWithIdentifier:(nonnull NSString *)identifier {
    for (id protocol in self.protocols) {
        [protocol headerFooterViewWillReuseWithIdentifier:identifier];
    }
}


#pragma -mark CHGCollectionReusableViewLifeCycleProtocol method

@synthesize kind = _kind;

- (void)reusableViewForCollectionView:(nonnull UICollectionView *)collectionView indexPath:(nonnull NSIndexPath *)indexPath kind:(nonnull NSString *)kind reusableViewData:(nonnull id)reusableViewData {
    self.targetView = collectionView;
    self.indexPath = indexPath;
    self.kind = kind;
    self.model = reusableViewData;
    for (id protocol in self.protocols) {
        [protocol reusableViewForCollectionView:collectionView indexPath:indexPath kind:kind reusableViewData:reusableViewData];
    }
}

- (void)reusableViewDidDisappear {
    for (id protocol in self.protocols) {
        [protocol reusableViewDidDisappear];
    }
}

- (void)reusableViewWillAppear {
    for (id protocol in self.protocols) {
        [protocol reusableViewWillAppear];
    }
}

- (void)reusableViewWillReuseWithIdentifier:(nonnull NSString *)identifier indexPath:(nonnull NSIndexPath *)indexPath {
    for (id protocol in self.protocols) {
        [protocol reusableViewWillReuseWithIdentifier:identifier indexPath:indexPath];
    }
}





@end





