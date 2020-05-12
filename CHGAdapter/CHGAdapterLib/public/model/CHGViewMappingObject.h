//
//  CHGViewMappingObject.h
//  CHGAdapter
//
//  Created by dnaer5 on 2020/5/11.
//  Copyright © 2020 chen haiGang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CHGViewPropertyProtocol.h"
#import "CHGAdapter.h"

NS_ASSUME_NONNULL_BEGIN

@interface CHGViewMappingObject : NSObject

///视图
@property (nonatomic, strong) id<CHGViewPropertyProtocol> view;
///映射
@property (nonatomic, copy) NSDictionary * _Nullable mapping;

+(instancetype)initWithView:(id<CHGViewPropertyProtocol>)view mapping:(NSDictionary * _Nullable)mapping;

@end

NS_ASSUME_NONNULL_END
