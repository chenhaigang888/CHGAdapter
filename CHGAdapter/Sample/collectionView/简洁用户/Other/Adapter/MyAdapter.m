//
//  MyAdapter.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/8/17.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "MyAdapter.h"


@implementation MyAdapter

/**
 * 每个item的高度
 */
- (CGFloat)waterFallLayout:(TestLayout *)waterFallLayout heightForItemAtIndexPath:(NSUInteger)indexPath itemWidth:(CGFloat)itemWidth {
    
    return indexPath * 10+ 50;
}

@end
