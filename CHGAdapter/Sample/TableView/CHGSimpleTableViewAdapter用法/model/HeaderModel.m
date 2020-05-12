//
//  HeaderModel.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/7/28.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "HeaderModel.h"

@implementation HeaderModel


-(instancetype)initWithHeaderTitle:(NSString*)headerTitle {
    self = [super init];
    if (self) {
        self.headerTitle = headerTitle;
    }
    return self;
}

- (NSString *)headerFooterClassInTableView:(UITableView *)tableView section:(NSInteger)section type:(CHGAdapterViewType)type {
    return @"HeaderView";
}

- (CGFloat)headerFooterHeighInTableView:(UITableView *)tableView section:(NSInteger)section type:(CHGAdapterViewType)type {
    return 30;
}

@end
