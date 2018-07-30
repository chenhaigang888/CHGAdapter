//
//  UITableView+CHGSimpleTableViewAdapter.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/7/30.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "UITableView+CHGSimpleTableViewAdapter.h"
#import "UITableView+CHGTableViewAdapter.h"
#import "CHGSimpleTableViewAdapter.h"
#import <objc/runtime.h>

@implementation UITableView (CHGSimpleTableViewAdapter)

+ (void)load {
    Method fromeInitModelMethod = class_getInstanceMethod([self class], @selector(tableViewAdapter));
    Method toInitModelMethod = class_getInstanceMethod([self class], @selector(swizzlingTableViewAdapter));
    if (!class_addMethod([self class], @selector(swizzlingTableViewAdapter), method_getImplementation(toInitModelMethod), method_getTypeEncoding(toInitModelMethod))) {
        method_exchangeImplementations(fromeInitModelMethod, toInitModelMethod);
    }
}

-(void)setAdapterData:(CHGTableViewAdapterData *)adapterData {
    self.tableViewAdapter.adapterData = adapterData;
}

-(CHGTableViewAdapterData*)adapterData {
    return self.tableViewAdapter.adapterData;
}

- (CHGTableViewAdapter *)swizzlingTableViewAdapter {
    CHGTableViewAdapter * adapter = [self swizzlingTableViewAdapter];
    if (!adapter) {
        self.tableViewAdapter = [CHGSimpleTableViewAdapter new];
        return [self swizzlingTableViewAdapter];
    }
    return adapter;
}

@end
