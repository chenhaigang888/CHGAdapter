//
//  CHGCollectionViewCell.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/15.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "CHGCollectionViewCell.h"
#import "CHGCollectionViewAdapter.h"

@implementation CHGCollectionViewCell


@synthesize indexPath = _indexPath;

@synthesize targetView = _targetView;

@synthesize eventTransmissionBlock = _eventTransmissionBlock;

@synthesize model = _model;

@synthesize protocols = _protocols;

- (NSMutableArray *)protocols {
    if (!_protocols) {
        _protocols = [NSMutableArray array];
    }
    return _protocols;
}

- (void)setEventTransmissionBlock:(CHGEventTransmissionBlock)eventTransmissionBlock {
    _eventTransmissionBlock = eventTransmissionBlock;
    for (id protocol in self.protocols) {
        [protocol setEventTransmissionBlock:eventTransmissionBlock];
    }
}

-(UICollectionView*)getCollectionView {
    return (UICollectionView*)self.targetView;
}

/**
 获取当前Adapter的tag
 
 @return 返回tag
 */
-(NSInteger)adapterTag {
    return [self getCollectionView].collectionViewAdapter.tag;
}

/**
 获取AdapterData中的customData
 
 @return 获取AdapterData中的customData
 */
-(id)customData {
    return [self getCollectionView].collectionViewAdapter.adapterData.customData;
}

/**
 返回当前cell所在的controller
 
 @return 返回当前cell所在的controller
 */
-(UIViewController*)controller {
    return [self getCollectionView].collectionViewAdapter.controller;
}

- (void)setLayout {
    
}


- (void)setUpSubviews {
    
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




@end
