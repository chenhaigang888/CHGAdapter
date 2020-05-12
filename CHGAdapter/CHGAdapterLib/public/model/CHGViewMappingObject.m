//
//  CHGViewMappingObject.m
//  CHGAdapter
//
//  Created by dnaer5 on 2020/5/11.
//  Copyright © 2020 chen haiGang. All rights reserved.
//

#import "CHGViewMappingObject.h"


@implementation CHGViewMappingObject


+(instancetype)initWithView:(id<CHGViewPropertyProtocol>)view mapping:(NSDictionary * _Nullable)mapping {
    CHGViewMappingObject * model = [CHGViewMappingObject new];
    model.view = view;
    model.mapping = mapping;
    return model;
}

@end
