//
//  CHGCollectionViewCell.h
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/15.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICollectionView+CHGCollectionViewAdapter.h"
#import "CHGCellLifeCycleProtocol.h"

@interface CHGCollectionViewCell : UICollectionViewCell<CHGCellLifeCycleProtocol>

-(UICollectionView*)getCollectionView;

@end
