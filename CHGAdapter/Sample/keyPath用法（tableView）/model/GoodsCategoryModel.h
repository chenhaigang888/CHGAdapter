//
//  GoodsCategoryModel.h
//  CHGAdapter
//
//  Created by chen haiGang on 2018/9/12.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CHGAdapter.h"

@interface GoodsModel : NSObject<CHGTableViewCellModelProtocol>

@property (nonatomic,copy) NSString *name;
@property (nonatomic,strong) NSNumber *price;

+(instancetype)initWithName:(NSString*)name price:(NSNumber*)price;

@end

@interface GoodsCategoryModel : NSObject<CHGTableViewHeaderFooterModelProtocol>

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSArray<GoodsModel*> *goods;

+(instancetype)initWithName:(NSString*)name goods:(NSArray<GoodsModel*>*) goods;

@end
