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

- (CHGTableViewAdapter *)swizzlingTableViewAdapter {
    CHGTableViewAdapter * adapter = [self swizzlingTableViewAdapter];
    if (!adapter) {
        self.tableViewAdapter = [CHGSimpleTableViewAdapter new];
        return [self swizzlingTableViewAdapter];
    }
    return adapter;
}

-(void)setAdapterData:(CHGTableViewAdapterData *)adapterData {
    self.tableViewAdapter.adapterData = adapterData;
}

-(CHGTableViewAdapterData*)adapterData {
    return self.tableViewAdapter.adapterData;
}

- (NSArray *)cellDatas {
    return self.adapterData.cellDatas;
}

- (void)setCellDatas:(NSArray *)cellDatas {
    self.adapterData.cellDatas = cellDatas;
}

- (NSArray *)headerDatas {
    return (NSArray *)self.adapterData.headerDatas;
}

- (void)setHeaderDatas:(NSArray *)headerDatas {
    self.adapterData.headerDatas = headerDatas;
}

- (NSArray *)footerDatas {
    return self.adapterData.footerDatas;
}

- (void)setFooterDatas:(NSArray *)footerDatas {
    self.adapterData.footerDatas = footerDatas;
}

- (NSArray *)indexDatas {
    return self.adapterData.indexDatas;
}

- (void)setIndexDatas:(NSArray *)indexDatas {
    self.adapterData.indexDatas = indexDatas;
}

- (id)customData {
    return self.adapterData.customData;
}

- (void)setCustomData:(id)customData {
    self.adapterData.customData = customData;
}


@end
