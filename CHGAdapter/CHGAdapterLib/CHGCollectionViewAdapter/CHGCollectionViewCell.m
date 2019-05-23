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

@synthesize cellData;

@synthesize eventTransmissionBlock;

@synthesize indexPath;

@synthesize targetView;


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

- (void)cellForRowAtIndexPath:(NSIndexPath *)indexPath targetView:(UIView *)targetView withData:(id)data {
    self.indexPath = indexPath;
    self.targetView = targetView;
    self.cellData = data;
}

/**
 cell将要显示
 */
-(void)cellWillAppear {
    
}

/**
 cell已经消失
 */
-(void)cellDidDisappear {
    
}

- (void)setLayout {
    
}


- (void)setUpSubviews {
    
}


- (void)willReuseWithIdentifier:(nonnull NSString *)identifier {
    
}

- (void)willReuseWithIdentifier:(NSString *)identifier indexPath:(NSIndexPath *)indexPath {
    
}

@end
