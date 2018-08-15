//
//  AddressNoSelectModel.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/7/28.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "AddressNoSelectModel.h"

@implementation AddressNoSelectModel



-(instancetype)initWithStatus:(NSInteger)status {
    self = [super init];
    if (self) {
        self.status = status;
    }
    return self;
}

-(NSString*)getCellClass {
    if (self.status == 0) {
        return @"AddressNoSelectTableViewCell";//未选择地址
    } else {
        return @"AddressSelectedTableViewCell";//已经选择地址
    }
}

//- (NSString *)cellClassNameInTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
//    if (self.status == 0) {
//        return @"AddressNoSelectTableViewCell";//未选择地址
//    } else {
//        return @"AddressSelectedTableViewCell";//已经选择地址
//    }
//}

- (CGFloat)cellHeighInTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    //    return -1;//-1会自动适应高度
    if (self.status == 0) {
        return 44;//未选择地址的cell高度
    } else {
        return 100;//已经选择地址cell高度
    }
}

@end
