//
//  TestAdapter.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/12.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "TestAdapter.h"

@implementation TestAdapter

-(NSString*)obtainCellNameWithCellData:(id)data tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return @"SimpleTableViewCell";
    }
    return @"Simple2TableViewCell";
}

@end
