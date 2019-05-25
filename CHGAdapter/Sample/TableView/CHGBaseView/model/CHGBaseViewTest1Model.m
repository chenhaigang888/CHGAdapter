//
//  CHGBaseViewTest1Model.m
//  CHGAdapter
//
//  Created by DNAER5 on 2019/5/25.
//  Copyright © 2019 chen haiGang. All rights reserved.
//

#import "CHGBaseViewTest1Model.h"

@implementation CHGBaseViewTest1Model

- (NSString *)cellClassNameInTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    return @"CHGBaseViewTest1ModelTableViewCell";
}

- (CGFloat)cellHeighInTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    return -1;
}

@end
