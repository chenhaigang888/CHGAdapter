//
//  MyAdapter.h
//  CHGAdapter
//
//  Created by chen haiGang on 2018/8/17.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "CHGSimpleCollectionViewAdapter.h"
#import "TestLayout.h"
///如果CHGSimpleCollectionViewAdapter不能满足你的需求，可以继承CHGCollectionViewAdapter、CHGSimpleCollectionViewAdapter 增加或重新新方法
@interface MyAdapter : CHGSimpleCollectionViewAdapter<LMHWaterFallLayoutDeleaget>

@end
