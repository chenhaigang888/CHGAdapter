//
//  CustomAdapter.m
//  demo
//
//  Created by chen haiGang on 2018/5/14.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "CustomAdapter.h"

@implementation CustomAdapter

-(NSString*)obtainCellNameWithCellData:(id)data tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row %2 == 0){
        return @"Style1TableViewCell";
    } else {
        return @"Style2TableViewCell";
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row %2 == 0){
        return 44;
    } else {
        return 60;
    }
}

@end
