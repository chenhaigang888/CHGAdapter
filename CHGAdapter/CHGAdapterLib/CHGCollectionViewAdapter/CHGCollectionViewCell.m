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

/**
 获取当前Adapter的tag
 
 @return 返回tag
 */
-(NSInteger)adapterTag {
    return self.collectionView.collectionViewAdapter.tag;
}

/**
 获取AdapterData中的customData
 
 @return 获取AdapterData中的customData
 */
-(id)customData {
    return self.collectionView.collectionViewAdapter.adapterData.customData;
}

/**
 返回当前cell所在的controller
 
 @return 返回当前cell所在的controller
 */
-(UIViewController*)controller {
    return self.collectionView.collectionViewAdapter.controller;
}

-(void)cellForRowAtIndexPath:(NSIndexPath *)indexPath collectionView:(UICollectionView*)collectionView withData:(id)data {
    self.indexPath = indexPath;
    self.collectionView = collectionView;
    self.cellData = data;
}

/**
 将被复用
 
 @param identifier identifier
 @param indexPath indexPath
 */
-(void)willReuseWithIdentifier:(NSString*)identifier indexPath:(NSIndexPath*)indexPath {
    
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

@end
